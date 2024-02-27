variable "name" {
  description = "Name for instance"
  type        = string
}

variable "script" {
  description = "Startup script for instance"
  type        = string
}

variable "ssh_public_key" {
  description = "Public key for instance ssh"
  type        = string
}
