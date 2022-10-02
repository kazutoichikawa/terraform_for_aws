output "vpc_id" {
  description = "ID of VPC"
  value = aws_vpc.vpc.id
}


output "subnet-1a_id" {
  description = "ID of subnet_1a"
  value = aws_subnet.subnet-1a.id
}

output "subnet-1c_id" {
  description = "ID of subnet_1c"
  value = aws_subnet.subnet-1c.id
}

output "security_group_id" {
  description = "ID of security-group"
  value = aws_security_group.security_group.id
}
