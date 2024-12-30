output "instance_id" {
  value = module.ec2.instance_id
}

output "public_ip" {
  value = module.ec2.public_ip
}

output "web_server_url" {
  value = module.ec2.web_server_url
}

output "elastic_ip" {
  value = module.ec2.elastic_ip
}

output "efs_dns_name" {
  value = module.efs.efs_dns_name
}

output "efs_mount_target_dns_name" {
  value = module.efs.efs_mount_target_dns_name
}
output "subnet_id" {
  value = module.ec2.subnet_id
}

output "security_group_id" {
  value = module.ec2.security_group_id
}