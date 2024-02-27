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

module "k1_master_1" {
  source = "github.com/kubefirst/code-samples//civo/terraform/modules/kubernetes-vms?ref=main"

  name   = "k1-master-1"
  script = local.startup_script
  // Local path to public key on the user who has claimed this module's system
  ssh_public_key = var.ssh_key_pub
  civo_region    = var.civo_region
}

module "k1_master_2" {
  source = "github.com/kubefirst/code-samples//civo/terraform/modules/kubernetes-vms?ref=main"

  name   = "k1-master-2"
  script = local.startup_script
  // Local path to public key on the user who has claimed this module's system
  ssh_public_key = var.ssh_key_pub
  civo_region    = var.civo_region
}

module "k1_master_3" {
  source = "github.com/kubefirst/code-samples//civo/terraform/modules/kubernetes-vms?ref=main"

  name   = "k1-master-3"
  script = local.startup_script
  // Local path to public key on the user who has claimed this module's system
  ssh_public_key = var.ssh_key_pub
  civo_region    = var.civo_region
}
