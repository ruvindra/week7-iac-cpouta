output "floating_ip" {
  description = "Public (floating) IP address of the web server."
  value       = openstack_networking_floatingip_v2.web.address
}

output "url" {
  description = "Full URL of the deployed page, ready to paste into a browser."
  value       = "http://${openstack_networking_floatingip_v2.web.address}"
}

output "ssh_command" {
  description = "Ready-made SSH command for checking the VM (not required for normal use)."
  value       = "ssh -i ~/.ssh/week7_ed25519 ubuntu@${openstack_networking_floatingip_v2.web.address}"
}