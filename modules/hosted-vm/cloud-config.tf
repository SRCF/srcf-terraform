resource "xenorchestra_cloud_config" "hosted" {
  name = "Hosted VM autoinstall - ${var.hostname}"
  template = templatefile(
    "../../modules/hosted-vm/autoinstall.tftpl",
    {
      hostname = var.hostname,
      ip_addresses = var.ip_addresses,
      ip4_gateway = var.ip4_gateway,
    }
  )
}
