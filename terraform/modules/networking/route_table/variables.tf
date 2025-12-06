variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "igw_id" {
  description = "IGW ID"
  type        = string
}

variable "public_subnets_1" {
  description = "Public Subnets 1"
  type        = string
}

variable "public_subnets_2" {
  description = "Public Subnets 2"
  type        = string
}

variable "private_subnets_1" {
  description = "Private Subnets 1"
  type        = string
}

variable "private_subnets_2" {
  description = "Private Subnets 2"
  type        = string
}
