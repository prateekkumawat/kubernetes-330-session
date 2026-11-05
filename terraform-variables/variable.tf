variable "env" {
  type = string
  description = "Please update Your Infra Enviorments Stage Prod UAT"
}

variable "project" {
  type = string
  description = "Please update Your Project Name"
}

variable "Region" {
  type = string
  description = "Please update Your Region"
  default = "ap-south-1"
}

variable "vpc_details" {
  type = map(object({
    cidr_block = string
    instnace_tenancy = optional(string)
    dns_support = optional(bool)
    dns_hostnames = optional(bool)
  }))
}
 
variable "subnet_details" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    map_public_ip_on_launch = optional(bool)
  }))
}