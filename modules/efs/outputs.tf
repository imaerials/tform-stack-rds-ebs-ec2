output "efs_dns_name" {
  value = aws_efs_file_system.efs.dns_name
}

output "efs_mount_target_dns_name" {
  value = aws_efs_mount_target.efs_mount_target[0].dns_name
}