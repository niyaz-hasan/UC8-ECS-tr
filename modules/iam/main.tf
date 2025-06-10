resource "aws_iam_role" "ecs_execution_role" {
  name               = "${var.name}-ecs-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role_policy.json
}

resource "aws_iam_policy" "ecs_execution_policy" {
  name        = "${var.name}-ecs-execution-policy"
  description = "Allow ECS to pull from ECR"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ecr:GetAuthorizationToken", "ecr:BatchGetImage", "ecr:BatchCheckLayerAvailability"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_role_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = aws_iam_policy.ecs_execution_policy.arn
}

resource "aws_iam_role" "ecs_task_role" {
  name               = "${var.name}-ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role_policy.json
}
