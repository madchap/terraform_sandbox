resource "aws_subnet" "public" {
  vpc_id            = "${var.vpc_id}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  cidr_block        = "${var.public_subnet_cidr}"

  tags = "${merge(var.default_tags, map(
    "Env", "Playground"
  ))}"

}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${var.vpc_id}"
  
  tags = "${merge(var.default_tags, map(
    "Env", "Playground"
  ))}"
}

resource "aws_route_table" "igw_route" {
  vpc_id                 = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table_association" "route_for_subnets" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.igw_route.id}"
}
