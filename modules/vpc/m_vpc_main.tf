######
# VPC
######
resource "aws_vpc" "this" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  #  tags = "${merge(map("Name", format("%s", var.name)), var.tags, var.vpc_tags)}"
}

resource "aws_internet_gateway" "igw" {
  count = "${var.create_igw}"
  vpc_id = "${aws_vpc.this.id}"

  # tags = "something here"
}