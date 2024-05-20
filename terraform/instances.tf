# Key creation resource for us-east-1
resource "aws_key_pair" "server_key_pair" {
  key_name   = var.key_pair_name
  public_key = file("~/.ssh/id_ed25519.pub")  # Path to your SSH public key
}

# Key creation resource for us-west-1
resource "aws_key_pair" "server_key_pair_west" {
  provider   = aws.west
  key_name   = var.key_pair_name
  public_key = file("~/.ssh/id_ed25519.pub")  # Path to your SSH public key
}

# Public Instance in US-West-1
resource "aws_instance" "public_instance_west_1" {
  provider = aws.west
  ami           = var.ami_us_west_1
  instance_type = var.instance_type_public
  subnet_id     = aws_subnet.us_west_1_public.id
  vpc_security_group_ids = [aws_security_group.public_sg_west_1.id]
  key_name = aws_key_pair.server_key_pair_west.key_name

  tags = {
    Name = "Public Instance West 1"
  }
}

# Public Instance in US-East-1
resource "aws_instance" "public_instance_east_1" {
  provider = aws
  ami           = var.ami_us_east_1
  instance_type = var.instance_type_public
  subnet_id     = aws_subnet.us_east_1_public.id
  vpc_security_group_ids = [aws_security_group.public_sg_east_1.id]
  key_name = aws_key_pair.server_key_pair.key_name

  tags = {
    Name = "Public Instance East 1"
  }
}

# Private Instance in US-East-1
resource "aws_instance" "private_instance_east_1" {
  count = 4
  provider = aws
  ami           = var.ami_us_east_1
  instance_type = var.instance_type_private
  subnet_id     = aws_subnet.us_east_1_private.id
  vpc_security_group_ids = [aws_security_group.private_sg_east_1.id]
  key_name = aws_key_pair.server_key_pair.key_name

  tags = {
    Name = "Private Instance East 1 - ${count.index + 1}"
  }
}
