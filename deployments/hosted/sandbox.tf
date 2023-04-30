module "eb677-sandbox" {
  source = "../../modules/hosted-vm"

  ip_addresses = [] # SLAAC address will still exist and is predictable
  hostname     = "eb677-sandbox"
  ip4_gateway  = "128.232.112.1" # technically unnecessary

  pool_id    = module.lightning.pool_id
  network_id = module.lightning.public_network_id
  sr_id      = module.lightning.vm_sr_id

  iso               = "ubuntu-22.04.2-live-server-amd64.iso"
  install_xen_agent = false # not available in jammy

  disk_gb      = 8
  memory_gb    = 2
  cpus         = 2
  auto_poweron = false
}
