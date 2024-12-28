resource "aws_efs_file_system" "efs" {
  creation_token = "my-efs"
  performance_mode = "generalPurpose"

  tags = {
    Name = var.efs_name
  }
}

resource "aws_efs_mount_target" "efs_mount_target" {
  count           = 1
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = aws_instance.web_server.subnet_id
  security_groups = [aws_security_group.web_sg.id]
}