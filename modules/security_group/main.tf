resource "aws_security_group" "ecs_sg" {
  name        = "${var.name}-ecs-sg"
  description = "Allow traffic to ECS services"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ecs_sg" {
  description = "Security group ID for the Application Load Balancer"
  value       = aws_security_group.ecs_sg.id
}