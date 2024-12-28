output "instance_id" {
  value = aws_instance.web_server.id
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "web_server_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}

output "elastic_ip" {
  value = "http://${aws_eip.elastic_ip.public_ip}"
}
output "efs_dns_name" {
  value = aws_efs_file_system.efs.dns_name
  
}
output "efs_mount_target_dns_name" {
  value = aws_efs_mount_target.efs_mount_target[0].dns_name
  
}