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