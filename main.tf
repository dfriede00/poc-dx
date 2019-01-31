provider "aws" {
  region   = "us-east-1"
  insecure = true

  profile = "customprofile"
}

module "this_vpc" {
  source = "modules/vpc"

  cidr                 = "10.64.128.0/23"
  enable_dns_hostnames = true
  enable_dns_support   = true
  create_igw           = true

  #  tags = "something here"
}

module "vpn_gateway" {
  source = "modules/vpn_gateway"

  vpc_id              = "${module.vpc.vpc_id}"
  vpn_gateway_id      = "${module.vpc.vgw_id}"
  customer_gateway_id = "${aws_customer_gateway.main.id}"

  # precalculated length of module variable vpc_subnet_route_table_ids
  vpc_subnet_route_table_count = 3
  vpc_subnet_route_table_ids   = ["${module.vpc.private_route_table_ids}"]

  # tunnel inside cidr & preshared keys (optional)
  tunnel1_inside_cidr   = "${var.custom_tunnel1_inside_cidr}"
  tunnel2_inside_cidr   = "${var.custom_tunnel2_inside_cidr}"
  tunnel1_preshared_key = "${var.custom_tunnel1_preshared_key}"
  tunnel2_preshared_key = "${var.custom_tunnel2_preshared_key}"
}
