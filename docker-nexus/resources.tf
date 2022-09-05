
resource "docker_image" "nginx" {
  name         = "nginx:${var.nginx_version}"
  keep_locally = var.keep_locally
  force_remove = var.force_remove
}

resource "docker_container" "nginx" {
  image     = docker_image.nginx.name
  hostname  = var.container_hostname
  name      = var.container_name
  restart   = var.container_restart
  ports {
    internal = var.container_port_internal
    external = var.container_port_external
  }

  volumes {
    container_path = var.container_path
    host_path      = var.host_path
    read_only      = var.read_only
  }
}

resource "docker_network" "network" {
  name   = var.container_network.name
  driver = var.container_network.driver
}
