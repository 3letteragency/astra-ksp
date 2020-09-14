module "astra" {
  source = "../../modules/terraform-astra-node"
  region = "Toronto"
  machine_type = 205
}
