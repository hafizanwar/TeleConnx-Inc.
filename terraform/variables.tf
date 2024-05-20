variable "key_pair_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "server-key-pair"
}

variable "ami_us_east_1" {
  description = "AMI ID for instances in us-east-1"
  type        = string
  default     = "ami-058bd2d568351da34"
}

variable "ami_us_west_1" {
  description = "AMI ID for instances in us-west-1"
  type        = string
  default     = "ami-0aafdae616ee7c9b7"
}

variable "instance_type_public" {
  description = "Instance type for public instances"
  type        = string
  default     = "t3.micro"
}

variable "instance_type_private" {
  description = "Instance type for private instances"
  type        = string
  default     = "t3.small"
}


variable "cidr_block_us_east_1_vpc" {
  description = "CIDR block for the VPC in us-east-1"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr_block_us_west_1_vpc" {
  description = "CIDR block for the VPC in us-west-1"
  type        = string
  default     = "10.1.0.0/16"
}

variable "cidr_block_us_east_1_public_subnet" {
  description = "CIDR block for the public subnet in us-east-1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "cidr_block_us_east_1_private_subnet" {
  description = "CIDR block for the private subnet in us-east-1"
  type        = string
  default     = "10.0.2.0/24"
}

variable "cidr_block_us_west_1_public_subnet" {
  description = "CIDR block for the public subnet in us-west-1"
  type        = string
  default     = "10.1.1.0/24"
}
