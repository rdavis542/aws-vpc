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

variable "subnet_private_c" {

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

variable "subnet_public_c" {

  type        = string
  description = "subnets to support the vpc"

}

variable "cidr_block" {
  type        = string
  description = "VPC CIDR range"
}

variable "allowed_ssh_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed to SSH to bastion hosts"
  default     = []
}


