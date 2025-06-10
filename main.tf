module "vpc" {
  source = "./modules/vpc"
  name           = var.name
  vpc_cidr_block = var.vpc_cidr_block
  
}

module "ecr" {
  source = "./modules/ecr"
  name   = var.name
}

module "ecs" {
  source = "./modules/ecs"
  name   = var.name
  ecr_repo_url = module.ecr.ecr_repo_url
  availability_zones = var.availability_zones
  subnets = module.vpc.public_subnets[*].id
  security_group_id = module.security_group.ecs_sg.id
}

module "iam" {
  source = "./modules/iam"
  name   = var.name
}

module "security_group" {
  source = "./modules/security_group"
  name   = var.name
  vpc_id = module.vpc.vpc_id
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  name   = var.name
}

module "alb" {
  source = "./modules/alb"
  name                 = var.name
  vpc_id               = module.vpc.vpc_id
  subnets              = module.vpc.public_subnets
  security_group_id    = module.security_group.ecs_sg
}


