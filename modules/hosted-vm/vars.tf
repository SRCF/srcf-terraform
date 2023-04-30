variable "pool_id" {
  type = string
}

variable "hostname" {
  type = string
  description = "Hostname for the hosted VM, not including the domain"
}

variable "ip_addresses" {
  type = list(string)
}

variable "ip4_gateway" {
  type = string
}

variable "cpus" {
  type = number
}

variable "memory_gb" {
  type = number
}

variable "disk_gb" {
  type = number
}

variable "sr_id" {
  type = string
}

variable "network_id" {
  type = string
}

variable "iso" {
  type = string
  default = "ubuntu-20.04.6-live-server-amd64.iso"
}

variable "install_xen_agent" {
  type = bool
  default = true
}

variable "auto_poweron" {
  type = bool
  default = true
}
