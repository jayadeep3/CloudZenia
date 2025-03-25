output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = module.ecs.cluster_name
}

output "db_endpoint" {
  description = "Database endpoint"
  value       = module.rds.db_host
}

output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = module.alb.alb_dns
}

output "ec2_instance_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.instance_ip
}
