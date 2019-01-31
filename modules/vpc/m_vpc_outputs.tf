output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${aws_vpc.this.id}"
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = "${aws_vpc.this.cidr_block}"
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = "${aws_vpc.this.enable_dns_hostnames}"
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = "${aws_vpc.this.enable_dns_support}"
}

output "vpc_arn" {
  description = "ARN of the VPC"
  value       = "${aws_vpc.this.arn}"
}
