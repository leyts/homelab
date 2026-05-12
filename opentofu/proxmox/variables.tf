variable "proxmox_node_name" {
  description = "Proxmox VE node where LXCs are created."
  type        = string
  default     = "pve"
}

variable "rootfs_datastore_id" {
  description = "Datastore used for LXC root filesystems."
  type        = string
  default     = "local-zfs"
}

variable "template_datastore_id" {
  description = "Datastore used for downloaded LXC templates."
  type        = string
  default     = "local"
}

variable "lxc_template_url" {
  description = "Proxmox LXC template URL."
  type        = string
  default     = "http://download.proxmox.com/images/system/debian-13-standard_13.1-2_amd64.tar.zst"
}

variable "lxc_ssh_public_key_path" {
  description = "Local public SSH key installed for root inside new LXCs."
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "network_bridge" {
  description = "Proxmox bridge attached to the LXC network interface."
  type        = string
  default     = "vmbr0"
}
