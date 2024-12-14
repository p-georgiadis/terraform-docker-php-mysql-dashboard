// modules/nginx/outputs.tf

output "container_id" {
  description = "ID of the Nginx container"
  value       = docker_container.nginx.id
}

