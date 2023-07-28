terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  user_data              = file("${path.module}/script.sh")
  vpc_security_group_ids = [aws_security_group.client_sg.id]


  tags = {
    Name = "demoServer"
  }
}

resource "aws_security_group" "client_sg" {
  name        = "client_sg"
  description = "enable http access on port 80"
  vpc_id      = "vpc-08d0e1e79634b3555"

  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Client_sg"
  }
}

output "instance_id" {
  value = aws_instance.app_server.id
}

output "ec2_public_ips" {
  value = aws_instance.app_server.public_ip
}