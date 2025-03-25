resource "aws_db_instance" "wordpress_db" {
  identifier            = "wordpress-db"
  allocated_storage     = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  username             = var.db_user
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  backup_retention_period = 7
}
