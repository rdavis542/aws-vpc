
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

resource "aws_route_table" "private_route_table_b" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "main-east-ig-private-route-table"
  }
}

resource "aws_route_table_association" "private_route_table_association_b" {
  subnet_id      = aws_subnet.vpc-private-subnet_b.id
  route_table_id = aws_route_table.private_route_table_b.id

}

resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"
  
  tags = {
    Name = "nat-eip"
  }

  depends_on = [aws_internet_gateway.main-east-ig]
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id = aws_subnet.vpc-public-subnet_a.id
  depends_on = [ aws_internet_gateway.main-east-ig ]
}


#####  VPC Endpoint for a S3 private endpoint
# Remove comments to use
#
/*
resource "aws_vpc_endpoint" "s3_private_endpoint" {

  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.s3"

}

resource "aws_vpc_endpoint_route_table_association" "s3_private_endpoint_vpc_associaton_a" {
  route_table_id  = aws_route_table.private_route_table_a.id
  vpc_endpoint_id = aws_vpc_endpoint.s3_private_endpoint.id

}
*/