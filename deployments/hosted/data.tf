data "xenorchestra_pool" "pitch" {
  name_label = "pitch"
}

data "xenorchestra_network" "external" {
  name_label = "External"
  pool_id = data.xenorchestra_pool.pitch.id
}

data "xenorchestra_sr" "enid" {
  name_label = "enid"
  pool_id = data.xenorchestra_pool.pitch.id
}
