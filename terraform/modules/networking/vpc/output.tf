output "vpc_id" {
  value = aws_vpc.Obelion-VPC.id
}
output "igw_id" {
  value = aws_internet_gateway.Obelion-IGW.id
}
