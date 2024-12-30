variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.medium"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  default     = "ami-005fc0f236362e99f"
}

variable "efs_dns_name" {
  description = "The DNS name of the EFS file system"
}

variable "node_version" {
  description = "The version of Node.js to install"
  default     = "20"
}