
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "subnet_count" {
  description = "The number of subnets to create"
  type        = map
  default     = {
    public  = 1
    private = 2
  }
}
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "The CIDR block for the public subnet"
  type        = list(string)
  default     = [
    "10.0.1.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "The CIDR block for the private subnet"
  type        = list(string)
  default     = [
    "10.0.101.0/24",
    "10.0.102.0/24",
  ]

}