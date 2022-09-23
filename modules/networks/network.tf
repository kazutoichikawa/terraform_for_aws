# ---------------------------------------------
# VPC
# ---------------------------------------------
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cider_block

  tags = {
    Name = "${var.service_name}-vpc"
  }
}

# ---------------------------------------------
# Subnet
# ---------------------------------------------
resource "aws_subnet" "subnet-1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${var.service_name}-subnet-1a"
  }
}


# resource "aws_subnet" "subnet-1c" {
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = var.subnet_cidr_block
#   availability_zone = "ap-northeast-1c"
#   tags = {
#     Name = "${var.service_name}-subnet-1c"
#   }
# }

# ---------------------------------------------
# Route Table
# ---------------------------------------------
resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id
  route = []
  tags = {
    Name = "${var.service_name}-route-table"
  }
}

# ---------------------------------------------
# Internet Gateway
# ---------------------------------------------
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.service_name}-internet-gateway"
  }
}
