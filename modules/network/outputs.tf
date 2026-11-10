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