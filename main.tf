// main.tf

module "network" {
  source        = "./modules/network"
  network_name  = var.network_name

  providers = {
    docker = docker
  }
}

module "nginx" {
  source        = "./modules/nginx"
  nginx_image   = var.nginx_image
  network_name  = var.network_name

  providers = {
    docker = docker
  }
}

module "web" {
  source        = "./modules/web"
  web_image     = var.web_image
  network_name  = var.network_name

  providers = {
    docker = docker
  }
}

module "db" {
  source              = "./modules/db"
  db_image            = var.db_image
  network_name        = var.network_name
  db_root_password    = var.db_root_password

  providers = {
    docker = docker
  }
}
