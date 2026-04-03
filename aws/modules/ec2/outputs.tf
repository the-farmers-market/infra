output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app.id
}

output "elastic_ip" {
  description = "Elastic IP address of the app server"
  value       = aws_eip.app.public_ip
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.app.private_ip
}

output "key_pair_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.app.key_name
}
