#provider
provider "aws" {
    region = "ap-south-1"
}

#create vpc
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    name = "project-vpc"
  }
}

#create internet gateway
resource "aws_internet_gateway" "project-ingw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    name = "project-internet-gateway"
  }
}

##creating two subnet a public and a private:
#public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    name = "project-public-subnet"
  }
}

#private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    name = "project-private-subnet"
  }
}

##creating routables for subnets:
# Route Table for Public Subnet
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-ingw.id
  }

  tags = {
    name = "public-route-table"
  }
}

#route table for private subnet
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    name = "private-route-table"
  }
}
# As we know, we don't need the Internet Gateway in a private subnet.


##Associate Route Tables with Subnets:
#assocaite public route table with public subnet
resource "aws_route_table_association" "public-route-table-assocation" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-route-table.id
}

#associate private route table private subnet
resource "aws_route_table_association" "private-route-table-association" {
  subnet_id = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-route-table.id
}



