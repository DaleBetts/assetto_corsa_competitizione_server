data "aws_ami" "assetto_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["assetto-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["self"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "server" {
  ami                  = "${data.aws_ami.assetto_ami.id}"
  instance_type        = "${var.server_instance_type}"
  key_name             = "${var.project_name}"
  security_groups      = ["${aws_security_group.assetto_access.id}"]
  user_data            = "${data.template_file.user_data.rendered}"
  iam_instance_profile = "${aws_iam_instance_profile.assetto_profile.name}"

  tags = {
    Name = "${var.project_name}-server"
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/templates/cloud-init.sh.tpl")}"
}
