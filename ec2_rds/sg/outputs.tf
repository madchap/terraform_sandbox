output "sg_list" {
  value = [
    "${aws_security_group.allow_ssh_in.id}",
    "${aws_security_group.web-outbound.id}"
  ]
}
