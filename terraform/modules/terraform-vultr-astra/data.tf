terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "1.4.0"
    }
  }
}

data "vultr_region" "region" {
  filter {
    name   = "name"
    values = [var.region]
  }
}

data "vultr_snapshot" "astra_node" {
  filter {
    name = "description"
    values = [var.snapshot]
  }
}
