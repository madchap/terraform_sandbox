resource "aws_network_interface" "if_0" {
  subnet_id       = "${var.public_subnet_id[0]}"
  security_groups = ["${var.security_group_ids}"]
}

resource "aws_eip" "ip" {
  instance          = "${aws_instance.dojo-web.id}"
  network_interface = "${aws_network_interface.if_0.id}"
  vpc               = true
}

resource "aws_instance" "dojo-web" {
  ami               = "${data.aws_ami.ubuntu-xenial.id}"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.pubkey.key_name}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  

  network_interface {
    network_interface_id = "${aws_network_interface.if_0.id}"
    device_index         = 0
  }

  tags = "${merge(var.default_tags, map(
    "Name", "Defect Dojo POC"
  ))}"
}

resource "aws_key_pair" "pubkey" {
  key_name   = "${var.pub_key["key_name"]}"
  public_key = "${var.pub_key["public_key"]}"
}
