# Network ACLs - Defense in depth layer for subnet-level traffic control

# Public Subnet NACL
resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [
    aws_subnet.vpc-public-subnet-a.id,
    aws_subnet.vpc-public-subnet-b.id,
    aws_subnet.vpc-public-subnet-c.id
  ]

  # Inbound Rules
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  # Ephemeral ports for return traffic
  ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # Allow ICMP for ping/diagnostics
  ingress {
    protocol   = "icmp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = -1
    icmp_code  = -1
  }

  # Outbound Rules
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # Ephemeral ports for responses
  egress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # Allow outbound to private subnets
  egress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = var.cidr_block
    from_port  = 0
    to_port    = 65535
  }

  # Allow ICMP outbound
  egress {
    protocol   = "icmp"
    rule_no    = 160
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = -1
    icmp_code  = -1
  }

  tags = {
    Name = "public-nacl"
    Tier = "public"
  }
}

# Private Subnet NACL
resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [
    aws_subnet.vpc-private-subnet-a.id,
    aws_subnet.vpc-private-subnet-b.id,
    aws_subnet.vpc-private-subnet-c.id
  ]

  # Inbound Rules - Allow from VPC CIDR
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.cidr_block
    from_port  = 0
    to_port    = 65535
  }

  # Ephemeral ports for return traffic from internet (via NAT)
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # Allow ICMP from VPC
  ingress {
    protocol   = "icmp"
    rule_no    = 120
    action     = "allow"
    cidr_block = var.cidr_block
    from_port  = 0
    to_port    = 0
    icmp_type  = -1
    icmp_code  = -1
  }

  # Outbound Rules - Allow to VPC
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.cidr_block
    from_port  = 0
    to_port    = 65535
  }

  # Allow outbound HTTP/HTTPS (via NAT)
  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # Ephemeral ports for responses
  egress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # Allow ICMP outbound
  egress {
    protocol   = "icmp"
    rule_no    = 150
    action     = "allow"
    cidr_block = var.cidr_block
    from_port  = 0
    to_port    = 0
    icmp_type  = -1
    icmp_code  = -1
  }

  tags = {
    Name = "private-nacl"
    Tier = "private"
  }
}
