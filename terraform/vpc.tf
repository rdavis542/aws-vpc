resource "aws_vpc" "main" {

  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-east-2"
  }
}

resource "aws_internet_gateway" "main-east-ig" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "inet-gw-east-2"
  }
}