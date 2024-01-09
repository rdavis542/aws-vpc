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

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_private_a
  availability_zone = var.az1

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

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_private_b
  availability_zone = var.az2

  tags = {
    "Name" = "private-subnet-b"
  }

}
