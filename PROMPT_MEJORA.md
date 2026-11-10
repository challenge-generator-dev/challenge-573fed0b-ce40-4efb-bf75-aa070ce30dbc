# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261109223818458), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Versionamiento de Infraestructura con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial — objetivo: Configurar el entorno para la gestión de la infraestructura con Terraform. — entregable (NO resolver): Entorno configurado para la gestión de la infraestructura con Terraform.
- Fase 2: Definición de la Infraestructura — objetivo: Definir los recursos de red y cómputo necesarios para el servicio de notificaciones. — entregable (NO resolver): Archivos de configuración de Terraform para la red y el cómputo del servicio de notificaciones.
- Fase 3: Aprovisionamiento y Versionamiento — objetivo: Aprovisionar la infraestructura definida y versionarla. — entregable (NO resolver): Infraestructura aprovisionada y versionada en un repositorio de control de versiones.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: variables.tf ===
# Variables globales para parametrizar la infraestructura por ambiente.
# Estas variables se utilizan en los módulos de red y cómputo para
# personalizar los recursos según el ambiente (dev, prod, etc.).

variable "environment" {
  description = "Ambiente de despliegue (ej: dev, prod)"
  type        = string
}

variable "service_name" {
  description = "Nombre del servicio que se despliega"
  type        = string
  default     = "notifications"
}

variable "owner" {
  description = "Equipo responsable del servicio"
  type        = string
  default     = "fintech-platform"
}

variable "region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
  default     = 2
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos"
  type        = string
  default     = "db.t3.small"
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "notifications_db"
}

variable "db_username" {
  description = "Usuario de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  type        = string
  sensitive   = true
}

// === ARCHIVO: providers.tf ===
# Configuración de proveedores de Terraform para gestionar la infraestructura.
# Este archivo centraliza la configuración del backend S3 y providers alternativos.

# Configuración del backend S3 para almacenar el estado de Terraform.
# El backend permite colaboración y bloqueo para evitar conflictos.
# Los valores específicos del bucket se configuran en terraform.tfvars.
terraform {
  backend "s3" {
    bucket         = "tf-state-notifications-service"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "tf-state-lock-notifications"
  }
}

# Configuración de logging para debugging mediante provider alternativo.
# Este provider usa un alias y permite logs detallados cuando se necesita.
provider "aws" {
  alias = "debug"

  region = var.region

  default_tags {
    tags = {
      Environment = var.environment
      Service     = "${var.service_name}-debug"
      Owner       = var.owner
    }
  }
}

// === ARCHIVO: modules/network/variables.tf ===
# Variables específicas para el módulo de red.
# Estas variables permiten personalizar la configuración de red según el ambiente.

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes privadas"
  type        = list(string)
}

variable "environment" {
  description = "Ambiente de despliegue"
  type        = string
}

variable "service_name" {
  description = "Nombre del servicio"
  type        = string
}

variable "availability_zones" {
  description = "Zonas de disponibilidad donde se desplegarán las subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  description = "Habilitar NAT Gateway para subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Usar un solo NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}

// === ARCHIVO: modules/compute/variables.tf ===
# Variables específicas para el módulo de cómputo.
# Estas variables permiten personalizar la configuración de cómputo según el ambiente.

variable "environment" {
  description = "Ambiente de despliegue"
  type        = string
}

variable "service_name" {
  description = "Nombre del servicio"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegarán las instancias"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subredes donde se desplegarán las instancias"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs de los grupos de seguridad aplicables"
  type        = list(string)
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
  default     = "notifications-key"
}

variable "ami_id" {
  description = "ID de la AMI para las instancias"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
}

variable "db_endpoint" {
  description = "Endpoint de la base de datos"
  type        = string
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "db_username" {
  description = "Usuario de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  type        = string
  sensitive   = true
}

variable "health_check_path" {
  description = "Ruta para el health check de las instancias"
  type        = string
  default     = "/health"
}

variable "health_check_port" {
  description = "Puerto para el health check de las instancias"
  type        = number
  default     = 80
}

// === ARCHIVO: .terraform-version ===
1.5.7

// === ARCHIVO: main.tf ===
# Configuración principal de infraestructura para el servicio de notificaciones
# Este archivo define los recursos de red y cómputo necesarios
# TODO(reto): Completar la definición de recursos según los requisitos del dominio

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Service     = var.service_name
      Owner       = "plataforma-fintech"
      ManagedBy   = "terraform"
    }
  }
}

# Módulo de red: VPC, subnets, route tables, NAT Gateway
# TODO(reto): Asegurar que el módulo network exponga los outputs necesarios para compute
module "network" {
  source = "./modules/network"

  environment           = var.environment
  service_name          = var.service_name
  vpc_cidr              = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  common_tags           = var.common_tags
}

# Módulo de cómputo: EC2, Auto Scaling Group, Load Balancer
# TODO(reto): Verificar que las referencias a outputs del módulo network sean correctas
# Los argumentos deben coincidir EXACTAMENTE con las variables declaradas en modules/compute/variables.tf
module "compute" {
  source = "./modules/compute"

  environment      = var.environment
  service_name     = var.service_name
  vpc_id           = module.network.vpc_id
  instance_type    = var.instance_type
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity
  ami_id           = var.ami_id
  db_name          = var.db_name
  common_tags      = var.common_tags
}

// === ARCHIVO: outputs.tf ===
# Outputs de la infraestructura del servicio de notificaciones
# Exponen información crítica para otras configuraciones y para referencia

output "vpc_id" {
  description = "ID de la VPC principal"
  value       = module.network.vpc_id
}

output "vpc_cidr" {
  description = "Rango CIDR de la VPC"
  value       = module.network.vpc_cidr
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas donde se ejecutan los servicios"
  value       = module.network.private_subnet_ids
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas para recursos de entrada"
  value       = module.network.public_subnet_ids
}

output "target_group_arn" {
  description = "ARN del Target Group para el balanceador de carga"
  value       = module.compute.target_group_arn
}

output "load_balancer_dns" {
  description = "DNS del Application Load Balancer"
  value       = module.compute.load_balancer_dns
}

output "load_balancer_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.compute.load_balancer_arn
}

output "service_endpoint" {
  description = "Endpoint completo del servicio de notificaciones"
  value       = "https://${module.compute.load_balancer_dns}"
}

// === ARCHIVO: environments/dev/terraform.tfvars ===
# Valores específicos para el ambiente de desarrollo del servicio de notificaciones
# Este archivo define la infraestructura de desarrollo - recursos optimizados para testing
# No contiene valores sensibles - los secretos se inyectan via variables de entorno o secret manager

# Configuración de red para desarrollo
environment_name             = "dev"
vpc_cidr_block              = "10.0.0.0/16"
availability_zones          = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs         = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs        = ["10.0.11.0/24", "10.0.12.0/24"]
database_subnet_cidrs       = ["10.0.21.0/24", "10.0.22.0/24"]

# Configuración de cómputo para desarrollo - instancias pequeñas para reducir costos
instance_type               = "t3.medium"
instance_count              = 2
min_instance_count          = 1
max_instance_count          = 3
autoscaling_enabled         = true

# Configuración de base de datos para desarrollo
db_instance_class           = "db.t3.micro"
db_allocated_storage        = 20
db_multi_az                 = false
db_engine_version           = "15.4"
db_name                     = "notifications_dev"

# Configuración de red y seguridad
enable_dns_hostnames        = true
enable_vpc_flow_logs        = false
allowed_cidr_blocks         = ["10.0.0.0/8"]
allowed_ssh_cidr            = ["10.0.0.0/16"]

# Configuración de notificaciones y monitoreo
enable_notifications        = true
notification_email          = "devops-dev@fintech.com"
alert_threshold_cpu         = 75
alert_threshold_memory      = 80

# Etiquetas estándar para todos los recursos
tags = {
  Environment = "dev"
  Service     = "notifications"
  Owner       = "devops-team"
  Project     = "fintech-platform"
  CostCenter  = "engineering"
  ManagedBy   = "terraform"
}

// === ARCHIVO: environments/prod/terraform.tfvars ===
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

// === ARCHIVO: modules/network/main.tf ===
# Módulo de Red - Superficie de Práctica
# El participante debe implementar los recursos de red para el servicio de notificaciones

# VPC del servicio de notificaciones
resource "aws_vpc" "notification_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.service_name}-vpc"
      Description = "VPC para el servicio de notificaciones"
    }
  )
}

# Subnets - El participant debe definir las subnets públicas y privadas
# Hint: Se necesitan al menos 2 subnets privadas en diferentes AZs
# resource "aws_subnet" "private" {
#   count             = length(var.availability_zones)
#   vpc_id            = aws_vpc.notification_vpc.id
#   cidr_block        = ... # Calcular subredes privadas
#   availability_zone = var.availability_zones[count.index]
# 
#   tags = merge(var.common_tags, { Name = "..." })
# }

# Internet Gateway
resource "aws_internet_gateway" "notification_igw" {
  vpc_id = aws_vpc.notification_vpc.id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.service_name}-igw"
    }
  )
}

# Security Groups - El participante debe definir los grupos de seguridad
# Hint: Necesario para ALB, instancias EC2/ECS, y acceso a bases de datos
# resource "aws_security_group" "alb_sg" {
#   name        = "${var.service_name}-alb-sg"
#   description = "Security group para el Application Load Balancer"
#   vpc_id      = aws_vpc.notification_vpc.id
# 
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# 
#   tags = var.common_tags
# }

# NAT Gateways en cada AZ para salida de tráfico privado
# resource "aws_nat_gateway" "notification_nat" {
#   count         = length(var.availability_zones)
#   allocation_id = aws_eip.nat_eip[count.index].id
#   subnet_id     = aws_subnet.public[count.index].id
# 
#   tags = var.common_tags
# }

# Elastic IPs para NAT Gateways
# resource "aws_eip" "nat_eip" {
#   count  = length(var.availability_zones)
#   domain = "vpc"
# 
#   tags = merge(var.common_tags, { Name = "${var.service_name}-nat-eip-${count.index}" })
# }

# Route Tables
# El participante debe configurar las tablas de rutas para subnets públicas y privadas

// === ARCHIVO: modules/network/outputs.tf ===
# Outputs del Módulo de Red
# Provee los valores necesarios para que otros módulos consuman la infraestructura de red

output "vpc_id" {
  description = "ID de la VPC creada para el servicio de notificaciones"
  value       = aws_vpc.notification_vpc.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.notification_vpc.cidr_block
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas para el cómputo"
  # TODO(reto): Descomentar cuando se implementen las subnets
  # value = aws_subnet.private[*].id
  value = []
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas para ALB"
  # TODO(reto): Descomentar cuando se implementen las subnets
  # value = aws_subnet.public[*].id
  value = []
}

output "availability_zones" {
  description = "Zonas de disponibilidad configuradas"
  value       = var.availability_zones
}

output "alb_security_group_id" {
  description = "ID del security group del Application Load Balancer"
  # TODO(reto): Descomentar cuando se implemente el security group
  # value = aws_security_group.alb_sg.id
  value = ""
}

output "compute_security_group_id" {
  description = "ID del security group para las instancias de cómputo"
  # TODO(reto): Descomentar cuando se implemente el security group
  # value = aws_security_group.compute_sg.id
  value = ""
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.notification_igw.id
}

// === ARCHIVO: modules/compute/main.tf ===
# Módulo de Cómputo - Superficie de Práctica
# El participante debe implementar los recursos de cómputo para el servicio de notificaciones

# Datos de referencia a la red - estos valores vendrán del módulo de network
data "aws_vpc" "notification_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.service_name}-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.notification_vpc.id]
  }

  tags = {
    Type = "private"
  }
}

# Application Load Balancer para el servicio de notificaciones
resource "aws_lb" "notification_alb" {
  name               = "${var.service_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    var.common_tags,
    {
      Name = "${var.service_name}-alb"
    }
  )
}

# Target Group para el servicio de notificaciones
resource "aws_lb_target_group" "notification_tg" {
  name     = "${var.service_name}-tg"
  port     = var.service_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.notification_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/health"
    matcher             = "200"
  }

  tags = var.common_tags
}

# Listener HTTPS para el ALB
resource "aws_lb_listener" "notification_https" {
  load_balancer_arn = aws_lb.notification_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.notification_tg.arn
  }
}

# ECS Task Definition - El participante debe definir la task definition
# Hint: Definir el contenedor de notificaciones con su imagen, recursos y variables de entorno
# resource "aws_ecs_task_definition" "notification_task" {
#   family                   = "${var.service_name}"
#   network_mode             = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = var.ecs_cpu
#   memory                   = var.ecs_memory
#   execution_role_arn       = aws_iam_role.ecs_execution_role.arn
#   task_role_arn            = aws_iam_role.ecs_task_role.arn
# 
#   container_definitions = jsonencode([
#     {
#       name      = "${var.service_name}"
#       image     = "${var.ecr_repository_url}:${var.image_tag}"
#       essential = true
#       portMappings = [
#         {
#           containerPort = var.service_port
#           protocol      = "tcp"
#         }
#       ]
#       environment = [
#         { name = "SERVICE_NAME", value = var.service_name }
#       ]
#     }
#   ])
# }

# ECS Service - El participante debe implementar el servicio de ECS
# resource "aws_ecs_service" "notification_service" {
#   name            = var.service_name
#   cluster         = var.ecs_cluster_id
#   task_definition = aws_ecs_task_definition.notification_task.arn
#   desired_count   = var.desired_count
#   launch_type     = "FARGATE"
# 
#   network_configuration {
#     subnets          = var.private_subnet_ids
#     security_groups  = [var.compute_security_group_id]
#     assign_public_ip = false
#   }
# 
#   load_balancer {
#     target_group_arn = aws_lb_target_group.notification_tg.arn
#     container_name   = var.service_name
#     container_port   = var.service_port
#   }
# 
#   depends_on = [aws_lb_listener.notification_https]
# 
#   tags = var.common_tags
# }

# Auto Scaling Group - Alternativa a ECS para EC2
# El participante puede implementar ASG si prefiriese EC2 sobre ECS
# resource "aws_launch_template" "notification_lt" {
#   name_prefix   = "${var.service_name}-"
#   image_id      = var.ami_id
#   instance_type = var.instance_type
# 
#   vpc_security_group_ids = [var.compute_security_group_id]
# 
#   tag_specifications {
#     resource_type = "instance"
#     tags          = var.common_tags
#   }
# }

# IAM Roles para ECS
resource "aws_iam_role" "ecs_execution_role" {
  name = "${var.service_name}-ecs-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "ecs_task_role" {
  name = "${var.service_name}-ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

// === ARCHIVO: modules/compute/outputs.tf ===
# Outputs del módulo de cómputo para el servicio de notificaciones
# Superficie de práctica: el estudiante definirá los outputs necesarios

output "instance_ids" {
  description = "Lista de IDs de las instancias EC2 aprovisionadas"
  value       = aws_instance.notification_service[*].id
}

output "instance_public_ips" {
  description = "Direcciones IP públicas de las instancias"
  value       = aws_instance.notification_service[*].public_ip
}

output "instance_private_ips" {
  description = "Direcciones IP privadas de las instancias"
  value       = aws_instance.notification_service[*].private_ip
}

output "security_group_id" {
  description = "ID del grupo de seguridad asociado a las instancias"
  value       = aws_security_group.notification_sg.id
}

output "iam_instance_profile" {
  description = "Nombre del perfil de instancia IAM"
  value       = aws_iam_instance_profile.notification_profile.name
}

output "autoscaling_group_name" {
  description = "Nombre del grupo de auto-scaling"
  value       = try(aws_autoscaling_group.notification_asg.name, "")
}

output "launch_template_id" {
  description = "ID de la plantilla de lanzamiento"
  value       = try(aws_launch_template.notification_lt.id, "")
}

output "primary_instance_id" {
  description = "ID de la instancia primaria del servicio"
  value       = aws_instance.notification_service[0].id
}

// === ARCHIVO: scripts/healthcheck.sh ===
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

// === ARCHIVO: Dockerfile ===
# Stage 1: Build stage - compilacion del servicio de notificaciones
FROM node:18-alpine AS builder

# Configuracion de entorno para construccion
WORKDIR /build

# Copiar archivos de dependencias primero para aprovechar cache
COPY package*.json ./

# Instalar dependencias de produccion
RUN npm ci --only=production

# Copiar codigo fuente
COPY src/ ./src/
COPY tsconfig.json ./

# Compilar TypeScript a JavaScript
RUN npm run build

# Stage 2: Production stage - imagen optimizada
FROM node:18-alpine AS production

# Configuracion de usuario no root para seguridad
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Variables de entorno para produccion
ENV NODE_ENV=production \
    PORT=3000 \
    SERVICE_NAME=notifications-service

# Etiquetas para mapeo de recursos
LABEL maintainer="fintech-platform" \
      service="notifications" \
      environment="production" \
      version="1.0.0"

WORKDIR /app

# Copiar solo archivos necesarios del stage anterior
COPY --from=builder --chown=nodejs:nodejs /build/dist ./dist
COPY --from=builder --chown=nodejs:nodejs /build/node_modules ./node_modules
COPY --from=builder --chown=nodejs:nodejs /build/package*.json ./

# Crear directorio para logs con permisos adecuados
RUN mkdir -p /app/logs && chown -R nodejs:nodejs /app

# Cambiar a usuario no root
USER nodejs

# Exponer puerto del servicio
EXPOSE 3000

# HEALTHCHECK para verificacion de disponibilidad
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

# Script de inicio con manejo de señales SIGTERM
COPY --chown=nodejs:nodejs <<'EOF' /entrypoint.sh
#!/bin/sh
# Manejo de señal de apagado graceful
trap 'echo "Recibida señal de terminación, cerrando gracefully..."; exit 0' SIGTERM SIGINT

echo "Iniciando servicio de notificaciones..."
exec node dist/index.js
EOF

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
```
