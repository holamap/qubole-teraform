variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {}

variable "private_subnets" {
 type = "list"
}

variable "rds_sg_name" {}
variable "rds_sg_desc" {}

variable "db_instance_identifier" {}
variable "db_engine" {}
variable "db_engine_version" {}
variable "db_name" {}
variable "db_user" {}
variable "db_pwd" {}
variable "db_ranger_user" {}
variable "db_ranger_pwd" {}
variable "db_subnet_group_name" {}
variable "db_allocated_storage" {}
variable "db_instance_type" {}

variable "rds_port" {}
