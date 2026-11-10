#!/bin/bash

###############################################################################
# Script de verificación de salud de recursos aprovisionados
# Servicio: Notificaciones Fintech
# Entorno: Dev/Prod
###############################################################################

set -euo pipefail

# Colores para salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Variables de entorno con valores por defecto
AWS_REGION="${AWS_REGION:-us-east-1}"
ENVIRONMENT="${ENVIRONMENT:-dev}"
MAX_RETRIES=3
RETRY_DELAY=5

# Función para imprimir mensajes con timestamp
log() {
    local level=$1
    local message=$2
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "${timestamp} [${level}] ${message}"
}

# Función para mensajes de éxito
log_success() {
    log "${GREEN}SUCCESS${NC}" "$1"
}

# Función para mensajes de error
log_error() {
    log "${RED}ERROR${NC}" "$1"
}

# Función para mensajes de advertencia
log_warning() {
    log "${YELLOW}WARNING${NC}" "$1"
}

# Función para verificar si AWS CLI está disponible
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        log_error "AWS CLI no está instalado o no está en PATH"
        exit 1
    fi
    log_success "AWS CLI disponible"
}

# Función para verificar credenciales de AWS
check_aws_credentials() {
    if ! aws sts get-caller-identity &> /dev/null; then
        log_error "Credenciales de AWS no configuradas o inválidas"
        exit 1
    fi
    local account_id
    account_id=$(aws sts get-caller-identity --query 'Account' --output text)
    log_success "Credenciales válidas para cuenta: ${account_id}"
}

# Función para verificar estado de instancias EC2
check_ec2_instances() {
    local instance_count=0
    local running_count=0
    local stopped_count=0
    local unhealthy_count=0

    log "INFO" "Verificando instancias EC2 en región ${AWS_REGION}..."

    # Obtener todas las instancias con tag Service=notifications
    local instances
    instances=$(aws ec2 describe-instances \
        --filters "Name=tag:Service,Values=notifications" \
                  "Name=tag:Environment,Values=${ENVIRONMENT}" \
        --query 'Reservations[].Instances[].{Id:InstanceId,State:State.Name,Ip:PrivateIpAddress}' \
        --output json 2>/dev/null || echo "[]")

    if [[ "$instances" == "[]" || -z "$instances" ]]; then
        log_warning "No se encontraron instancias para el servicio de notificaciones"
        return 1
    fi

    instance_count=$(echo "$instances" | jq -r '. | length')
    log "INFO" "Instancias encontradas: ${instance_count}"

    for row in $(echo "$instances" | jq -r '.[] | @base64'); do
        local instance_id state ip
        instance_id=$(echo "$row" | base64 --decode | jq -r '.Id')
        state=$(echo "$row" | base64 --decode | jq -r '.State')
        ip=$(echo "$row" | base64 --decode | jq -r '.Ip')

        case "$state" in
            "running")
                ((running_count++))
                log_success "Instancia ${instance_id} esté ejecutándose (IP: ${ip})"
                ;;
            "stopped")
                ((stopped_count++))
                log_error "Instancia ${instance_id} está detenida"
                ;;
            *)
                ((unhealthy_count++))
                log_warning "Instancia ${instance_id} en estado: ${state}"
                ;;
        esac
    done

    if [[ $running_count -eq 0 ]]; then
        log_error "No hay instancias en ejecución"
        return 1
    fi

    log_success "Verificación de instancias: ${running_count} ejecutándose, ${stopped_count} detenidas, ${unhealthy_count} en otro estado"
    return 0
}

# Función para verificar grupos de seguridad
check_security_groups() {
    log "INFO" "Verificando grupos de seguridad..."

    # Buscar grupo de seguridad por tag
    local sg_id
    sg_id=$(aws ec2 describe-security-groups \
        --filters "Name=tag:Service,Values=notifications" \
                  "Name=tag:Environment,Values=${ENVIRONMENT}" \
        --query 'SecurityGroups[0].GroupId' \
        --output text 2>/dev/null || echo "")

    if [[ -z "$sg_id" || "$sg_id" == "None" ]]; then
        log_error "No se encontró grupo de seguridad para el servicio"
        return 1
    fi

    log_success "Grupo de seguridad encontrado: ${sg_id}"

    # Verificar reglas de entrada
    local ingress_count
    ingress_count=$(aws ec2 describe-security-groups \
        --group-ids "$sg_id" \
        --query 'SecurityGroups[0].IpPermissions[].FromPort' \
        --output json 2>/dev/null | jq 'length')

    log "INFO" "Reglas de entrada configuradas: ${ingress_count}"

    # Verificar reglas de salida
    local egress_count
    egress_count=$(aws ec2 describe-security-groups \
        --group-ids "$sg_id" \
        --query 'SecurityGroups[0].IpPermissionsEgress[].FromPort' \
        --output json 2>/dev/null | jq 'length')

    log "INFO" "Reglas de salida configuradas: ${egress_count}"

    return 0
}

# Función para verificar conectividad a puertos críticos
check_connectivity() {
    log "INFO" "Verificando conectividad a puertos del servicio..."

    # Obtener IPs privadas de las instancias
    local ips
    ips=$(aws ec2 describe-instances \
        --filters "Name=tag:Service,Values=notifications" \
                  "Name=tag:Environment,Values=${ENVIRONMENT}" \
                  "Name=instance-state-name,Values=running" \
        --query 'Reservations[].Instances[].PrivateIpAddress' \
        --output text 2>/dev/null || echo "")

    if [[ -z "$ips" ]]; then
        log_warning "No hay instancias en ejecución para verificar conectividad"
        return 1
    fi

    # Puerto HTTP (80) y HTTPS (443) y puerto de aplicación (8080)
    local ports=("80" "443" "8080")
    local reachable_count=0

    for ip in $ips; do
        for port in "${ports[@]}"; do
            if timeout 3 bash -c "echo >/dev/tcp/${ip}/${port}" 2>/dev/null; then
                ((reachable_count++))
                log_success "Puerto ${port} accesible en ${ip}"
            else
                log_warning "Puerto ${port} no accesible en ${ip}"
            fi
        done
    done

    return 0
}

# Función para verificar estado de servicios en instancias
check_service_health() {
    log "INFO" "Verificando salud de servicios en instancias..."

    local instances
    instances=$(aws ec2 describe-instances \
        --filters "Name=tag:Service,Values=notifications" \
                  "Name=tag:Environment,Values=${ENVIRONMENT}" \
                  "Name=instance-state-name,Values=running" \
        --query 'Reservations[].Instances[].InstanceId' \
        --output text 2>/dev/null || echo "")

    if [[ -z "$instances" ]]; then
        log_warning "No hay instancias en ejecución para verificar servicios"
        return 1
    fi

    # Usar Systems Manager para verificar estado del servicio
    for instance_id in $instances; do
        local service_status
        service_status=$(aws ssm describe-instance-information \
            --filters "Key=InstanceIds,Values=${instance_id}" \
            --query 'InstanceInformationList[0].PlatformName' \
            --output text 2>/dev/null || echo "unavailable")

        if [[ "$service_status" != "unavailable" ]]; then
            log_success "Instancia ${instance_id}: Agent SSM disponible (Plataforma: ${service_status})"
        else
            log_warning "Instancia ${instance_id}: Agent SSM no disponible"
        fi
    done

    return 0
}

# Función principal que orquesta todas las verificaciones
main() {
    local exit_code=0

    echo "========================================================================"
    echo "  Healthcheck - Servicio de Notificaciones - Entorno: ${ENVIRONMENT}"
    echo "========================================================================"
    echo ""

    # Verificaciones previas
    check_aws_cli
    check_aws_credentials

    echo ""
    echo "--- Verificación de Recursos de Cómputo ---"
    echo ""

    # Ejecutar verificaciones
    if ! check_ec2_instances; then
        exit_code=1
    fi

    echo ""

    if ! check_security_groups; then
        exit_code=1
    fi

    echo ""

    if ! check_connectivity; then
        exit_code=1
    fi

    echo ""

    if ! check_service_health; then
        exit_code=1
    fi

    echo ""
    echo "========================================================================"

    if [[ $exit_code -eq 0 ]]; then
        log_success "Healthcheck completado exitosamente"
    else
        log_error "Healthcheck completado con errores"
    fi

    echo "========================================================================"

    exit $exit_code
}

# Ejecutar función principal
main "$@"