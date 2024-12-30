variable "efs_name" {
  description = "The name of the EFS file system"
  default     = "cms-efs"
}

variable "subnet_id" {
  description = "The subnet ID for the EFS mount target"
}

variable "ec2_security_group_id" {
  description = "The security group ID of the EC2 instance"
}