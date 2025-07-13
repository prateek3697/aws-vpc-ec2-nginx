output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.nginxserver.public_ip

}

output "instance_url" {
  description = "URL of the EC2 instance"
  value       = "http://${aws_instance.nginxserver.public_ip}"
}