variable "region" {
  type        = string
  description = "region you want to use"
}

variable "subnet_private" {

  type        = map(string)
  description = "subnets to support the vpc"

}

variable "subnet_public" {

  type        = map(string)
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