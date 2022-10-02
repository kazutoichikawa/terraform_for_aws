terraform {
  required_version = "1.2.7"
  backend "s3" {
    bucket = "eikatsu-terraform-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
    access_key = "AKIATMIN2YYZJ5Z673GE"
    secret_key = "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"
  }
}

provider "aws" {
  region = "ap-northeast-1"
  access_key = "AKIATMIN2YYZJ5Z673GE"
  secret_key = "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"
}
