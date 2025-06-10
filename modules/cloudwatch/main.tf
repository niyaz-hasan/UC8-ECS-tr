resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/${var.name}-logs"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_stream" "ecs_log_stream" {
  log_group_name = aws_cloudwatch_log_group.ecs_log_group.name
  name           = "${var.name}-stream"
}
