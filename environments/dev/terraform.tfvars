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