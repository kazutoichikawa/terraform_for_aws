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
