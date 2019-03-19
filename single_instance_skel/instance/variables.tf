variable "public_subnet_id" {}

variable "security_group_ids" {
  type = "list"
}

variable "vpc_id" {}

variable "pub_key" {
  type = "map"
}

variable "default_tags" {
  type = "map"
}
