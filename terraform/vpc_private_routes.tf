
resource "aws_route_table" "private_route_table_a" {
  vpc_id = aws_vpc.main.id
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_nat_gateway.nat_gateway.id
  # }
  tags = merge(var.default_tags, { Name = "private-route-table-A" }, local.common_tags)
}


resource "aws_route_table_association" "private_route_table_association_a" {
  subnet_id      = aws_subnet.vpc-private-subnet-a.id
  route_table_id = aws_route_table.private_route_table_a.id
}

resource "aws_route_table" "private_route_table_b" {
  vpc_id = aws_vpc.main.id
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_nat_gateway.nat_gateway.id
  # }
  tags = merge(var.default_tags, { Name = "private-route-table-B" }, local.common_tags)
}

resource "aws_route_table_association" "private_route_table_association_b" {
  subnet_id      = aws_subnet.vpc-private-subnet-b.id
  route_table_id = aws_route_table.private_route_table_b.id
}

resource "aws_route_table" "private_route_table_c" {
  vpc_id = aws_vpc.main.id
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_nat_gateway.nat_gateway.id
  # }
  tags = merge(var.default_tags, { Name = "private-route-table-C" }, local.common_tags)
}

resource "aws_route_table_association" "private_route_table_association_c" {
  subnet_id      = aws_subnet.vpc-private-subnet-c.id
  route_table_id = aws_route_table.private_route_table_c.id
}

# resource "aws_eip" "nat_gateway_eip" {
#   domain = "vpc"

#   tags = {
#     Name = "nat-eip"
#   }

#   depends_on = [aws_internet_gateway.main-east-ig]
# }

# resource "aws_nat_gateway" "nat_gateway" {
#   allocation_id = aws_eip.nat_gateway_eip.id
#   subnet_id = aws_subnet.vpc-public-subnet-a.id
#   depends_on = [ aws_internet_gateway.main-east-ig ]

#   tags = merge(var.default_tags, {Name = "nat_gateway"}, local.common_tags)
# }


#####  VPC Endpoint for a S3 private endpoint
# Remove comments to use
#

resource "aws_vpc_endpoint" "s3_private_endpoint" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.s3"

  route_table_ids = [
    aws_route_table.private_route_table_a.id,
    aws_route_table.private_route_table_b.id,
    aws_route_table.private_route_table_c.id
  ]

  tags = merge(var.default_tags, { Name = "s3-vpc-endpoint" }, local.common_tags)
}