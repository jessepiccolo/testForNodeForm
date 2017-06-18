
variable "subnet_ids" {
  description = "Subnet IDs to use in VPC"

  default = {
    "0" = "subnet-e33dadde"
  }
}

// General
variable "vpc_id" {}
variable "aws_region" {}
variable "aws_key_path" {}

// Chef
variable "chef_role" {}
variable "aws_key_name" {}
variable "chef_environment" {}

// Consul
variable "testDev_instance_type" {}
variable "testDev_number_of_instances" {}
variable "testDev_chef_runlist" {}

#-----------------------------------
# Consul
#-----------------------------------
module "ec2_consul" {
  source              = "../modules/util/ec2_chef_instance_linux"
  aws_key_name        = "${var.aws_key_name}"
  aws_key_path        = "${var.aws_key_path}"
  aws_region          = "${var.aws_region}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = "${var.subnet_ids}"
  security_groups     = ["sg-b14888c0"]    // Hardcode this from global for now
  instance_name       = "dev-test-C"
  instance_type       = "${var.testDev_instance_type}"
  number_of_instances = "${var.testDev_number_of_instances}"
  chef_role           = "${var.chef_role}"
  chef_environment    = "${var.chef_environment}"
  chef_runlist        = "${var.testDev_chef_runlist}"
}
