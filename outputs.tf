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
  value = aws_eip.elastic_ip.public_ip
}