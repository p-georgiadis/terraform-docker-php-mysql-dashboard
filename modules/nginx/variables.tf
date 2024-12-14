// modules/nginx/variables.tf

variable "nginx_image" {
  description = "Docker image for Nginx"
  type        = string
}

variable "network_name" {
  description = "Name of the Docker network"
  type        = string
}

