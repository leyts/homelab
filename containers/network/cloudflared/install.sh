#!/usr/bin/env bash

PROXMOX_VMID=101
CF_TUNNEL_NAME=homelab
TEMPLATE_FILE=config.template.yaml
OUTPUT_FILE=config.yaml

pct-exec() {
    pct exec "$PROXMOX_VMID" -- bash -c "$*"
}

printf 'Getting tunnel UUID for %s...\n' "$CF_TUNNEL_NAME"
export TUNNEL_UUID
TUNNEL_UUID=$(pct-exec cloudflared --output json tunnel info "$CF_TUNNEL_NAME" | jq -r '.id')
export CRED_FILE_PATH="/root/.cloudflared/${TUNNEL_UUID}.json"

echo 'Creating config file...'
envsubst < "$TEMPLATE_FILE" > "$OUTPUT_FILE"

echo 'Copying config file to the container...'
pct push "$PROXMOX_VMID" "$OUTPUT_FILE" /root/.cloudflared/config.yml

echo 'Installing cloudflared service...'
pct-exec cloudflared service install

echo 'Starting cloudflared service...'
pct-exec systemctl start cloudflared

echo 'Done.'
