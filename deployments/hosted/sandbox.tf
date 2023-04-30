module "eb677-sandbox" {
  source = "../../modules/hosted-vm"

  ip_addresses = []  # SLAAC address will still exist and is predictable
  hostname = "eb677-sandbox"
  ip4_gateway = "128.232.112.1"  # technically unnecessary

  pool_id = data.xenorchestra_pool.pitch.id
  network_id = data.xenorchestra_network.external.id
  sr_id = data.xenorchestra_sr.enid.id

  iso = "ubuntu-22.04.1-live-server-amd64.iso"
  install_xen_agent = false  # not available in jammy

  disk_gb = 8
  memory_gb = 2
  cpus = 2
}
