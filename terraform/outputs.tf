output "vpc_arn" {
  value = aws_vpc.main.arn
}

output "vpc_owner_id" {
  value = aws_vpc.main.owner_id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of all public subnets"
  value = [
    aws_subnet.vpc-public-subnet-a.id,
    aws_subnet.vpc-public-subnet-b.id,
    aws_subnet.vpc-public-subnet-c.id
  ]
}

output "public_subnet_id_a" {
  description = "ID of public subnet A"
  value       = aws_subnet.vpc-public-subnet-a.id
}

output "public_subnet_id_b" {
  description = "ID of public subnet B"
  value       = aws_subnet.vpc-public-subnet-b.id
}

output "public_subnet_id_c" {
  description = "ID of public subnet C"
  value       = aws_subnet.vpc-public-subnet-c.id
}

output "private_subnet_ids" {
  description = "IDs of all private subnets"
  value = [
    aws_subnet.vpc-private-subnet-a.id,
    aws_subnet.vpc-private-subnet-b.id,
    aws_subnet.vpc-private-subnet-c.id
  ]
}

output "private_subnet_id_a" {
  description = "ID of private subnet A"
  value       = aws_subnet.vpc-private-subnet-a.id
}

output "private_subnet_id_b" {
  description = "ID of private subnet B"
  value       = aws_subnet.vpc-private-subnet-b.id
}

output "private_subnet_id_c" {
  description = "ID of private subnet C"
  value       = aws_subnet.vpc-private-subnet-c.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main-east-ig.id
}

# output "nat_gateway_id" {
#   description = "ID of the NAT Gateway"
#   value       = aws_nat_gateway.nat_gateway.id
# }