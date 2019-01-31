variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = "0.0.0.0/0"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = "true"
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = "true"
}

variable "create_igw" {
  description = "If set to true create IGW, default set to false"
  default = false
}