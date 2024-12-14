// modules/web/variables.tf

variable "web_image" {
  description = "Docker image for the web server"
  type        = string
}

variable "network_name" {
  description = "Name of the Docker network"
  type        = string
}

