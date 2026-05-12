# Copy to `terraform.tfvars` only for non-secret local overrides.
# Authentication should stay in environment variables, not tfvars files.

# proxmox_node_name       = "pve"
# rootfs_datastore_id     = "local-zfs"
# template_datastore_id   = "local"
# lxc_template_url        = "http://download.proxmox.com/images/system/debian-13-standard_13.1-2_amd64.tar.zst"
# network_bridge          = "vmbr0"
# lxc_ssh_public_key_path = "~/.ssh/id_ed25519.pub"
