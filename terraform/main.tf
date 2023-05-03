terraform {
  backend "s3" {
    bucket         = "tfstategit"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}


resource "aws_vpc" "main" {

  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {

    Name = "vpc_east_1"

  }

}

resource "aws_subnet" "vpc-subnets" {

  vpc_id                  = aws_vpc.main.id
  for_each                = var.subnet
  cidr_block              = each.value
  map_public_ip_on_launch = true
  availability_zone       = var.az

  tags = {
    "Name" = "public-sn-${each.key}"
  }

}