variable "db_name" {
  description = "The name of the RDS database"
  default     = "cmsdb"
}

variable "db_username" {
  description = "The username for the RDS database"
  default     = "admin"
}

variable "db_password" {
  description = "The password for the RDS database"
  default     = "password"  
}
variable "multi_az" {
  default     = false
  description = "Muti-az allowed?"
}
variable "subnet_ids" {
  type        = list
  description = "Subnet ids"
}
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "environment_name" {
  description = "The name of the environment (e.g., dev, staging, prod)"
  type        = string
}