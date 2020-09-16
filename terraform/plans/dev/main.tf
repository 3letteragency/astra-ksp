module "astra" {
  source = "../../modules/terraform-vultr-astra"
  region = "Toronto"
  machine_type = 205
}
