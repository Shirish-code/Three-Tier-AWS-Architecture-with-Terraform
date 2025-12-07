module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "security" {
  source     = "./modules/security"
  vpc_id     = module.vpc.vpc_id
  my_ip_cidr = var.my_ip_cidr
}

module "rds" {
  source        = "./modules/rds"
  db_username   = var.db_username
  db_password   = var.db_password
  db_subnet_ids = module.vpc.db_subnet_ids
  db_sg_id      = module.security.db_sg_id
}

module "alb_asg" {
  source            = "./modules/alb_asg"
  vpc_id            = module.vpc.vpc_id
  app_subnet_ids    = module.vpc.app_subnet_ids
  public_subnet_ids = module.vpc.public_subnet_ids
  web_sg_id         = module.security.web_sg_id
  alb_sg_id         = module.security.alb_sg_id
  db_host           = module.rds.db_host
  db_username       = var.db_username
  db_password       = var.db_password
  db_name           = module.rds.db_name
  key_name          = var.key_name
}