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