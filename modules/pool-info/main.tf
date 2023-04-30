terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
      version = "~> 0.24.0"
    }
  }
}

variable "pool_name" {
  type = string
  description = "name-label of the pool"
  validation {
    condition = contains(["pitch", "lightning", "thunder"], var.pool_name)
    error_message = "Pool name '${var.pool_name}' is unknown."
  }
}

data "xenorchestra_pool" "this" {
  name_label = var.pool_name
}

locals {
  pool_to_sr = {
    pitch = "enid"
    lightning = "enid"
    thunder = "eldo"
  }
  pool_to_pif = {
    pitch = "External"
    lightning = "External"
    thunder = "CUDN"
  }
}

data "xenorchestra_network" "external" {
  name_label = local.pool_to_pif[var.pool_name]
  pool_id = data.xenorchestra_pool.this.id
}

data "xenorchestra_sr" "vm_disks" {
  name_label = local.pool_to_sr[var.pool_name]
  pool_id = data.xenorchestra_pool.this.id
}

output "pool_id" {
  value = data.xenorchestra_pool.this.id
}

output "vm_sr_id" {
  value = data.xenorchestra_sr.vm_disks.id
}

output "public_network_id" {
  value = data.xenorchestra_network.external.id
}
