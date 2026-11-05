env = "stage"
project = "hsittf"
Region = "ap-south-1"

vpc_details = {
  "vpc1" = {
    cidr_block = "10.100.0.0/16"
    instnace_tenancy = "default"
    dns_hostnames = true
    dns_support = true
  }
}

subnet_details = {
  "pub_subnet1" = {
    cidr_block = "10.100.1.0/24"
    availability_zone = "ap-south-1a"   
    map_public_ip_on_launch = true
    },
    "pub_subnet2" = {   
       cidr_block = "10.100.2.0/24"
       availability_zone = "ap-south-1b"    
       map_public_ip_on_launch = true
    },
    private_subnet1 = {
       cidr_block = "10.100.10.0/24"
       availability_zone = "ap-south-1a"    
       map_public_ip_on_launch = false
    },
    private_subnet2 = {
       cidr_block = "10.100.11.0/24"
       availability_zone = "ap-south-1b"    
       map_public_ip_on_launch = false
    }
}    
