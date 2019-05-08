#Configure security group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "${var.rds_sg_name}"
  description = "RDS Secuirty Group"
  vpc_id      = "${var.vpc_id}"

  # Allow mysql traffic
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["${var.vpc_ip}"]
  }

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["${var.my_ip}"]
  }
  
  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "${var.rds_sg_name}"
  }
}

#Configure MYSQL RDS instance
resource "aws_db_instance" "ranger_mysql" {
  identifier                = "${var.rds_instance_identifier}"
  engine                    = "mysql"
  engine_version            = "${var.engine_version}"
  instance_class            = "db.t2.micro"
  allocated_storage         = 20
  name                      = "${var.database_name}"
  username                  = "${var.database_user}"
  password                  = "${var.database_pwd}"
  db_subnet_group_name      = "${var.db_subnet_group_name}"
  vpc_security_group_ids    = ["${aws_security_group.rds_sg.id}"]
  availability_zone         = "${var.db_availability_zone}"
  skip_final_snapshot       = true
  final_snapshot_identifier = "Ignore"
}
