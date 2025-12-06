output "frontend_sg_id" {
  value = security_group.frontend_sg.id
}

output "backend_sg_id" {
  value = security_group.backend_sg.id
}

output "database_sg_id" {
  value = security_group.database_sg.id
}
