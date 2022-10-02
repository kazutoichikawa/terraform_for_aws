output "vpc_id" {
  value = aws_vpc.vpc.id
}


output "subnet-1a_id" {
  value = aws_subnet.subnet-1a
}

output "subnet-1c_id" {
  value = aws_subnet.subnet-1c
}
