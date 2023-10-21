resource "civo_ssh_key" "this" {
  name       = var.name
  public_key = var.ssh_public_key
}

resource "civo_instance" "this" {
  hostname           = var.name
  size               = element(data.civo_size.xlarge.sizes, 0).name
  disk_image         = element(data.civo_disk_image.ubuntu.diskimages, 0).id
  initial_user       = "root"
  public_ip_required = "create"
  reverse_dns        = var.name
  script             = var.script
  sshkey_id          = civo_ssh_key.this.id
}
