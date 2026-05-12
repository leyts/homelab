locals {
  lxc_ssh_public_key = trimspace(file(pathexpand(var.lxc_ssh_public_key_path)))
}

resource "proxmox_download_file" "lxc_template" {
  content_type        = "vztmpl"
  datastore_id        = var.template_datastore_id
  node_name           = var.proxmox_node_name
  url                 = var.lxc_template_url
  overwrite_unmanaged = true
}
