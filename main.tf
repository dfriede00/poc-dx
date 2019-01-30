provider "aws" {
  region   = "us-east-1"
  insecure = true
  alias    = "poc-dx"
  profile  = "customprofile"
}
