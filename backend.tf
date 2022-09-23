# variable "aws_access_key" {}
# variable "aws_secret_key" {}

terraform {
  required_version = "1.2.7"
  backend "s3" {
    bucket = "eikatsu-terraform-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
    access_key = "AKIATMIN2YYZJ5Z673GE"
    secret_key = "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"
    # access_key = var.aws_access_key
    # secret_key = var.aws_secret_key
  }
}

provider "aws" {
  region = "ap-northeast-1"
  # access_key = "AKIATMIN2YYZJ5Z673GE"
  # secret_key = "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"
  # shared_credentials_files = ["~/.aws/credentials"]
  # profile = "terraform"
}
