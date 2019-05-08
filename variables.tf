variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {}
variable "my_ip" {}
variable "vpc_ip" {}

variable "rds_sg_name" {}

variable "rds_instance_identifier" {}
variable "engine_version" {}
variable "database_name" {}
variable "database_user" {}
variable "database_pwd" {}
variable "db_subnet_group_name" {}
variable "db_availability_zone" {}
