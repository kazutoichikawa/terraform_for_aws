# ---------------------------------------------
# VPC
# ---------------------------------------------
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cider_block

  tags = {
    Name = "terraform"
  }
}

# ---------------------------------------------
# Subnet
# ---------------------------------------------
resource "aws_subnet" "subnet-1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_1a_cidr_block
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "terraform"
  }
}

# ---------------------------------------------
# Route Table
# ---------------------------------------------
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route = []

  tags = {
    Name = "terraform"
  }
}

# ---------------------------------------------
# Internet Gateway
# ---------------------------------------------
resource "aws_internet_gateway" "tf-test-gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "terraform"
  }
}
