variable "region" {
  default = "ap-south-1"
  type = string
  description = "region for the vpc"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
  description = "cidr block for vpc"
  type = string
}

variable "vpc_name" {
  default = "project-vpc"
  description = "name of the vpc"
  type = string
}