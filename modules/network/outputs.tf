// modules/network/outputs.tf

output "network_id" {
  description = "ID of the Docker network"
  value       = docker_network.this.id
}

