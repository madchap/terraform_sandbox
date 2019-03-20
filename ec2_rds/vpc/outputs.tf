output "name" {
  value = "${var.vpc_name}"
}

output "id" {
  value = "${aws_vpc.primary_vpc.id}"
}

output "region" {
  value = "${var.vpc_region}"
}
