// modules/nginx/main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "nginx" {
  name = "webdevops/php-nginx:8.1-alpine"
}

resource "docker_container" "nginx" {
  name  = "nginx_proxy"
  image = docker_image.nginx.image_id  # Reference the image resource instead of hardcoding

  networks_advanced {
    name = "terraform_network"
    aliases = ["nginx_proxy"]
  }

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path = "/home/panog/terraform_practice/modules/nginx/html"
    container_path = "/app"  # This image uses /app as the web root
  }

  env = [
    "PHP_DISPLAY_ERRORS=1",
    "PHP_POST_MAX_SIZE=100M",
    "PHP_MAX_EXECUTION_TIME=300",
    "PHP_MAX_INPUT_VARS=1500",
    "WEB_DOCUMENT_ROOT=/app",
    "PHP_DISMOD=",
    "WEB_DOCUMENT_INDEX=index.php index.html",
    "APPLICATION_UID=1000",  # Add this line
    "APPLICATION_GID=1000"   # Add this line
  ]
}