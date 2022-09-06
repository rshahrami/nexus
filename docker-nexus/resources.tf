
resource "docker_image" "nexus" {
  name         = "sonatype/nexus3:${var.image_version}"
  keep_locally = var.keep_locally
  force_remove = var.force_remove
}

resource "docker_container" "nexus" {
  image     = docker_image.nexus.name
  hostname  = var.container_hostname
  name      = var.container_name
  restart   = var.container_restart
  # env = [ "INSTALL4J_ADD_VM_PARAMS=-Xms2703m -Xmx2703m -XX:MaxDirectMemorySize=2703m -Djava.util.prefs.userRoot=/some-other-dir" ]
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
