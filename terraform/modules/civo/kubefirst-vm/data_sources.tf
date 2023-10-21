data "civo_size" "xlarge" {
  filter {
    key      = "name"
    values   = ["g3.xlarge"]
    match_by = "re"
  }
  filter {
    key    = "type"
    values = ["instance"]
  }
}

data "civo_disk_image" "ubuntu" {
  filter {
    key    = "name"
    values = ["ubuntu-jammy"]
  }
}
