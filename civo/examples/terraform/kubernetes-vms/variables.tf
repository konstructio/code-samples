variable "civo_token" {
  type = string
}

variable "civo_region" {
  type = string
}

variable "ssh_key_pub" {
  type = string
}

variable "ssh_private_key_path" {
  description = "Private key path for configuring /etc/hosts/ for each instance"
  type        = string
}
