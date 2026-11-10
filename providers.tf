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