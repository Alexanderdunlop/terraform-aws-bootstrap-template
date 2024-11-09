terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "REPLACE_WITH_YOUR_BUCKET_NAME"
    key            = "terraform.tfstate"
    region         = "REPLACE_WITH_YOUR_REGION"
    dynamodb_table = "REPLACE_WITH_YOUR_DYNAMODB_TABLE"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn = var.terraform_role_arn
  }

  default_tags {
    tags = var.default_tags
  }
}