output "vpc_outputs" {
  value = {
    for k, v in aws_vpc.this : k => {
    vpc_id            = v.id
    vpc_cidr          = v.cidr_block
    }
  }
}


output "subnet_outputs" {
  value = {
    for k, v in aws_subnet.this : k => {
    id                = v.id
    subnet_cidr       = v.cidr_block
    availability_zone = v.availability_zone
    vpc_id            = v.vpc_id
    }
  }
}