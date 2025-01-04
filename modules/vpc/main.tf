data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  count                  = var.subnet_count.public
  availability_zone = data.aws_availability_zones.available.names[count.index]
}

resource "aws_subnet" "private" {
  vpc_id      = aws_vpc.main.id
  cidr_block  = var.private_subnet_cidr_blocks[count.index] 
  count                  = var.subnet_count.private
availability_zone = data.aws_availability_zones.available.names[count.index]
}

