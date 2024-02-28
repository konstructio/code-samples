output "kubernetes_vms_public_ips" {
  value = "--servers-public-ips ${module.k1_master_1.public_ip},${module.k1_master_2.public_ip},${module.k1_master_3.public_ip}"
}

output "kubernetes_vms_private_ips" {
  value = "--servers-private-ips ${module.k1_master_1.private_ip},${module.k1_master_2.private_ip},${module.k1_master_3.private_ip}"
}

output "k1_master_1_public_hostfile_entry" {
  value = module.k1_master_1.public_ip_hostname
}

output "k1_master_1_private_hostfile_entry" {
  value = module.k1_master_1.private_ip_hostname
}

output "k1_master_2_public_hostfile_entry" {
  value = module.k1_master_2.public_ip_hostname
}

output "k1_master_2_private_hostfile_entry" {
  value = module.k1_master_2.private_ip_hostname
}

output "k1_master_3_public_hostfile_entry" {
  value = module.k1_master_3.public_ip_hostname
}

output "k1_master_3_private_hostfile_entry" {
  value = module.k1_master_3.private_ip_hostname
}
