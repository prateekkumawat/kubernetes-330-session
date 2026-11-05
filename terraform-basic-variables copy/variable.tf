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

variable "vpc_cidr" {
  type = string
  description = "Please update Your VPC CIDR"
}

variable "subnet1_cidr" {
  type = string
  description = "Please update Your Subnet1 CIDR"
}

variable "subnet2_cidr" {
  type = string
  description = "Please update Your Subnet2 CIDR"
}

variable "subnet3_cidr" {
  type = string
  description = "Please update Your Subnet3 CIDR"
}

variable "availability_zone" {
  type = list
  description = "Please update Your Availability Zone"
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]   #[list uses index 0,1,2]
}

variable "ami_id" {
  type = string
  description = "Please update Your AMI ID"
}

variable "instance_type" {
  type = string
  description = "Please update Your Instance Type"
}

variable "key_name" {
  type = string
  description = "Please update Your Key Name"
}