resource "aws_security_group" "ssh_access" {

  vpc_id                  = aws_vpc.main.id
  name        = "SSH_access"
  description = "Allow SSH Inbound"


  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh_access"
  }

}

resource "aws_security_group" "http_access" {

  vpc_id                  = aws_vpc.main.id
  name        = "http_access"
  description = "Allow http Inbound"


  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http_access"
  }

}

resource "aws_security_group" "posstgres_access" {

  vpc_id                  = aws_vpc.main.id
  name        = "postgres_access"
  description = "Allow pgsql Inbound"


  ingress {
    description = "pgsql access"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pgsql_access"
  }

}