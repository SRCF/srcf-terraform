module "uccps-1" {
  source = "../../modules/hosted-vm"

  ip_addresses = ["128.232.113.72/23"]
  hostname = "uccps-1"
  ip4_gateway = "128.232.112.1"

  pool_id = module.pitch.pool_id
  network_id = module.pitch.public_network_id
  sr_id = module.pitch.vm_sr_id

  disk_gb = 20
  memory_gb = 8
  cpus = 4
}
