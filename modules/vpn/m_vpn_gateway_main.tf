resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = "${var.vpc_id}"
  amazon_side_asn = "${var.aws_side_asn}"

#   tags = {
#     Name = "main"
#   }
}
resource "aws_customer_gateway" "vpn_cgw" {
  bgp_asn    = "${var.customer_side_asn}"
  ip_address = "${var.customer_vpn_ip}"
  type       = "${var.vpn_type}"

  # tags = {
  #   Name = "main-customer-gateway"
  # }
}
resource "aws_vpn_connection" "vpn_connection" {
  vpn_gateway_id      = "${aws_vpn_gateway.vpn_gw.id}"
  customer_gateway_id = "${aws_customer_gateway.vpn_cgw.id}"
  type                = "ipsec.1"
  static_routes_only  = true
}