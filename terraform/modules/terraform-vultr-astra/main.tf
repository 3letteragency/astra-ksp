resource "vultr_server" "astra_node" {
  plan_id     = var.machine_type
  region_id   = data.vultr_region.region.id
  snapshot_id = data.vultr_snapshot.astra_node.id
  label       = "${uuid()}-astra-node"
  hostname    = "${uuid()}-astra-node"
}
