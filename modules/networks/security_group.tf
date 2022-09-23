
#--------------------------------------------------------------
# Security group
#--------------------------------------------------------------
resource "aws_security_group" "security_group" {
  name = "${var.service_name}-sg"
  description = "security group for ${var.service_name}"
  vpc_id = aws_vpc.vpc.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all connections"
  }
}

#--------------------------------------------------------------
# Security group rule
#--------------------------------------------------------------
# 22番ポート許可 @SSH
resource "aws_security_group_rule" "inbound_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  description = "Allow SSH connections"
  security_group_id = "${aws_security_group.security_group.id}"
}

# 3000番ポート許可 @開発プロダクションモード用
resource "aws_security_group_rule" "inbound_localhost" {
  type        = "ingress"
  from_port   = 3000
  to_port     = 3000
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  description = "Allow port 3000 connections"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.security_group.id}"
}

# 5432番ポート許可 @PostgreSQL
resource "aws_security_group_rule" "inbound_db" {
  type        = "ingress"
  from_port   = 5432
  to_port     = 5432
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  description = "Allow connection to PostgreSQL"
  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "inbound_adminer" {
  type        = "ingress"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  description = "Allow connection to Adminer"
  security_group_id = "${aws_security_group.security_group.id}"
}

# 80番ポート許可@HTTP
resource "aws_security_group_rule" "inbound_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  description = "Allow HTTP connections"
  security_group_id = "${aws_security_group.security_group.id}"
}

# 443番ポート許可@HTTPS
resource "aws_security_group_rule" "inbound_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  description = "Allow HTTPS connections"
  security_group_id = "${aws_security_group.security_group.id}"
}

# 全て許可するアウトバウンドルール
# resource "aws_security_group_rule" "outbound_allow_all" {
#   type        = "egress"
#   from_port   = "all"
#   to_port     = "all"
#   protocol    = "all"
#   cidr_blocks = [
#     "0.0.0.0/0"
#   ]
#   description = "Allow all connections"
#   security_group_id = "${aws_security_group.security_group.id}"
# }
