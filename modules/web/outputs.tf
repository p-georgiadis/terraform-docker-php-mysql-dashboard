// modules/web/outputs.tf

output "container_id" {
  description = "ID of the Web Server container"
  value       = docker_container.web.id
}

