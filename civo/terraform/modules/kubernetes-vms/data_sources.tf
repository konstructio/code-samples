data "civo_size" "large" {
  filter {
    key      = "name"
    values   = ["g3.large"]
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
