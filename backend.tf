terraform {
  backend "s3" {
    bucket = "terraform-state-vini-clc16-517673439501-us-east-1-an"
    key    = "terraform/state"
    region = "us-east-1"
#    use_lockfile = true
#    encrypt = true
  }
}
