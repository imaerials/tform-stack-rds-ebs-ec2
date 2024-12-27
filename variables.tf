variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.small"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  default     = "ami-005fc0f236362e99f"  # Update with a valid AMI ID for your region
}