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