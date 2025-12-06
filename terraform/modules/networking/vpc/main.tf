resource "aws_vpc" "Obelion-VPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Obelion-VPC"
  }

}
resource "aws_internet_gateway" "Obelion-IGW" {
  vpc_id = aws_vpc.Obelion-VPC.id
  tags = {
    Name = "Obelion-IGW"
  }
}
