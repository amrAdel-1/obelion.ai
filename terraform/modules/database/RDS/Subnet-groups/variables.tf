variable "vpc_id" {
  description = "The ID of the VPC where the subnet will be created"
  type        = string
}
variable "private_subnet_1_id" {
  description = "The ID of the private subnet A"
  type        = string
}
variable "private_subnet_2_id" {
  description = "The ID of the private subnet B"
  type        = string
}
variable "subnet_group_name" {
  description = "The name of the RDS subnet group"
  default     = "rds-subnet-group"
  type        = string
}
