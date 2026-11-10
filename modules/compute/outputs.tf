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