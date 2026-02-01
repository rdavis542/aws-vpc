# Security Groups - Baseline configurations for web, app, and database tiers

# Web Tier Security Group (Public-facing)
resource "aws_security_group" "web" {
  name        = "web-tier-sg"
  description = "Security group for web tier - allows HTTP/HTTPS from internet"
  vpc_id      = aws_vpc.main.id

  # HTTP from anywhere
  ingress {
    description = "HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS from anywhere
  ingress {
    description = "HTTPS from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-tier-sg"
    Tier = "web"
  }
}

# Application Tier Security Group (Private)
resource "aws_security_group" "app" {
  name        = "app-tier-sg"
  description = "Security group for application tier - allows traffic from web tier"
  vpc_id      = aws_vpc.main.id

  # Allow traffic from web tier on common app ports
  ingress {
    description     = "HTTP from web tier"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  ingress {
    description     = "HTTPS from web tier"
    from_port       = 8443
    to_port         = 8443
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  # Allow internal VPC traffic for service-to-service communication
  ingress {
    description = "Internal VPC traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  # Allow all outbound traffic
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-tier-sg"
    Tier = "app"
  }
}

# Database Tier Security Group (Private - most restrictive)
resource "aws_security_group" "db" {
  name        = "db-tier-sg"
  description = "Security group for database tier - allows traffic only from app tier"
  vpc_id      = aws_vpc.main.id

  # PostgreSQL from app tier
  ingress {
    description     = "PostgreSQL from app tier"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }

  # MySQL/Aurora from app tier
  ingress {
    description     = "MySQL from app tier"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }

  # Redis from app tier
  ingress {
    description     = "Redis from app tier"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }

  # Allow outbound to VPC only (databases shouldn't reach internet)
  egress {
    description = "Outbound to VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_block]
  }

  tags = {
    Name = "db-tier-sg"
    Tier = "db"
  }
}

# Bastion/Jump Host Security Group
resource "aws_security_group" "bastion" {
  name        = "bastion-sg"
  description = "Security group for bastion/jump hosts"
  vpc_id      = aws_vpc.main.id

  # SSH from specific IPs
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr_blocks
  }

  # Allow all outbound traffic
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
    Tier = "management"
  }
}

# Internal SSH access - allows SSH from bastion to private instances
resource "aws_security_group" "internal_ssh" {
  name        = "internal-ssh-sg"
  description = "Allows SSH from bastion hosts to private instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "SSH from bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "internal-ssh-sg"
    Tier = "management"
  }
}
