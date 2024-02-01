resource "aws_vpc" "main" {

  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {

    Name = "vpc_east_1"

  }

}

resource "aws_internet_gateway" "main-east-ig" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-east-ig"
  }

}