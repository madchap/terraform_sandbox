variable "vpc_id" {}
variable "public_subnet_cidrs" {
  type = "list"
}
variable "default_tags" {
  type = "map"
}
