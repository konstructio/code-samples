terraform {
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}

provider "civo" {
  region = var.civo_region
  token  = var.civo_token
}

locals {
  kube_config_filename = "./kubeconfig-${var.cluster_name}"
}

resource "civo_network" "kubefirst" {
  label = var.cluster_name
}

resource "civo_firewall" "kubefirst" {
  name                 = var.cluster_name
  network_id           = civo_network.kubefirst.id
  create_default_rules = true
}

resource "civo_kubernetes_cluster" "kubefirst" {
  name        = var.cluster_name
  network_id  = civo_network.kubefirst.id
  firewall_id = civo_firewall.kubefirst.id
  pools {
    label      = var.cluster_name
    size       = "g4s.kube.large"
    node_count = 4
  }
}

resource "local_file" "kubeconfig" {
  content  = civo_kubernetes_cluster.kubefirst.kubeconfig
  filename = local.kube_config_filename
}