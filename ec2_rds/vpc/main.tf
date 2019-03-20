resource "aws_vpc" "primary_vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags = "${merge(var.default_tags, map(
    "Name", "DefectDojo POC"
  ))}"
}
