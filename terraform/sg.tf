# Security Group for US-East-1 Public
resource "aws_security_group" "public_sg_east_1" {
  provider = aws
  vpc_id = aws_vpc.us_east_1_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["10.0.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public-SG-East-1"
  }
}

# Security Group for US-East-1 Private
resource "aws_security_group" "private_sg_east_1" {
  provider = aws
  vpc_id = aws_vpc.us_east_1_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.public_sg_east_1.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = {
    Name = "Private-SG-East-1"
  }
}

# Security Group for US-West-1 Public
resource "aws_security_group" "public_sg_west_1" {
  provider = aws.west
  vpc_id = aws_vpc.us_west_1_vpc.id

  # Allow SSH access from us-west-1 subnet
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = [aws_subnet.us_east_1_public.cidr_block, aws_subnet.us_east_1_private.cidr_block]
  }


  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public-SG-West-1"
  }
}

