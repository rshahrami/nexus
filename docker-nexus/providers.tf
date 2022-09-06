# provider "docker" {
#   host = "unix:///var/run/docker.sock"
# }

provider "docker" {
  host     = "${var.remote_portecol}://${var.remote_username}@${var.remote_ip}:${var.remote_port}"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}