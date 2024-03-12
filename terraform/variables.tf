variable "region" {
  type        = string
  description = "region you want to use"
}

variable "subnet_private_a" {

  type        = string
  description = "subnets to support the vpc"

}

variable "subnet_private_b" {

  type        = string
  description = "subnets to support the vpc"

}

variable "subnet_public_a" {

  type        = string
  description = "subnets to support the vpc"

}

variable "subnet_public_b" {

  type        = string
  description = "subnets to support the vpc"

}

variable "cidr_block" {

  type        = string
  description = "VPC cidr range"

}

variable "az1" {

  type        = string
  description = "Avail zone assigned"

}

variable "az2" {

  type        = string
  description = "Avail zone assigned"

}

variable "default_tags" {
  description = "Default tags too apply to all resources"
  default = {
    "Environment" = "Development"
    "Infrastructure" = "VPC"
    "REPO" = "aws-vpc"
  }
  
}