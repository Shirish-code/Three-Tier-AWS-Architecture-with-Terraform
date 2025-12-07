output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "app_subnet_ids" {
  value = module.vpc.app_subnet_ids
}

output "db_subnet_ids" {
  value = module.vpc.db_subnet_ids
}

output "alb_sg_id" {
  value = module.security.alb_sg_id
}

output "web_sg_id" {
  value = module.security.web_sg_id
}

output "bastion_sg_id" {
  value = module.security.bastion_sg_id
}

output "db_sg_id" {
  value = module.security.db_sg_id
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "db_name" {
  value = module.rds.db_name
}

output "db_host" {
  value = module.rds.db_host
}

output "alb_dns_name" {
  value = module.alb_asg.alb_dns_name
}

output "asg_name" {
  value = module.alb_asg.asg_name
}