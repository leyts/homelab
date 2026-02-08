#!/usr/bin/env bash

PROXMOX_VMID=102
CONFIG_FILE=Caddyfile

pct-exec() {
    pct exec "$PROXMOX_VMID" -- bash -c "$*"
}

echo 'Deploying config file...'
pct push "$PROXMOX_VMID" "$CONFIG_FILE" /etc/caddy/Caddyfile

echo 'Reloading caddy service...'
pct-exec systemctl reload caddy
