variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.medium"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  default     = "ami-005fc0f236362e99f"  # Update with a valid AMI ID for your region
}
variable "db_name" {
  description = "The name of the RDS database"
  default     = "mydatabase"
}

variable "db_username" {
  description = "The username for the RDS database"
  default     = "admin"
}

variable "db_password" {
  description = "The password for the RDS database"
  default     = "password"  # Update with a secure password
}