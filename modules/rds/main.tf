resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "rds-subnet-group"
  description = "RDS subnet group"
  subnet_ids  = var.subnet_ids
}

resource "aws_db_instance" "default" {
  identifier           = "${var.environment_name}-${var.db_name}"
  allocated_storage    = 20
  db_name              = var.db_name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
   tags = {
    Name = "${var.environment_name}-${var.db_name}"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Allow MySQL access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}