variable "vpc_region" {
  default = "us-east-1"
}

variable "profile_name" {
  default = "default"
}

variable "vpc_cidr" {
  default = "10.80.0.0/16"
}

variable "vpc_name" {
  default = "primary"
}

variable "availability_zones" {
  description = "AZs in this region to use"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type = "list"
}

variable "public_subnet_cidrs" {
  type = "list"
  default = ["10.80.0.0/24", "10.80.10.0/24", "10.80.20.0/24"]
}

variable "default_tags" {
  type = "map"

  default = {
    "Name"      = "DefectDojo POC"
  }
}

variable "madchap_key" {
  type = "map"

  default = {
    key_name   = "madchap-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHIOPoOVLPS1SuMHFLOWq8zU8axbdweMkvZVF/xlDK8gtp+lCWi7laaViNE5gIm93Id7bWK6FO/HbUCgpmxOMkRCKvea2ANqTwfNtysR26fC3iJf4jeFuL9Bl57nVLPYh+DlJ2SeQcYKUPAL1XDuEs/ujeR5X4fdu4b8UC9hDYNyUy876Xuxe+fdFtbW5OhIPreZ4tR97K4zzEpWlPwGGKCQgPZmyCo+xSwIfVrb6QsA1zyyF67gEVRelkSOoE6QgphI+UxxB0UHztMEapCu005WsadqRBeNAV2tjlZDyWpqEBmSLmPwYxyZz9zi6tpVGtelcE10rmt5B2h1+njt3b cardno:000604160075"
  }
}

variable "fred_home_ip" {
  default = "178.39.75.28/32"
}
