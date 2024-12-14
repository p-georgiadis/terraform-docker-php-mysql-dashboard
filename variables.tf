// variables.tf

variable "nginx_image" {
  description = "Docker image for Nginx"
  type        = string
  default     = "nginx:latest"
}

variable "web_image" {
  description = "Docker image for the web server"
  type        = string
  default     = "nginx:alpine"  # Using Nginx for simplicity
}

variable "db_image" {
  description = "Docker image for MySQL"
  type        = string
  default     = "mysql:5.7"
}

variable "network_name" {
  description = "Name of the Docker network"
  type        = string
  default     = "terraform_network"
}

variable "db_root_password" {
  description = "Root password for MySQL"
  type        = string
  sensitive   = true
}

