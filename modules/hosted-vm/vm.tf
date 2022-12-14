data "xenorchestra_template" "ubuntu-2004" {
  name_label = "Ubuntu Focal Fossa 20.04"
  pool_id = var.pool_id
}

data "xenorchestra_vdi" "ubuntu-2004" {
  pool_id = var.pool_id
  name_label = "ubuntu-20.04.5-live-server-amd64.iso"
}

resource "xenorchestra_vm" "vm" {
  memory_max = var.memory_gb * 1024 * 1024 * 1024
  cpus = var.cpus

  cloud_config = xenorchestra_cloud_config.hosted.template

  template = data.xenorchestra_template.ubuntu-2004.id

  auto_poweron = true

  name_label = var.hostname
  name_description = "${var.hostname}.hosted"

  network {
    network_id = var.network_id
  }

  disk {
    sr_id = var.sr_id
    name_label = "${var.hostname}.hosted-root"
    size = var.disk_gb * 1024 * 1024 * 1024
  }

  cdrom {
    id = data.xenorchestra_vdi.ubuntu-2004.id
  }

  tags = [
    "hosted",
    "no_backup"
  ]
}
