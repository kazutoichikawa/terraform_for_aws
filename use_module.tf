module "networks" {
  source = "./modules/networks"

  vpc_cider_block = "10.0.0.0/16"
  subnet_1a_cidr_block = "10.0.1.0/24"
  subnet_1c_cidr_block = "10.0.2.0/24"
  service_name = "eikatsu"
}

module "rds" {
  source = "./modules/rds"

  service_name = "eikatsu"
  db_username = "postgres"
  db_password = "q3BsrXaE"
}
