module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr         = "10.0.0.0/16"
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "ecs" {
  source        = "./modules/ecs"
  cluster_name  = "my-ecs-cluster"
  db_host       = module.rds.db_host
  execution_role_arn = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
}

module "rds" {
  source        = "./modules/rds"
  db_user       = "admin"
  db_password   = "securepassword"
}

module "secrets" {
  source        = "./modules/secrets"
  db_user       = module.rds.db_user
  db_password   = module.rds.db_password
}

module "alb" {
  source        = "./modules/alb"
  public_subnets = module.vpc.public_subnets
  vpc_id        = module.vpc.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  key_name      = "my-key-pair"
  subnet_id     = module.vpc.public_subnets[0]
}
