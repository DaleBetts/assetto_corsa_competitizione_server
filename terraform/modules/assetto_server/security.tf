resource "aws_security_group" "assetto_access" {
  name   = "${var.project_name}-sg"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "${var.project_name}-sg"
  }
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.assetto_access.id}"

  cidr_blocks = ["${var.ssh_allowed_list}"]
}

resource "aws_security_group_rule" "assetto_ingress_tcp" {
  type              = "ingress"
  from_port         = 9232
  to_port           = 9232
  protocol          = "tcp"
  security_group_id = "${aws_security_group.assetto_access.id}"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "assetto_ingress_udp" {
  type              = "ingress"
  from_port         = 9231
  to_port           = 9231
  protocol          = "udp"
  security_group_id = "${aws_security_group.assetto_access.id}"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.assetto_access.id}"
  cidr_blocks       = ["0.0.0.0/0"]
}
