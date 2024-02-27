output "kubernetes_vms_public_ips" {
  value = [module.k1_master_1.public_ip, module.k1_master_2.public_ip, module.k1_master_3.public_ip]
}
