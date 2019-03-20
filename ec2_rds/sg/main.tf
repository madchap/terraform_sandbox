resource "aws_security_group" "allow_ssh_in" {
  name        = "allow_ssh_in"
  description = "Ingress ssh"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
    "Name", "DefectDojo ssh"
  ))}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.fred_home_ip}"]
  }
}

resource "aws_security_group" "allow_3306_in" {
  name        = "allow_3306_in"
  description = "Ingress mysql 3306"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
    "Name", "DefectDojo mysql"
  ))}"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = ["${aws_security_group.allow_ssh_in.id}"]
    self        = true
  }
}

resource "aws_security_group" "web-outbound" {
  name = "allow_outbound"
  description = "Allow getting stuff from the internet and connect to mysql"
  vpc_id = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
    "Name", "DefectDojo web out"
  ))}"

  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = ["${aws_security_group.allow_3306_in.id}"]
  }
}