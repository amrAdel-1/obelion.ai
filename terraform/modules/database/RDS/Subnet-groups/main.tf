resource "aws_db_subnet_group" "RDS_subnet_group" {
  name        = var.subnet_group_name
  subnet_ids  = [var.private_subnet_1_id, var.private_subnet_2_id]
  description = "RDS subnet group for private subnets"

  tags = {
    Name = var.subnet_group_name
    Type = "RDS-Subnet-Group"
  }
}
