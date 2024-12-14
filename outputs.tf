// outputs.tf

output "nginx_container_id" {
  description = "ID of the Nginx container"
  value       = module.nginx.container_id
}

output "web_container_id" {
  description = "ID of the Web Server container"
  value       = module.web.container_id
}

output "db_container_id" {
  description = "ID of the MySQL container"
  value       = module.db.container_id
}

output "network_id" {
  description = "ID of the Docker network"
  value       = module.network.network_id
}

