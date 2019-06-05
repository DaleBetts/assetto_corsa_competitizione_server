terraform {
  backend "s3" {
    bucket = "dataqube-terraform-remote-state"
    key    = "dev/assetto/terraform.tfstate"
    region = "eu-west-2"
  }
}
