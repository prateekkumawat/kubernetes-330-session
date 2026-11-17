variable "ami" {
  type    = string
  default = "ami-0c230065b91270bc6"
}
variable "instnace_type" {
  type    = string
  default = "t2.micro"
}

variable "create_aws_instance" {
  type    = bool
  default = false
}

variable "create_aws_vpc" {
  type    = bool
  default = false
}


# variable "aws_instnace_details" {
#   type = list(object({
#     ami           = string
#     instance_type = string
#     key_name     = string
#     }))
#     default = [{
#         ami           = "ami-0c230065b91270bc6"
#         instance_type = "t2.micro"
#         key_name     = "hsit-aws-key1"
#       },
#       {
#         ami           = "ami-0c230065b91270bc6"
#         instance_type = "t2.large"
#         key_name     = "hsit-aws-key2"
#       },
#       {
#         ami           = "ami-0c230065b91270bc6"
#         instance_type = "t2.xlarge"
#         key_name     = "hsit-aws-key3"
#       },
#     ]
# }