output "kubernetes_vms_private_ips_flags" {
  value = "--servers-private-ips ${module.k1_master_1.private_ip},${module.k1_master_2.private_ip},${module.k1_master_3.private_ip}"
}

output "kubernetes_vms_public_ips_flags" {
  value = "--servers-public-ips ${module.k1_master_1.public_ip},${module.k1_master_2.public_ip},${module.k1_master_3.public_ip}"
}

output "kubernetes_vms_1_public_ip" {
  value = module.k1_master_1.public_ip
}

output "kubernetes_vms_2_public_ip" {
  value = module.k1_master_2.public_ip
}

output "kubernetes_vms_3_public_ip" {
  value = module.k1_master_3.public_ip
}

output "kubernetes_vms_1_public_etc_hosts" {
  value = "${module.k1_master_1.public_ip} ${module.k1_master_1.hostname}"
}

output "kubernetes_vms_1_private_etc_hosts" {
  value = "${module.k1_master_1.private_ip} ${module.k1_master_1.hostname}"
}

output "kubernetes_vms_2_public_etc_hosts" {
  value = "${module.k1_master_2.public_ip} ${module.k1_master_2.hostname}"
}

output "kubernetes_vms_2_private_etc_hosts" {
  value = "${module.k1_master_2.private_ip} ${module.k1_master_2.hostname}"
}

output "kubernetes_vms_3_public_etc_hosts" {
  value = "${module.k1_master_3.public_ip} ${module.k1_master_3.hostname}"
}

output "kubernetes_vms_3_private_etc_hosts" {
  value = "${module.k1_master_3.private_ip} ${module.k1_master_3.hostname}"
}
