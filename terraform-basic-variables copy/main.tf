resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "${var.project}-${var.env}-vpc"
    Created = "DevOps"
    Infra = "stage"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.subnet1_cidr
  availability_zone = var.availability_zone[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project}-${var.env}-subnet1"
    Created = "DevOps"
    Infra = "stage"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.subnet2_cidr
  availability_zone = var.availability_zone[1]
  tags = {
    Name = "${var.project}-${var.env}-subnet2"
    Created = "DevOps"
    Infra = "stage"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.subnet3_cidr
  availability_zone = var.availability_zone[2]
  tags = {
    Name = "${var.project}-${var.env}-subnet3"
    Created = "DevOps"
    Infra = "stage"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project}-${var.env}-igw"
    Created = "DevOps"
    Infra = "stage"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id 
  }
  tags = {
    Name = "${var.project}-${var.env}-public-rt"
    Created = "DevOps"
    Infra = "stage"
  } 
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project}-${var.env}-private-rt"
    Created = "DevOps"
    Infra = "stage"
  } 
}

resource "aws_route_table_association" "public_subnet1" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id = aws_subnet.subnet2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id = aws_subnet.subnet3.id
  route_table_id = aws_route_table.private.id
}

##### Security Group Creation #####
resource "aws_security_group" "this" {
    name = "${var.project}-${var.env}-sg"
    description = "Security Group for ${var.project} in ${var.env} environment"
    vpc_id = aws_vpc.this.id
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }

    tags = {
    Name = "${var.project}-${var.env}-security-group"
    Created = "DevOps"
    Infra = "stage"
    }
}        


####### EC2 Instance Creation ####
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet1.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.this.id]
  tags = {
    Name = "${var.project}-${var.env}-instance"
    Created = "DevOps"
    Infra = "stage"
  }
}

#### Aws Key Seure Creation ####
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.this.private_key_pem
  filename = "keys/${var.key_name}.pem"
  file_permission = "0600"
}
