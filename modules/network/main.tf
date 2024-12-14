// modules/network/main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_network" "this" {
  name        = var.network_name
  internal    = false
  attachable  = true
}
