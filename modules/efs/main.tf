resource "aws_security_group" "efs_sg" {
  name        = "efs_sg"
  description = "Allow access to EFS from EC2 instance"

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    security_groups = [var.ec2_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
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
  subnet_id       = var.subnet_id
 security_groups = [aws_security_group.efs_sg.id]
}