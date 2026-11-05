env = "prod"
project = "hsittf"
Region = "ap-south-2"

vpc_details = {
  "vpc1" = {
    cidr_block = "10.200.0.0/16"
    instnace_tenancy = "default"
    dns_hostnames = true
    dns_support = true
  }
}

subnet_details = {
  "pub_subnet1" = {
    cidr_block = "10.200.1.0/24"
    availability_zone = "ap-south-2a"   
    map_public_ip_on_launch = true
    },
    "pub_subnet2" = {   
       cidr_block = "10.200.2.0/24"
       availability_zone = "ap-south-2b"    
       map_public_ip_on_launch = true
    },
    "pub_subnet3" = {   
       cidr_block = "10.200.3.0/24"
       availability_zone = "ap-south-2c"
       map_public_ip_on_launch = true
    },       
    private_subnet1 = {
       cidr_block = "10.200.10.0/24"
       availability_zone = "ap-south-2a"    
       map_public_ip_on_launch = false
    },
    private_subnet2 = {
       cidr_block = "10.200.11.0/24"
       availability_zone = "ap-south-2b"    
       map_public_ip_on_launch = false
    },
    private_subnet3 = {
       cidr_block = "10.200.12.0/24"
       availability_zone = "ap-south-2c"    
       map_public_ip_on_launch = false
    }
}    
