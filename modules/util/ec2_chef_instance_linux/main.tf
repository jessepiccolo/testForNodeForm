resource "aws_instance" "ec2_chef_instance_linux" {
  connection {
    type        = "ssh"
    user        = "centos"
    private_key = "${file(var.aws_key_path)}"
  }

  count                  = "${var.number_of_instances}"
  subnet_id              = "${lookup(var.subnet_ids, count.index)}"
  instance_type          = "${var.instance_type}"
  ami                    = "${lookup(var.aws_amis, var.aws_region)}"
  vpc_security_group_ids = "${var.security_groups}"

  key_name = "Integrations"

  # Bootstrap our server with Chef
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir /tmp/chef",
      "cd /tmp/chef",
      "sudo curl -o /tmp/chef/bootstrap_chef.sh  ${var.chef_bootstrap_script}",
      "sudo sh /tmp/chef/bootstrap_chef.sh ${var.chef_environment} ${var.chef_runlist} > /tmp/log 2>&1",
    ]
    timeout = ""
  }

  # Stupid hack we should get rid of, but allows us to rerun chef
  provisioner "remote-exec" {
    inline = [
      "ping -c 4 google.com",
      "sudo chef-client",
    ]
    timeout = "10m"
  }

  tags {
    // Takes the instance_name input variable and adds
    //  the count.index to the name., e.g.
    //  "example-host-web-1"
    Name = "${var.instance_name}-${count.index}"

    Created_by       = "${lookup(var.tags,"Created_by")}"
    Role             = "${var.instance_name}"
    Owner            = "${lookup(var.tags,"Owner")}"
    Application      = "${lookup(var.tags,"Application")}"
    Chef_environment = "${var.chef_environment}"
  }
}
