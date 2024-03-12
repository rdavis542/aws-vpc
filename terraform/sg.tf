resource "aws_security_group" "default" {
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ssh_access" {

  vpc_id      = aws_vpc.main.id
  name        = "SSH_access"
  description = "Allow SSH Inbound"


  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.vpc-public-subnet_a.cidr_block, aws_subnet.vpc-public-subnet_b.cidr_block]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh_access"
  }

}

resource "aws_security_group" "http_access" {

  vpc_id      = aws_vpc.main.id
  name        = "http_access"
  description = "Allow http Inbound"


  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.vpc-public-subnet_a.cidr_block]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http_access"
  }

}

resource "aws_security_group" "https_access" {

  vpc_id      = aws_vpc.main.id
  name        = "https_access"
  description = "Allow https Inbound"


  ingress {
    description = "https access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.vpc-public-subnet_a.cidr_block]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http_access"
  }

}

resource "aws_security_group" "postgres_access" {

  vpc_id      = aws_vpc.main.id
  name        = "postgres_access"
  description = "Allow pgsql Inbound"


  ingress {
    description = "pgsql access"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.vpc-public-subnet_a.cidr_block]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pgsql_access"
  }

}