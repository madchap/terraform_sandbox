data "aws_subnet_ids" "all" {
  vpc_id = "${var.vpc_id}"
}

data "aws_security_group" "allow_3306_in" {
  vpc_id = "${var.vpc_id}"
  name   = "allow_3306_in"
}

data "aws_kms_secrets" "db" {
  secret {
    name = "dojo-password"
    payload = "AQICAHhVIb+E/IExY6nha+KixaZeHVyJGm6YaL5B28httwAkIQERxcgxtmBR+xjQVX8BJwSfAAAAbDBqBgkqhkiG9w0BBwagXTBbAgEAMFYGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMKf8k8v92NYCkJw3OAgEQgCk2gGxl1y6Cj/sxpoKjN6j0wpsJ/Z5oQKIB4oaYwahZuBu1HGiBp2fm9Q=="

    context {
      poc = "dojo"
    }
  }
}
