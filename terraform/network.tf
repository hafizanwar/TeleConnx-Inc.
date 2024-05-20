# VPC
resource "aws_vpc" "us_east_1_vpc" {
  provider             = aws
  cidr_block           = var.cidr_block_us_east_1_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "us-east-1-vpc"
  }
}

resource "aws_vpc" "us_west_1_vpc" {
  provider             = aws.west
  cidr_block           = var.cidr_block_us_west_1_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "us-west-1-vpc"
  }
}

# Subnets
resource "aws_subnet" "us_east_1_public" {
  provider    = aws
  vpc_id      = aws_vpc.us_east_1_vpc.id
  cidr_block  = var.cidr_block_us_east_1_public_subnet
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "us-east-1-public"
  }
}

resource "aws_subnet" "us_east_1_private" {
  provider    = aws
  vpc_id      = aws_vpc.us_east_1_vpc.id
  cidr_block  = var.cidr_block_us_east_1_private_subnet
  map_public_ip_on_launch = false
  tags = {
    Name = "us-east-1-private"
  }
}

resource "aws_subnet" "us_west_1_public" {
  provider    = aws.west
  vpc_id      = aws_vpc.us_west_1_vpc.id
  cidr_block  = var.cidr_block_us_west_1_public_subnet
  map_public_ip_on_launch = true
  tags = {
    Name = "us-west-1-public"
  }
}


# Internet Gateways
resource "aws_internet_gateway" "us_east_1_igw" {
  provider = aws
  vpc_id   = aws_vpc.us_east_1_vpc.id
}

resource "aws_internet_gateway" "us_west_1_igw" {
  provider = aws.west
  vpc_id   = aws_vpc.us_west_1_vpc.id
}

# Route Tables
resource "aws_route_table" "us_east_1_public_rt" {
  provider = aws
  vpc_id   = aws_vpc.us_east_1_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us_east_1_igw.id
  }

  tags = {
    Name = "Public-RT-East-1"
  }
}

resource "aws_route_table" "us_west_1_public_rt" {
  provider = aws.west
  vpc_id   = aws_vpc.us_west_1_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us_west_1_igw.id
  }

  tags = {
    Name = "Public-RT-West-1"
  }
}

# Associate Route Tables with Subnets
resource "aws_route_table_association" "us_east_1_public_assoc" {
  provider       = aws
  subnet_id      = aws_subnet.us_east_1_public.id
  route_table_id = aws_route_table.us_east_1_public_rt.id
}

resource "aws_route_table_association" "us_west_1_public_assoc" {
  provider       = aws.west
  subnet_id      = aws_subnet.us_west_1_public.id
  route_table_id = aws_route_table.us_west_1_public_rt.id
}
