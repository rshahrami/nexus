remote_portecol = "ssh"
remote_username = "administrator"
remote_ip = "192.168.190.129"
remote_port = 22
image_version = "3.41.1"
keep_locally = true
force_remove = true
container_hostname = "nexus"
container_name = "nexus"
container_restart = "always"
container_port_internal = 8081
container_port_external = 8081
container_path = "/sonatype-work"
host_path = "/storage"
read_only = false
container_network = {
    driver  = "bridge"
    name    = "nginx_network"
}
  