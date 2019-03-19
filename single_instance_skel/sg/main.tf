resource "aws_security_group" "allow_ssh_in" {
  name        = "allow_ssh_in"
  description = "Ingress ssh"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
