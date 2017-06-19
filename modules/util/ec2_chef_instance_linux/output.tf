# // Output the ID of the EC2 instance created
# output "ec2_instance_id" {
#   value = "${aws_instance.ec2_chef_instance.id}"
# }
#
# // Output the ips of the ec2 nodes
# output "host-ips" {
#   value = "${join(",", aws_instance.ec2_chef_instance.*.private_ip)}"
# }
