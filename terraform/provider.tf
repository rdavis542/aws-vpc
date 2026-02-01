terraform {
  required_version = ">=1.1.0"
  required_providers {
    aws = {
      version = ">= 4.0.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket  = "tf-state-replication-source-350726165848"
    key     = "terraform-vpc.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}


provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = "development"
      Project     = "aws-vpc"
      ManagedBy   = "Terraform"
      Repository  = "aws-vpc"
      Owner       = "ryan_davis542@outlook.com"
      CostCenter  = "Network"
      Region      = var.region
    }
  }
}
