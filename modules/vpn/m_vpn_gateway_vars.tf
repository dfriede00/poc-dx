variable "vpc_id" {
  description = "VPC id"
}
variable "aws_side_asn" {
  description = "(Optional) The Autonomous System Number (ASN) for the Amazon side of the gateway. Default is 65000"
  default = "7224"
}
variable "customer_side_asn" {
  description = "(Required) The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN)"
  default = ""
}
variable "customer_vpn_ip" {
  description = "(Required) The IP address of the gateway's Internet-routable external interface"
  default = ""
}
variable "vpn_type" {
  description = " (Required) The type of customer gateway. The only type AWS supports at this time is ipsec.1"
  default = "ipsec.1"
}

