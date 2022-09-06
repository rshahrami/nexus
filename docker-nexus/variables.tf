variable "remote_portecol" {
  type    = string
}

variable "remote_username" {
  type    = string
}

variable "remote_ip" {
  type    = string
}

variable "remote_port" {
  type    = number
}

variable "nginx_version" {
  type    = string
}

variable "keep_locally" {
  type    = bool
}

variable "force_remove" {
  type    = bool
}

variable "container_hostname" {
  type    = string
}

variable "container_name" {
  type    = string
}

variable "container_restart" {
  type    = string
}

variable "container_port_internal" {
  type    = number
}

variable "container_port_external" {
  type    = number
}

variable "container_path" {
  type    = string
}

variable "host_path" {
  type    = string
}

variable "read_only" {
  type    = bool
}


variable "container_network" {
  type = object({
    driver  = string
    name    = string
  })
}