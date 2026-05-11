terraform {
  required_version = ">= 1.8.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.106.0, < 1.0.0"
    }
  }
}

provider "proxmox" {
  # Authentication is intentionally read from the environment:
  # `PROXMOX_VE_ENDPOINT`, `PROXMOX_VE_API_TOKEN` and `PROXMOX_VE_INSECURE`.
}
