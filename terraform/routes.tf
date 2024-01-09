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
  subnet_id      = aws_subnet.vpc-public-subnet_a.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table_association" "public_route_table_association_b" {
  subnet_id      = aws_subnet.vpc-public-subnet_b.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table" "private_route_table_a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "main-east-ig-private-route-table"
  }

}

resource "aws_route_table_association" "private_route_table_association_a" {
  subnet_id      = aws_subnet.vpc-private-subnet_a.id
  route_table_id = aws_route_table.private_route_table_a.id

}

resource "aws_eip" "nat_gateway_eip" {
  vpc = "true"

}

#resource "aws_nat_gateway" "nat_gateway" {
#  allocation_id = aws_eip.nat_gateway_eip.id
#  subnet_id = aws_subnet.vpc-public-subnet_a.id
#  depends_on = [ aws_internet_gateway.main-east-ig ]

#}

resource "aws_vpc_endpoint" "s3_private_endpoint" {

  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.s3"

}

resource "aws_vpc_endpoint_route_table_association" "s3_private_endpoint_vpc_associaton_a" {
  route_table_id  = aws_route_table.private_route_table_a.id
  vpc_endpoint_id = aws_vpc_endpoint.s3_private_endpoint.id

}