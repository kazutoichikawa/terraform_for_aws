terraform {
  required_version = "1.2.7"
  backend "s3" {
    bucket = "ba-terraform-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
