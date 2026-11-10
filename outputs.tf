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