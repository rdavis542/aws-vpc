resource "aws_subnet" "vpc-public-subnet_a" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_public_a
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = merge(var.default_tags, {Name = "public-subnet-a"})

}

resource "aws_subnet" "vpc-private-subnet_a" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_private_a
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = merge(var.default_tags, {Name = "private-subnet-a"})

}

resource "aws_subnet" "vpc-public-subnet_b" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_public_b
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = merge(var.default_tags, {Name = "public-subnet-b"})

}

resource "aws_subnet" "vpc-private-subnet_b" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_private_b
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = merge(var.default_tags, {Name = "private-subnet-b"})

}

# resource "aws_subnet" "vpc-public-subnet_c" {

#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = var.subnet_public_c
#   map_public_ip_on_launch = true
#   availability_zone       = data.aws_availability_zones.available.names[0]
#   tags = merge(var.default_tags, {Name = "public-subnet-c"})

# }

# resource "aws_subnet" "vpc-private-subnet_c" {

#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.subnet_private_c
#   availability_zone = data.aws_availability_zones.available.names[1]
#   tags = merge(var.default_tags, {Name = "private-subnet-c"})

# }