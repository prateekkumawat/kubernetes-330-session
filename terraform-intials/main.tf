resource "aws_vpc" "this" {
  cidr_block = "10.20.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "hsittf-stage-vpc"
    Created = "DevOps"
    Infra = "stage"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.20.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "hsittf-stage-subnet1"
    Created = "DevOps"
    Infra = "stage"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.20.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "hsittf-stage-subnet2"
    Created = "DevOps"
    Infra = "stage"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.20.3.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "hsittf-stage-subnet3"
    Created = "DevOps"
    Infra = "stage"
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.20.6.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "hsittf-stage-subnet4"
    Created = "DevOps"
    Infra = "stage"
  }
}
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "hsittf-stage-igw"
    Created = "DevOps"
    Infra = "stage"
  }
}
