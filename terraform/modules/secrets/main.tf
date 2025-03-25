resource "aws_secretsmanager_secret" "db_credentials" {
  name = "wordpress-db-credentials"
}

resource "aws_secretsmanager_secret_version" "db_version" {
  secret_id     = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({ username = var.db_user, password = var.db_password })
}
