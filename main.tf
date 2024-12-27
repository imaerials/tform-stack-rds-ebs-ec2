terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.example.public_key_openssh
}
resource "aws_eip" "elastic_ip" {
  instance = aws_instance.web_server.id
}

resource "aws_eip_association" "main" {
  instance_id   = aws_instance.web_server.id
  allocation_id = aws_eip.elastic_ip.id
}
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP, HTTPS, and SSH access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.web_sg.name]
 user_data = file("${path.module}/web-server-install.sh")
  tags = {
    Name = "GhostCms"
  }
}

output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}