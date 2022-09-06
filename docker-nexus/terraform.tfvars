remote_portecol = "ssh"
remote_username = "administrator"
remote_ip = "192.168.143.41"
remote_port = 22
nginx_version = "1.23.1"
keep_locally = true
force_remove = true
container_hostname = "test"
container_name = "test"
container_restart = "always"
container_port_internal = 80
container_port_external = 8000
container_path = "/usr/share/nginx/html"
host_path = "/data"
read_only = true
container_network = {
    driver  = "bridge"
    name    = "nginx_network"
}
  