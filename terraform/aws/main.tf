terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

# Create a VPC
resource "aws_vpc" "homelab_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "homelab-vpc"
  }
}

# Create a public subnet
resource "aws_subnet" "homelab_subnet" {
  vpc_id                  = aws_vpc.homelab_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "homelab-public-subnet"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "homelab_igw" {
  vpc_id = aws_vpc.homelab_vpc.id

  tags = {
    Name = "homelab-igw"
  }
}

# Create route table
resource "aws_route_table" "homelab_rt" {
  vpc_id = aws_vpc.homelab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.homelab_igw.id
  }

  tags = {
    Name = "homelab-rt"
  }
}

# Associate route table with subnet
resource "aws_route_table_association" "homelab_rta" {
  subnet_id      = aws_subnet.homelab_subnet.id
  route_table_id = aws_route_table.homelab_rt.id
}

# Security group
resource "aws_security_group" "homelab_sg" {
  name        = "homelab-sg"
  description = "Security group for homelab EC2 instance"
  vpc_id      = aws_vpc.homelab_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  ingress {
    from_port   = 1514
    to_port     = 1514
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Wazuh agent"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound"
  }

  tags = {
    Name = "homelab-sg"
  }
}

# EC2 instance
resource "aws_instance" "homelab_node" {
  ami                    = "ami-0b45ae66668865cd6"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.homelab_subnet.id
  vpc_security_group_ids = [aws_security_group.homelab_sg.id]
  key_name               = aws_key_pair.homelab_key.key_name

  tags = {
    Name = "homelab-aws-node"
  }
}

# SSH key pair
resource "aws_key_pair" "homelab_key" {
  key_name   = "homelab-key"
  public_key = file("/home/wale/.ssh/aws_homelab_key.pub")
}

# Output the public IP
output "instance_public_ip" {
  value       = aws_instance.homelab_node.public_ip
  description = "Public IP of the EC2 instance"
}
