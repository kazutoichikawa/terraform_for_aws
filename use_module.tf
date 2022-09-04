module "network" {
  source = "./modules/network"

  vpc_cider_block = "10.0.0.0/16"
  subnet_1a_cidr_block = "10.0.1.0/24"
}