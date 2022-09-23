# resource "aws_db_instance" "education" {
#   identifier             = "education"
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 5
#   engine                 = "postgres"
#   engine_version         = "13.1"
#   username               = "edu"
#   password               = var.db_password
#   db_subnet_group_name   = aws_db_subnet_group.education.name
#   vpc_security_group_ids = [aws_security_group.rds.id]
#   parameter_group_name   = aws_db_parameter_group.education.name
#   publicly_accessible    = true
#   skip_final_snapshot    = true
# }

# resource "aws_db_subnet_group" "praivate-db" {
#     name        = "praivate-db"
#     subnet_ids  = ["${aws_subnet.private-db1.id}", "${aws_subnet.private-db2.id}"]
#     tags = {
#         Name = "${service_name}-db1"
#     }
# }

