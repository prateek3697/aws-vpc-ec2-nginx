# This resource is to create a EC2 instance in the Public Subnet created above.
resource "aws_instance" "nginxserver" {
  ami = "ami-00f34bf9aeacdf007"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
    associate_public_ip_address = true

  user_data = <<-EOF
                #!/bin/bash
                sudo yum install nginx -y
                sudo systemctl start nginx
                EOF

  tags = {
    Name = "NginxServer"
  }
}