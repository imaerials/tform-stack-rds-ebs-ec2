output "name" {
  value = aws_vpc.main.tags.Name
  
}
output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_public_subnet_id" {
  value = aws_subnet.public_subnet[0].id
}
output "vpc_private_subnet_id" {
  value = aws_subnet.private_subnet[0].id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnet[*].id
}