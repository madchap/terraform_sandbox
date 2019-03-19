variable "vpc_region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.80.0.0/16"
}

variable "vpc_name" {
  default = "primary"
}

variable "public_subnet_cidr" {
  default = "10.80.10.0/24"
}

variable "default_tags" {
  type = "map"

  default = {
    project   = "holycow"
    Protected = "false"
  }
}

variable "fbi_key" {
  type = "map"

  default = {
    key_name   = "fbi-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHIOPoOVLPS1SuMHFLOWq8zU8axbdweMkvZVF/xlDK8gtp+lCWi7laaViNE5gIm93Id7bWK6FO/HbUCgpmxOMkRCKvea2ANqTwfNtysR26fC3iJf4jeFuL9Bl57nVLPYh+DlJ2SeQcYKUPAL1XDuEs/ujeR5X4fdu4b8UC9hDYNyUy876Xuxe+fdFtbW5OhIPreZ4tR97K4zzEpWlPwGGKCQgPZmyCo+xSwIfVrb6QsA1zyyF67gEVRelkSOoE6QgphI+UxxB0UHztMEapCu005WsadqRBeNAV2tjlZDyWpqEBmSLmPwYxyZz9zi6tpVGtelcE10rmt5B2h1+njt3b cardno:000604160075"
  }
}
