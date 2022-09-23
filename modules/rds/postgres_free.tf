resource "aws_db_subnet_group" "praivate-db" {
    name        = "praivate-db"
    subnet_ids  = ["${aws_subnet.private-db1.id}", "${aws_subnet.private-db2.id}"]
    tags = {
        Name = "${service_name}-db1"
    }
}
