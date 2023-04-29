variable "region" {
  type        = string
  description = "region you want to use"
}

variable "subnet" {

  type        = map(string)
  description = "subnets to support the vpc"

}

variable "cidr_block" {

  type        = string
  description = "VPC cidr range"

}

variable "az" {

  type        = string
  description = "Avail zone assigned"

}
