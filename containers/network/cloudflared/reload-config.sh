#!/usr/bin/env bash

PROXMOX_VMID=101

pct-exec() {
    pct exec "$PROXMOX_VMID" -- bash -c "$*"
}

echo 'Restarting cloudflared service...'
pct-exec systemctl restart cloudflared
