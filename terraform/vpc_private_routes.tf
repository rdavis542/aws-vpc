resource "aws_eip" "nat_gateway_eip" {
  count      = var.enable_nat_gateway ? 1 : 0
  domain     = "vpc"
  depends_on = [aws_internet_gateway.main-east-ig]

  tags = { Name = "nat-eip" }
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = var.enable_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat_gateway_eip[0].id
  subnet_id     = aws_subnet.vpc-public-subnet-a.id
  depends_on    = [aws_internet_gateway.main-east-ig]

  tags = { Name = "nat-gateway" }
}

resource "aws_route_table" "private_route_table_a" {
  vpc_id = aws_vpc.main.id

  dynamic "route" {
    for_each = var.enable_nat_gateway ? [1] : []
    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat_gateway[0].id
    }
  }

  tags = { Name = "private-route-table-A" }
}

resource "aws_route_table_association" "private_route_table_association_a" {
  subnet_id      = aws_subnet.vpc-private-subnet-a.id
  route_table_id = aws_route_table.private_route_table_a.id
}

resource "aws_route_table" "private_route_table_b" {
  vpc_id = aws_vpc.main.id

  dynamic "route" {
    for_each = var.enable_nat_gateway ? [1] : []
    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat_gateway[0].id
    }
  }

  tags = { Name = "private-route-table-B" }
}

resource "aws_route_table_association" "private_route_table_association_b" {
  subnet_id      = aws_subnet.vpc-private-subnet-b.id
  route_table_id = aws_route_table.private_route_table_b.id
}

resource "aws_route_table" "private_route_table_c" {
  vpc_id = aws_vpc.main.id

  dynamic "route" {
    for_each = var.enable_nat_gateway ? [1] : []
    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat_gateway[0].id
    }
  }

  tags = { Name = "private-route-table-C" }
}

resource "aws_route_table_association" "private_route_table_association_c" {
  subnet_id      = aws_subnet.vpc-private-subnet-c.id
  route_table_id = aws_route_table.private_route_table_c.id
}


#####  VPC Endpoint for a S3 private endpoint
# Remove comments to use
#

resource "aws_vpc_endpoint" "s3_private_endpoint" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.s3"

  route_table_ids = [
    aws_route_table.private_route_table_a.id,
    aws_route_table.private_route_table_b.id,
    aws_route_table.private_route_table_c.id
  ]

  tags = {
    Name = "s3-vpc-endpoint"
  }
}