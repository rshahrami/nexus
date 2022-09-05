variable "nginx_version" {
  type    = string
  default = "1.23.1"
}

variable "keep_locally" {
  type    = bool
  default = true
}

variable "force_remove" {
  type    = bool
  default = true
}

variable "container_hostname" {
  type    = string
  default = "test"
}

variable "container_name" {
  type    = string
  default = "test"
}

variable "container_restart" {
  type = string
  default = "always"
}

variable "container_port_internal" {
  type    = number
  default = 80
}

variable "container_port_external" {
  type    = number
  default = 8000
}

variable "container_path" {
  type    = string
  default = "/usr/share/nginx/html"
}

variable "host_path" {
  type    = string
  default = "/data"
}

variable "read_only" {
  type    = bool
  default = true
}


variable "container_network" {
  type = object({
    driver  = string
    name    = string
  })
  
  default = {
    driver = "bridge"
    name = "nginx_network"
  }
}