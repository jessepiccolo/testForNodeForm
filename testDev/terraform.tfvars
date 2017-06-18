#--------------------------------------------------------------
# General
#--------------------------------------------------------------

vpc_id						= "vpc-5ed04f3a"
aws_key_name			= "Integrations"
aws_key_path			= "~/.aws/keys/Integrations.pem"
aws_region				= "us-east-1"

#--------------------------------------------------------------
# Chef - Heavy assumption here
#--------------------------------------------------------------
chef_environment = "aws_dev"
chef_role = ""

#--------------------------------------------------------------
# Consul
#--------------------------------------------------------------
testDev_number_of_instances = "1"
testDev_instance_type = "t2.micro"
testDev_chef_runlist = "recipe[fl_linux_base::default],recipe[nodejs::nodejs]"
