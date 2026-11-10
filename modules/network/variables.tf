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