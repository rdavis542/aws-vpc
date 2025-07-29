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

output "public_subnet_id_A" {
  description = "ID of the public subnet A"
  value       = aws_subnet.vpc-public-subnet_a.id
}

output "public_subnet_id_B" {
  description = "ID of the public subnet B"
  value       = aws_subnet.vpc-public-subnet_b.id
}

output "private_subnet_id_A" {
  description = "ID of the private subnet A"
  value       = aws_subnet.vpc-public-subnet_a.id
}

output "private_subnet_id_A" {
  description = "ID of the private subnet B"
  value       = aws_subnet.vpc-public-subnet_b.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main-east-ig.id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.id
}