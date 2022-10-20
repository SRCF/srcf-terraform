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
