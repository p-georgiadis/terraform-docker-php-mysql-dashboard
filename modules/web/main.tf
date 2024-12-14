// modules/web/main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "web" {
  name = var.web_image
}

resource "docker_container" "web" {
  name    = "web_server"
  image   = docker_image.web.name
  restart = "always"

  networks_advanced {
    name    = var.network_name
    aliases = ["web_server"]
  }

}
