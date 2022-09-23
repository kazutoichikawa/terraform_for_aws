# ---------------------------------------------
# RDS DB Instance
# ---------------------------------------------
# resource "aws_db_instance" "education" {
#   engine                 = "postgres"
#   engine_version         = "14.4"
#   identifier             = "education"
#   db_name                = "${service_name}-db-1"
#   username               = var.db_username
#   password               = var.db_password
#   instance_class         = "db.t3.micro"

#   # ------- ここまでOK -------
#   # ストレージタイプ
#   # ストレージ割り当て
# # ストレージの自動スケーリング
# # 最大ストレージしきい値
#   allocated_storage      = 20
#   db_subnet_group_name   = aws_db_subnet_group.education.name
#   vpc_security_group_ids = [aws_security_group.rds.id]
#   parameter_group_name   = aws_db_parameter_group.education.name
#   publicly_accessible    = true
#   skip_final_snapshot    = true
# }



