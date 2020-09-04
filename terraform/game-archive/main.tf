terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "1.4.0"
    }
  }
}

resource "vultr_object_storage" "tf" {
  object_storage_cluster_id = data.vultr_region.new_jersey.id
  label = "astra"
}
