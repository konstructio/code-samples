terraform {
  backend "s3" {
    bucket  = "k1-state-store-excellent-amber-wozniak"
    key     = "terraform/civo/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}


provider "civo" {
  region = var.civo_cloud_region
}

# cd terraform/modules/civo
# export TF_VAR_ssh_key_pub="ssh-rsa AAAAB3NzaC1yc... kbot@example.com"
# terraform init
# terraform plan
module "ubuntu_debug_jared3" {
  source = "github.com/kubefirst/code-samples/terraform/modules/civo/kubefirst-vm?ref=main"

  name   = "kubefirst-vm"
  script = local.startup_script
  // Local path to public key on the user who has claimed this module's system
  ssh_public_key = var.ssh_key_pub
}