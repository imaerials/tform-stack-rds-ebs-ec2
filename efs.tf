resource "aws_efs_file_system" "efs" {
  creation_token = "my-efs"
  performance_mode = "generalPurpose"

  tags = {
    Name = var.efs_name
  }
}