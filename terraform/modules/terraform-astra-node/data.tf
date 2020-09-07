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

data "vultr_os" "astra_os" {
  filter {
    name   = "name"
    values = [var.os]
  }
}
