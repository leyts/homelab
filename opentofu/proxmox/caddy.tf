resource "proxmox_virtual_environment_container" "caddy" {
  node_name = var.proxmox_node_name
  vm_id     = 102
  tags      = ["network"]

  unprivileged = true

  initialization {
    hostname = "caddy-01"

    ip_config {
      ipv4 {
        address = "192.168.0.102/24"
        gateway = "192.168.0.1"
      }
    }

    user_account {
      keys = [local.lxc_ssh_public_key]
    }
  }

  network_interface {
    name   = "veth0"
    bridge = var.network_bridge
  }

  operating_system {
    template_file_id = proxmox_download_file.lxc_template.id
    type             = "debian"
  }

  disk {
    datastore_id = var.rootfs_datastore_id
    size         = 6
  }

  memory {
    swap = 512
  }

  wait_for_ip {
    ipv4 = true
  }
}
