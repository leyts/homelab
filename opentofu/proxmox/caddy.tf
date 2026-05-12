variable "caddy_lxc" {
  description = "Caddy LXC settings."
  type = object({
    hostname       = string
    vm_id          = number
    ipv4_address   = string
    ipv4_gateway   = string
    swap_mb        = number
    rootfs_size_gb = number
  })
  default = {
    hostname       = "lxc-proxy-01"
    vm_id          = 201
    ipv4_address   = "192.168.0.201/24"
    ipv4_gateway   = "192.168.0.1"
    swap_mb        = 512
    rootfs_size_gb = 8
  }
}

resource "proxmox_virtual_environment_container" "caddy" {
  node_name    = var.proxmox_node_name
  vm_id        = var.caddy_lxc.vm_id
  tags         = ["network"]
  unprivileged = true

  initialization {
    hostname = var.caddy_lxc.hostname

    ip_config {
      ipv4 {
        address = var.caddy_lxc.ipv4_address
        gateway = var.caddy_lxc.ipv4_gateway
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
    size         = var.caddy_lxc.rootfs_size_gb
  }

  memory {
    swap = var.caddy_lxc.swap_mb
  }

  wait_for_ip {
    ipv4 = true
  }
}

output "caddy_lxc" {
  description = "Connection details for the Caddy LXC."
  value = {
    hostname     = var.caddy_lxc.hostname
    vm_id        = proxmox_virtual_environment_container.caddy.vm_id
    ipv4_address = var.caddy_lxc.ipv4_address
    ssh_user     = "root"
  }
}
