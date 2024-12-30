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
  default     = "password"  # Update with a secure password
}