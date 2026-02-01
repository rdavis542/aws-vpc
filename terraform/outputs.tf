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

# NAT Gateway outputs (uncomment if NAT Gateway is enabled)
# output "nat_gateway_id" {
#   description = "ID of the NAT Gateway"
#   value       = aws_nat_gateway.nat_gateway.id
# }
#
# output "nat_gateway_public_ip" {
#   description = "Public IP of the NAT Gateway"
#   value       = aws_eip.nat_gateway_eip.public_ip
# }

# Security Group outputs
output "sg_web_id" {
  description = "ID of the web tier security group"
  value       = aws_security_group.web.id
}

output "sg_app_id" {
  description = "ID of the app tier security group"
  value       = aws_security_group.app.id
}

output "sg_db_id" {
  description = "ID of the database tier security group"
  value       = aws_security_group.db.id
}

output "sg_bastion_id" {
  description = "ID of the bastion security group"
  value       = aws_security_group.bastion.id
}

output "sg_internal_ssh_id" {
  description = "ID of the internal SSH security group"
  value       = aws_security_group.internal_ssh.id
}

# NACL outputs
output "nacl_public_id" {
  description = "ID of the public subnet NACL"
  value       = aws_network_acl.public.id
}

output "nacl_private_id" {
  description = "ID of the private subnet NACL"
  value       = aws_network_acl.private.id
}

# Flow Logs output
output "flow_log_group_name" {
  description = "Name of the CloudWatch log group for VPC flow logs"
  value       = aws_cloudwatch_log_group.vpc_flow_logs.name
}