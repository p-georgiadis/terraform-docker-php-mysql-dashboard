// modules/db/outputs.tf

output "container_id" {
  description = "ID of the MySQL container"
  value       = docker_container.db.id
}

