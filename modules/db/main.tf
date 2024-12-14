// modules/db/main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "mysql" {
  name = var.db_image
}

resource "docker_container" "db" {
  name    = "mysql_db"
  image   = docker_image.mysql.name
  restart = "always"

  env = [
    "MYSQL_ROOT_PASSWORD=${var.db_root_password}"
  ]

  ports {
    internal = 3306
    external = 3306
  }

  networks_advanced {
    name    = var.network_name
    aliases = ["mysql_db"]
  }

  volumes {
    host_path      = "/home/panog/terraform_practice/modules/db/data"
    container_path = "/var/lib/mysql"
  }
}

resource "docker_volume" "db_data" {
  name = "mysql_data"
}
