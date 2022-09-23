module "networks" {
  source = "./modules/networks"

  vpc_cider_block = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
  service_name = "eikatsu"
}
