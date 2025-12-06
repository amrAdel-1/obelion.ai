module "vpc" {
  source = "./modules/networking/vpc"
}

module "subnet" {
  source = "./modules/networking/subnet"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source            = "./modules/networking/route_table"
  vpc_id            = module.vpc.vpc_id
  igw_id            = module.vpc.igw_id
  public_subnets_1  = module.subnet.public_subnets_1_id
  public_subnets_2  = module.subnet.public_subnets_2_id
  private_subnets_1 = module.subnet.private_subnets_1_id
  private_subnets_2 = module.subnet.private_subnets_2_id
}

module "security_groups" {
  source = "./modules/networking/security_group"
  vpc_id = module.vpc.vpc_id
}

module "RDS_subnet_group" {
  source              = "./modules/database/RDS/Subnet-groups"
  vpc_id              = module.vpc.vpc_id
  private_subnet_1_id = module.subnet.private_subnets_1_id
  private_subnet_2_id = module.subnet.private_subnets_2_id
}

module "RDS_parameter_group" {
  source = "./modules/database/RDS/Parameter-groups"
}

module "RDS" {
  source                   = "./modules/database/RDS"
  vpc_id                   = module.vpc.vpc_id
  rds_sg_id                = module.security_groups.database_sg_id
  RDS_subnet_group_name    = module.RDS_subnet_group.RDS_subnet_group_id
  RDS_parameter_group_name = module.RDS_parameter_group.parameter_group_name
}

module "instances" {
  source             = "./modules/compute/ec2"
  public_subnet_1_id = module.subnet.public_subnets_1_id
  public_subnet_2_id = module.subnet.public_subnets_2_id
  frontend_sg_id     = module.security_groups.frontend_sg_id
  backend_sg_id      = module.security_groups.backend_sg_id
}

module "monitoring" {
  source               = "./modules/monitoring"
  sns_email            = var.alert_email
  frontend_instance_id = module.instances.frontend_instance_id
  backend_instance_id  = module.instances.backend_instance_id
}

module "nacl" {
  source             = "./modules/networking/nacl"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = [module.subnet.public_subnets_A_id, module.subnet.public_subnets_B_id]
  private_subnet_ids = [module.subnet.private_subnets_A_id, module.subnet.private_subnets_B_id]
}
