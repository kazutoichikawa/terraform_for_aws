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
  cidr_block = var.subnet_1a_cidr_block
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${var.service_name}-subnet-1a"
  }
}

resource "aws_subnet" "subnet-1c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_1c_cidr_block
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${var.service_name}-subnet-1c"
  }
}

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
  depends_on = [aws_vpc.vpc]
  tags = {
    Name = "${var.service_name}-internet-gateway"
  }
}

# ---------------------------------------------
# DB Subnet Group
# ---------------------------------------------
resource "aws_db_subnet_group" "db_subnet_group" {
    name        = "${var.service_name}-db-subnet-group"
    description = "db subnet-group for ${var.service_name}-db-1"
    subnet_ids  = ["${aws_subnet.subnet-1a.id}", "${aws_subnet.subnet-1c.id}"]
    tags = {
        Name = "${var.service_name}-db-1"
    }
}

