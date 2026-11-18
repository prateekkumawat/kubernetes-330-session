# variable "ami" {
#   type    = string
#   default = "ami-0c230065b91270bc6"
# }
# variable "instnace_type" {
#   type    = string
#   default = "t2.micro"
# }

# variable "create_aws_instance" {
#   type    = bool
#   default = false
# }

# variable "create_aws_vpc" {
#   type    = bool
#   default = false
# }


# # variable "aws_instnace_details" {
# #   type = list(object({
# #     ami           = string
# #     instance_type = string
# #     key_name     = string
# #     }))
# #     default = [{
# #         ami           = "ami-0c230065b91270bc6"
# #         instance_type = "t2.micro"
# #         key_name     = "hsit-aws-key1"
# #       },
# #       {
# #         ami           = "ami-0c230065b91270bc6"
# #         instance_type = "t2.large"
# #         key_name     = "hsit-aws-key2"
# #       },
# #       {
# #         ami           = "ami-0c230065b91270bc6"
# #         instance_type = "t2.xlarge"
# #         key_name     = "hsit-aws-key3"
# #       },
# #     ]
# # }

variable "create_instance" {
  type = bool 
  default = true
}
variable instance_details {
  type = list(object({
     ami = string
     instance_type = string
     instance_name = string
     env = string
     key_name = string
  }))
  default = [
    {
      ami           = "ami-0c230065b91270bc6"
      instance_type = "t2.micro"
      instance_name = "ins1"
      env  = "stage"
      key_name = "key1"
    },
    {
      ami           = "ami-0c230065b91270bc6"
      instance_type = "t2.large"
      instance_name = "ins2"
      env  = "stage"
      key_name = "key2"
    },
    {
      ami           = "ami-0c230065b91270bc6"
      instance_type = "t2.xlarge"
      instance_name = "ins3"
      env  = "stage"
      key_name = "key3"
    }
  ]
}


variable "rds_details" {
  type = list(object({
      allocated_storage           = string
      auto_minor_version_upgrade  = optional(bool)
      backup_retention_period     = optional(number)
      db_subnet_group_name        = string
      engine                      = string
      engine_version              = string
      identifier                  = string
      instance_class              = string
      multi_az                    = bool
      password                    = string
      username                    = string
  }))
  default = [ 
   {
      allocated_storage           = 50
      auto_minor_version_upgrade  = false
      backup_retention_period     = 7
      db_subnet_group_name        = "hsit-app"
      engine                      = "mysql"
      engine_version              = "8.0"
      identifier                  = "hsit-instance-demo"
      instance_class              = "db.t2.micro"
      multi_az                    = false
      password                    = "StrongPassword123"
      username                    = "hsitapp"
    }
  ]   
}