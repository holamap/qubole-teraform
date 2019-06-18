#devexternal
access_key = "***********"  
secret_key = "***********"
region = "us-east-1"

vpc_id = "vpc-*******"
public_subnets = ["subnet-*******", "subnet-******"]
private_subnets = ["subnet-******", "subnet-******"]
local_ips = ["*.*.*.*/32","*.*.*.*/32"]
#local_ips = ["73.44.199.75/32","98.180.206.139/32"] 

#Security Group Names
rds_sg_name = "terraform-ranger-rds-sg"
ranger_admin_sg_name = "terraform-ranger-admin-sg"
ranger_lb_sg_name = "terraform-ranger-lbalancer-sg"

#Security Group Description
rds_sg_desc = "Ranger RDS Secuirty Group"
ranger_admin_sg_desc = "Ranger Admin Security Group"
ranger_lb_sg_desc = "Ranger Load Balancer Security Group"

ranger_admin_name = "terraform-ranger-admin"
ranger_solr_name = "terraform-ranger-solr"
ranger_lb_name = "terraform-ranger-lb" 
ranger_target_name = "terraformf-ranger-lb-tg"

#RDS properties
db_instance_identifier = "tf-ranger"
db_engine = "mysql"
db_engine_version = "5.7.25"
db_name = "ranger"
#Database root user
db_user = "root"
db_pwd = "password"
db_ranger_user = "rangeradmin"
db_ranger_pwd = "password"
#should be a private subnet
db_subnet_group_name = "tf-db-subnet"
db_allocated_storage = 20
db_instance_type = "db.t2.medium"

ami = "ami-0080e4c5bc078760e"
#ranger admin instance
ranger_instance_type = "t2.medium"
solr_instance_type = "t2.medium"
#path of the keypair file without the (.pem) extension
key_name = "sabs-keypair"
instance_count = 2

#port
ranger_port = 6080
solr_port = 6083
rds_port = 3306
ssh_port = 22

#cookie duration in seconds
cookie_duration = 86400

solr_download_url = "http://archive.apache.org/dist/lucene/solr/7.0.0/solr-7.0.0.tgz"
log_location = "s3://snayak-dev/ranger/"

