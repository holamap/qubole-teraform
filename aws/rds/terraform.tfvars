#aws account
access_key = "*********"  
secret_key = "*********"

vpc_id = "vpc-**********"

private_subnets = ["subnet-*********", "subnet-***********"]

region = "us-east-1"

rds_sg_name = "ranger-rds-sg"
rds_sg_desc = "Ranger RDS SG"

#RDS properties
#any db instance identifier name
db_instance_identifier = "ranger-rds"
db_engine = "mysql"
db_engine_version = "5.7.25"
db_name = "ranger"

#Database root user
db_user = "root"
db_pwd = "password"
db_ranger_user = "rangeradmin"
db_ranger_pwd = "******"
 
#any db subnet group name
db_subnet_group_name = "ranger-db-subnet"
db_allocated_storage = 20
db_instance_type = "db.t2.medium"


rds_port = 3306
