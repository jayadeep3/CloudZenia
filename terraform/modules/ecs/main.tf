resource "aws_ecs_cluster" "main" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "wordpress" {
  family                   = "wordpress"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = var.execution_role_arn
  container_definitions    = jsonencode([
    {
      name      = "wordpress"
      image     = "wordpress:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [{ containerPort = 80 }]
      environment = [{ name = "DB_HOST", value = var.db_host }]
    }
  ])
}
