data "vultr_region" "new_jersey" {
  filter {
    name   = "name"
    values = ["New Jersey"]
  }
}
