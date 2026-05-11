output "lxc_template_file_id" {
  description = "Downloaded LXC template file ID."
  value       = proxmox_download_file.lxc_template.id
}
