resource "aws_security_group" "nginx_sg" {
  vpc_id = aws_vpc.my_vpc.id

  # Inbound rule to allow HTTP traffic

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule to allow all traffic
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {  
    Name = "nginx_sg"
  }
}