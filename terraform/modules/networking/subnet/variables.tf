variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "public_subnets_cidr_1" {
  description = "Public Subnets CIDR 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnets_cidr_2" {
  description = "Public Subnets CIDR 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnets_cidr_1" {
  description = "Private Subnets CIDR 1"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnets_cidr_2" {
  description = "Private Subnets CIDR 2"
  type        = string
  default     = "10.0.4.0/24"
}

variable "availability_zone_1" {
  description = "Availability Zone 1"
  type        = string
  default     = "eu-west-1a"
}

variable "availability_zone_2" {
  description = "Availability Zone 2"
  type        = string
  default     = "eu-west-1b"
}
