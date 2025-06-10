resource "aws_ecs_service" "main" {
  name            = "${var.name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app_task.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_target_group.arn
    container_name   = "${var.name}-container"
    container_port   = 80
  }

  network_configuration {
    subnets          = var.subnets
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }
}
