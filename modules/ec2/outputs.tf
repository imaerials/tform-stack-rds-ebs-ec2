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
output "subnet_id" {
  value = aws_instance.web_server.subnet_id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}