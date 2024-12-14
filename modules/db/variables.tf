// modules/db/variables.tf

variable "db_image" {
  description = "Docker image for MySQL"
  type        = string
}

variable "network_name" {
  description = "Name of the Docker network"
  type        = string
}

variable "db_root_password" {
  description = "Root password for MySQL"
  type        = string
  sensitive   = true
}

