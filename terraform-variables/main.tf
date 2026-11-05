resource "aws_vpc" "this" {
  for_each = local.vpc_detail 
    cidr_block = each.value.cidr_block
    instance_tenancy = each.value.instnace_tenancy
    enable_dns_support = each.value.dns_support 
    enable_dns_hostnames = each.value.dns_hostnames
    
    tags = {
      Name = "${var.project}-${var.env}-vpc"
    }
}

resource "aws_subnet" "this" {
  for_each = local.subnet_detail
    vpc_id = aws_vpc.this["vpc1"].id
    cidr_block = each.value.cidr_block
    availability_zone = each.value.availability_zone
    map_public_ip_on_launch = each.value.map_public_ip_on_launch

    tags = {
      Name = "${var.project}-${var.env}-subnet"
    }
}