output "public_ip" {
  value = civo_instance.this.public_ip
}

output "private_ip" {
  value = civo_instance.this.private_ip
}

output "public_ip_hostname" {
  value = "${civo_instance.this.public_ip} ${var.name}"
}

output "private_ip_hostname" {
  value = "${civo_instance.this.private_ip} ${var.name}"
}
