############
# VPC MODULE
############
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  # tags = {
  #   Name = "something here"
  # }
}

resource "aws_internet_gateway" "igw" {
  count  = "${var.create_igw}"
  vpc_id = "${aws_vpc.vpc.id}"

  # tags = {
  #   Name = "something here"
  # }
}
