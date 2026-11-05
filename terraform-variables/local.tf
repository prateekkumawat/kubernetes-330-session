locals {
  vpc_detail = {
    for k,v in var.vpc_details : k =>  {
        cidr_block = v.cidr_block
        instnace_tenancy = v.instnace_tenancy
        dns_support = v.dns_support
        dns_hostnames = v.dns_hostnames
    }
  }
}


locals {
  subnet_detail = {
    for k,v in var.subnet_details : k =>  {
        cidr_block = v.cidr_block
        availability_zone = v.availability_zone
        map_public_ip_on_launch = v.map_public_ip_on_launch
    }
  }
}