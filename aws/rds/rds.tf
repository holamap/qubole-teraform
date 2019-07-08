#------MySQL Ranger RDS---------
#Create DB subnet groups
resource "aws_db_subnet_group" "rds_db_subnet_grp" {
  name       = "${var.db_subnet_group_name}"
  subnet_ids = "${var.private_subnets}"
 
  tags = {
    Name = "${var.db_subnet_group_name}"
  }
}
#Configure security group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "${var.rds_sg_name}"
  description = "${var.rds_sg_desc}"
  vpc_id      = "${var.vpc_id}"
 
  #Allow mysql traffic
  ingress {
    from_port       = "${var.rds_port}"
    to_port         = "${var.rds_port}"
    protocol        = "tcp"
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
  }
   
  #Allow all outbound traffic.
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
  identifier                = "${var.db_instance_identifier}"
  engine                    = "${var.db_engine}"
  engine_version            = "${var.db_engine_version}"
  instance_class            = "${var.db_instance_type}"
  allocated_storage         = "${var.db_allocated_storage}"
  name                      = "${var.db_name}"
  username                  = "${var.db_user}"
  password                  = "${var.db_pwd}"
  db_subnet_group_name      = "${var.db_subnet_group_name}"
  vpc_security_group_ids    = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot       = true
  final_snapshot_identifier = "Ignore"
  publicly_accessible       = false
}
provider "mysql" {
  endpoint = "${aws_db_instance.ranger_mysql.endpoint}"
  username = "${aws_db_instance.ranger_mysql.username}"
  password = "${aws_db_instance.ranger_mysql.password}"
}


#Declare the data source
data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}
