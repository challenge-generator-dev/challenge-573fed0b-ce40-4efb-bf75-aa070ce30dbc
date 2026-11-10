# Valores específicos para el ambiente de producción del servicio de notificaciones
# Este archivo define la infraestructura de producción - recursos de alta disponibilidad
# y redundancia para garantizar SLAs del servicio de notificaciones en fintech
# Los valores sensibles como contraseñas se injectan desde Secret Manager

# Configuración de red para producción
environment_name             = "prod"
vpc_cidr_block              = "10.1.0.0/16"
availability_zones          = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs         = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs        = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]
database_subnet_cidrs       = ["10.1.21.0/24", "10.1.22.0/24", "10.1.23.0/24"]

# Configuración de cómputo para producción - alta disponibilidad
instance_type               = "t3.large"
instance_count              = 4
min_instance_count          = 2
max_instance_count          = 8
autoscaling_enabled         = true

# Configuración de base de datos para producción - Multi-AZ obligatorio
db_instance_class           = "db.r6g.large"
db_allocated_storage        = 100
db_multi_az                 = true
db_engine_version           = "15.4"
db_name                     = "notifications_prod"
db_backup_retention_days    = 30
db_skip_final_snapshot      = false

# Configuración de red y seguridad - restricciones estrictas
enable_dns_hostnames        = true
enable_vpc_flow_logs        = true
allowed_cidr_blocks         = ["10.1.0.0/16", "172.16.0.0/12"]
allowed_ssh_cidr            = ["10.1.0.0/16"]

# Configuración de notificaciones y monitoreo - alertas proactivas
enable_notifications        = true
notification_email          = "devops-prod@fintech.com"
alert_threshold_cpu         = 60
alert_threshold_memory      = 70

# Configuración de CDN y cache para producción
enable_cloudfront           = true
cache_ttl_seconds           = 3600

# Configuración de backups automatizados
enable_backup_plan          = true
backup_frequency            = "daily"
backup_window_start         = "03:00"

# Configuración de WAF para protección
enable_waf                  = true
waf_rules                   = ["AWSManagedRulesCommonRuleSet", "AWSManagedRulesSQLiRuleSet"]

# Etiquetas estándar para todos los recursos
tags = {
  Environment = "prod"
  Service     = "notifications"
  Owner       = "devops-team"
  Project     = "fintech-platform"
  CostCenter  = "engineering"
  ManagedBy   = "terraform"
  Compliance  = "SOC2"
  DataClass   = "confidential"
}