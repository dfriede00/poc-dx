provider "aws" {
  region   = "us-east-1"
  insecure = true

  profile = "customprofile"
}

module "vpc" {
  source = "modules/vpc"

  cidr = "10.64.128.0/23"

  enable_dns_hostnames = true
  enable_dns_support   = true

  create_igw = true
}

module "vpn" {
  source = "modules/vpn"

  vpc_id = "${module.vpc.vpc_id}"

  aws_side_asn = "7224"

  customer_side_asn = "65000"
  customer_vpn_ip   = "35.129.37.187"

  # tunnel inside cidr & preshared keys (optional)
  # tunnel1_inside_cidr   = "${var.custom_tunnel1_inside_cidr}"
  # tunnel2_inside_cidr   = "${var.custom_tunnel2_inside_cidr}"
  # tunnel1_preshared_key = "${var.custom_tunnel1_preshared_key}"
  # tunnel2_preshared_key = "${var.custom_tunnel2_preshared_key}"
}

data "aws_caller_identity" "current" {}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}