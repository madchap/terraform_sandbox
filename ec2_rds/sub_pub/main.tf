resource "aws_subnet" "public" {
  count = "${length(var.public_subnet_cidrs)}"

  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.public_subnet_cidrs[count.index]}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags = "${merge(var.default_tags, map(
    "Name", "Defect Dojo POC"
  ))}"

}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${var.vpc_id}"
  
  tags = "${merge(var.default_tags, map(
    "Name", "Defect Dojo POC"
  ))}"
}

resource "aws_route_table" "igw_route" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table_association" "route_for_subnets" {
  count = "${length(var.public_subnet_cidrs)}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.igw_route.id}"
}
