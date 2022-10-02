module "networks" {
  source = "./modules/networks"

  vpc_cider_block = "10.0.0.0/16"
  subnet_1a_cidr_block = "10.0.1.0/24"
  subnet_1c_cidr_block = "10.0.2.0/24"
  service_name = "eikatsu"
}

module "ecr" {
  source = "./modules/ecr"

  service_name = "eikatsu"
}

module "ec2" {
  source = "./modules/ec2"

  service_name = "eikatsu"
  vpc_id = module.networks.vpc_id
  subnet-1a_id = module.networks.subnet-1a_id
  subnet-1c_id = module.networks.subnet-1c_id
  security_group_id = module.networks.security_group_id
}
