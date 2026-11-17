# Count Example for create multiple instances
resource "aws_instance" "this" {
  count         = var.create_aws_instance ? 1 : 0
  ami           = var.ami
  instance_type = var.instnace_type
  tags = {
    Name = "hsit-aws-instance-${count.index + 1}"
  }
}

resource "aws_vpc" "this" {
  count     = var.create_aws_vpc ? 1 : 0
  cidr_block = "10.101.0.0/16"
  tags = {
    Name = "hsit-aws-vpc"
  }
}

# # count uses with specific values changes
# resource "aws_instance" "this1" {
#   count         = length(var.aws_instnace_details)
#   ami           = var.aws_instnace_details[count.index].ami
#   instance_type = var.aws_instnace_details[count.index].instance_type
#   key_name     = var.aws_instnace_details[count.index].key_name
#   tags = {
#     Name = "hsit-aws-instance-${count.index + 1}"
#   }
# }