terraform {
  required_version = ">= 1.11.7"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.106.0"
    }
  }
}

provider "proxmox" {
  # Authentication is intentionally read from the environment:
  # `PROXMOX_VE_ENDPOINT`, `PROXMOX_VE_API_TOKEN` and `PROXMOX_VE_INSECURE`.
}
