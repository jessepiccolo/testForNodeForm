#############################
#
# AWS Specific Variables
#
#############################

variable "aws_key_name" {
  description = "Name of the SSH keypair to use in AWS."
}

variable "aws_key_path" {
  description = "Path to the private portion of the SSH key specified."
}

variable "aws_region" {
  description = "AWS region to launch servers."
}

variable "vpc_id" {
  description = "VPC Id"
}

variable "subnet_ids" {
  description = "Subnet IDs to use in VPC"
  default     = {}
  type = "map"
}

variable "instance_type" {
  description = "Instance type"
}

variable "instance_name" {
  description = "Instance Name"
}

variable "aws_ami" {
  default = "ami-51693a3b"
}

variable "aws_amis" {
  default = {
    us-east-1 = "ami-c83360df"
  }
}

#############################
#
# AWS Variables
#
#############################

variable "security_groups" {
  description = "The security groups necessary for the instance."
  default     = []
}

variable "number_of_instances" {
  description = "The number of instances to spin up"
}

variable "tags" {
  default = {
    Created_by  = "terraform"
    Owner       = "Systems"
    Application = "Terraform Instances"
  }
}

#############################
#
# Chef Server Variables
#
#############################

// This will change for each cluster we spin up

variable "chef_role" {
  description = "The role for this cluster."
}

variable "chef_environment" {
  description = "The Chef environment to place the server in."
}

variable "chef_runlist" {
  description = "The runlist of recipes to apply."
}

// These will likely remain static

variable "chef_bootstrap_script" {
  description = "The location of our chef server bootstrap script."
  default     = "http://172.24.35.253/artifactory/fl-binary-local/Chef/bootstrap_chef.sh"
}
