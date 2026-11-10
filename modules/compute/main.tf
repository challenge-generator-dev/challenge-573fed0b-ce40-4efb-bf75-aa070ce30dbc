# Módulo de Cómputo - Superficie de Práctica
# El participante debe implementar los recursos de cómputo para el servicio de notificaciones

# Datos de referencia a la red - estos valores vendrán del módulo de network
data "aws_vpc" "notification_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.service_name}-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.notification_vpc.id]
  }

  tags = {
    Type = "private"
  }
}

# Application Load Balancer para el servicio de notificaciones
resource "aws_lb" "notification_alb" {
  name               = "${var.service_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    var.common_tags,
    {
      Name = "${var.service_name}-alb"
    }
  )
}

# Target Group para el servicio de notificaciones
resource "aws_lb_target_group" "notification_tg" {
  name     = "${var.service_name}-tg"
  port     = var.service_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.notification_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/health"
    matcher             = "200"
  }

  tags = var.common_tags
}

# Listener HTTPS para el ALB
resource "aws_lb_listener" "notification_https" {
  load_balancer_arn = aws_lb.notification_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.notification_tg.arn
  }
}

# ECS Task Definition - El participante debe definir la task definition
# Hint: Definir el contenedor de notificaciones con su imagen, recursos y variables de entorno
# resource "aws_ecs_task_definition" "notification_task" {
#   family                   = "${var.service_name}"
#   network_mode             = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = var.ecs_cpu
#   memory                   = var.ecs_memory
#   execution_role_arn       = aws_iam_role.ecs_execution_role.arn
#   task_role_arn            = aws_iam_role.ecs_task_role.arn
# 
#   container_definitions = jsonencode([
#     {
#       name      = "${var.service_name}"
#       image     = "${var.ecr_repository_url}:${var.image_tag}"
#       essential = true
#       portMappings = [
#         {
#           containerPort = var.service_port
#           protocol      = "tcp"
#         }
#       ]
#       environment = [
#         { name = "SERVICE_NAME", value = var.service_name }
#       ]
#     }
#   ])
# }

# ECS Service - El participante debe implementar el servicio de ECS
# resource "aws_ecs_service" "notification_service" {
#   name            = var.service_name
#   cluster         = var.ecs_cluster_id
#   task_definition = aws_ecs_task_definition.notification_task.arn
#   desired_count   = var.desired_count
#   launch_type     = "FARGATE"
# 
#   network_configuration {
#     subnets          = var.private_subnet_ids
#     security_groups  = [var.compute_security_group_id]
#     assign_public_ip = false
#   }
# 
#   load_balancer {
#     target_group_arn = aws_lb_target_group.notification_tg.arn
#     container_name   = var.service_name
#     container_port   = var.service_port
#   }
# 
#   depends_on = [aws_lb_listener.notification_https]
# 
#   tags = var.common_tags
# }

# Auto Scaling Group - Alternativa a ECS para EC2
# El participante puede implementar ASG si prefiriese EC2 sobre ECS
# resource "aws_launch_template" "notification_lt" {
#   name_prefix   = "${var.service_name}-"
#   image_id      = var.ami_id
#   instance_type = var.instance_type
# 
#   vpc_security_group_ids = [var.compute_security_group_id]
# 
#   tag_specifications {
#     resource_type = "instance"
#     tags          = var.common_tags
#   }
# }

# IAM Roles para ECS
resource "aws_iam_role" "ecs_execution_role" {
  name = "${var.service_name}-ecs-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "ecs_task_role" {
  name = "${var.service_name}-ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}