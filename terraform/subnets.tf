# Public Subnets - One per Availability Zone
# These subnets have direct internet access via Internet Gateway

resource "aws_subnet" "vpc-public-subnet-a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_public_a
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "public-subnet-a"
    Type = "public"
    Tier = "web"
    AZ   = data.aws_availability_zones.available.names[0]
  }
}

resource "aws_subnet" "vpc-public-subnet-b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_public_b
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "public-subnet-b"
    Type = "public"
    Tier = "web"
    AZ   = data.aws_availability_zones.available.names[1]
  }
}

resource "aws_subnet" "vpc-public-subnet-c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_public_c
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "public-subnet-c"
    Type = "public"
    Tier = "web"
    AZ   = data.aws_availability_zones.available.names[2]
  }
}

# Private Subnets - One per Availability Zone
# These subnets have no direct internet access

resource "aws_subnet" "vpc-private-subnet-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_private_a
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "private-subnet-a"
    Type = "private"
    Tier = "app"
    AZ   = data.aws_availability_zones.available.names[0]
  }
}

resource "aws_subnet" "vpc-private-subnet-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_private_b
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "private-subnet-b"
    Type = "private"
    Tier = "app"
    AZ   = data.aws_availability_zones.available.names[1]
  }
}

resource "aws_subnet" "vpc-private-subnet-c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_private_c
  availability_zone = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "private-subnet-c"
    Type = "private"
    Tier = "app"
    AZ   = data.aws_availability_zones.available.names[2]
  }
}