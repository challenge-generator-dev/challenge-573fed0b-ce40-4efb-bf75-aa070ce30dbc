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