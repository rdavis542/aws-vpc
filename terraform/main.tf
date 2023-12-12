terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      version = ">= 4.0.0"
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "tfstategit"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}


provider "aws" {

  region = var.region

}


resource "aws_vpc" "main" {

  cidr_block           = var.cidr_block
  instance_tenancy = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {

    Name = "vpc_east_1"

  }

}

resource "aws_subnet" "vpc-public-subnet_a" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_public_a
  map_public_ip_on_launch = true
  availability_zone       = var.az1

  tags = {
    "Name" = "public-subnet-a"
  }

}

resource "aws_subnet" "vpc-private-subnet_a" {

  vpc_id                  = aws_vpc.main.id
  cidr_block = var.subnet_private_a
  availability_zone       = var.az1

  tags = {
    "Name" = "private-subnet-a"
  }

}

resource "aws_subnet" "vpc-public-subnet_b" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_public_b
  map_public_ip_on_launch = true
  availability_zone       = var.az2

  tags = {
    "Name" = "public-subnet-b"
  }

}

resource "aws_subnet" "vpc-private-subnet_b" {

  vpc_id                  = aws_vpc.main.id
  cidr_block = var.subnet_private_b
  availability_zone       = var.az2

  tags = {
    "Name" = "private-subnet-b"
  }

}

resource "aws_internet_gateway" "main-east-ig" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "main-east-ig"
  }
  
}

resource "aws_route_table" "public_route_table" {

 vpc_id = aws_vpc.main.id
 route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main-east-ig.id
 }
  
  tags = {
    Name = "main-east-ig-public-route-table"
  }
 
}

resource "aws_route_table_association" "public_route_table_association_a" {
  subnet_id = aws_subnet.vpc-public-subnet_a.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table_association" "public_route_table_association_b" {
  subnet_id = aws_subnet.vpc-public-subnet_b.id
  route_table_id = aws_route_table.public_route_table.id

}

#resource "aws_route_table" "private_route_table_a" {
# vpc_id = aws_vpc.main.id
# route {
 # cidr_block = "0.0.0.0/0"
  #gateway_id = aws_nat_gateway.nat_gateway.id
 #}
  
  #tags = {
  #  Name = "main-east-ig-private-route-table"
  #}
 
#}

#resource "aws_route_table_association" "private_route_table_association_a" {
#  subnet_id = aws_subnet.vpc-private-subnet_a.id
#  route_table_id = aws_route_table.private_route_table_a.id
  
#}

#resource "aws_eip" "nat_gateway_eip" {
#  vpc = "true"
#  
#}

#resource "aws_nat_gateway" "nat_gateway" {
#  allocation_id = aws_eip.nat_gateway_eip.id
#  subnet_id = aws_subnet.vpc-public-subnet_a.id
#  depends_on = [ aws_internet_gateway.main-east-ig ]
  
#}

resource "aws_vpc_endpoint" "s3_private_endpoint" {

  vpc_id = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.s3" 
  
}

resource "aws_vpc_endpoint_route_table_association" "s3_private_endpoint_vpc_associaton_a" {
  route_table_id = aws_route_table.private_route_table_a.id
  vpc_endpoint_id = aws_vpc_endpoint.s3_private_endpoint.id
  
}