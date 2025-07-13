# This Terraform configuration creates a VPC in AWS with a specified CIDR block.

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

#This resource is to create a Private Subnet in the VPC created above.

resource "aws_subnet" "private_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my_vpc.id
    tags = {
      Name = "private_subnet"
    }
  
}

# This resource is to create a Public Subnet in the VPC created above.

resource "aws_subnet" "public_subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.my_vpc.id
    tags = {
      Name = "public_subnet"
    }
  
}

# This resource is to create an Internet Gateway for the VPC created above.

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_igw"
  }
}

# This resource is to create a Route Table.check "

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id 
  }
}

# This resource is to associate the Public Subnet with the Route Table created above.

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_route_table.id
  
}
