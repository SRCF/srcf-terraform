output "vm_xoid" {
  value = xenorchestra_vm.vm.id
}

output "config_xoid" {
  value = xenorchestra_cloud_config.hosted.id
}
