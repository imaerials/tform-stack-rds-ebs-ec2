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

module "ec2" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  ami_id        = var.ami_id
  efs_dns_name  = module.efs.efs_dns_name
  node_version  = var.node_version
}

module "efs" {
  source            = "./modules/efs"
  efs_name          = var.efs_name
  subnet_id         = module.ec2.subnet_id
  ec2_security_group_id = module.ec2.security_group_id
}

module "rds" {
  source      = "./modules/rds"
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}