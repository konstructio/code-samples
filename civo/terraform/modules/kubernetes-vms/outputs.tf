output "public_ip" {
  value = civo_instance.this.public_ip
}

output "private_ip" {
  value = civo_instance.this.private_ip
}