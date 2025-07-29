
resource "aws_route_table" "public_route_table_a" {

  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-east-ig.id
  }

  tags = merge(var.default_tags, {Name = "main-public-route-table-A"})

}

resource "aws_route_table" "public_route_table_b" {

  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-east-ig.id
  }

  tags = merge(var.default_tags, {Name = "main-public-route-table-B"})

}

resource "aws_route_table_association" "public_route_table_association_a" {
  subnet_id      = aws_subnet.vpc-public-subnet_a.id
  route_table_id = aws_route_table.public_route_table_a.id

}

resource "aws_route_table_association" "public_route_table_association_b" {
  subnet_id      = aws_subnet.vpc-public-subnet_b.id
  route_table_id = aws_route_table.public_route_table_b.id

}

###### Route traffic between public/private VLAN with below
/*
resource "aws_route_table" "public_route_table_a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "main-east-ig-public-route-table"
  }

}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id = aws_subnet.vpc-public-subnet_a.id
  depends_on = [ aws_internet_gateway.main-east-ig ]

}

*/