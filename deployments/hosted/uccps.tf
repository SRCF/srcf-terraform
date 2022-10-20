module "uccps-1" {
  source = "../../modules/hosted-vm"

  ip_addresses = ["128.232.113.72/23"]
  hostname = "uccps-1"
  ip4_gateway = "128.232.112.1"

  pool_id = data.xenorchestra_pool.pitch.id
  network_id = data.xenorchestra_network.external.id
  sr_id = data.xenorchestra_sr.enid.id

  disk_gb = 20
  memory_gb = 8
  cpus = 4
}
