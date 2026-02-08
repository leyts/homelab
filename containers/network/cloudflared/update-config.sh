#!/usr/bin/env bash

PROXMOX_VMID=101

echo 'Updating config file...'
pct push "$PROXMOX_VMID" config.yaml /root/.cloudflared/config.yml
