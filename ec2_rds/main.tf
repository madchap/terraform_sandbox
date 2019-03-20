provider "aws" {
  region  = "${var.vpc_region}"
  profile = "${var.profile_name}"
}

module "vpc" {
  source = "./vpc"

  vpc_region   = "${var.vpc_region}"
  vpc_name     = "${var.vpc_name}"
  vpc_cidr     = "${var.vpc_cidr}"
  default_tags = "${var.default_tags}"
}

module "public_subnet" {
  source = "./sub_pub"

  vpc_id              = "${module.vpc.id}"
  public_subnet_cidrs = "${var.public_subnet_cidrs}"
  default_tags        = "${var.default_tags}"
}

module "sg" {
  source = "./sg"

  vpc_id       = "${module.vpc.id}"
  fred_home_ip = "${var.fred_home_ip}"
  default_tags = "${var.default_tags}"
}

module "instance" {
  source = "./instance"

  vpc_id             = "${module.vpc.id}"
  public_subnet_id   = "${module.public_subnet.public_subnet_id}"
  security_group_ids = ["${module.sg.sg_list}"]
  pub_key            = "${var.madchap_key}"
  default_tags       = "${var.default_tags}"
}

module "rds" {
  source = "./rds"
  
  vpc_id             = "${module.vpc.id}"
}
