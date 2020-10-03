data "http" "c2_ip" {
  url = "https://ifconfig.me"
}

resource "vultr_server" "astra_node" {
  count       = var.flight_count
  plan_id     = var.machine_type
  region_id   = data.vultr_region.region.id
  snapshot_id = data.vultr_snapshot.astra_node.id
  label       = "astra-flight-${count.index}"
  hostname    = "astra-flight-${count.index}"

  connection {
    type = "ssh"
    user = "root"
    host = self.main_ip
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "ufw allow ssh",
      "ufw allow from ${data.http.c2_ip.body}/32 to any port 50000",
      "ufw allow from ${data.http.c2_ip.body}/32 to any port 50001",
      "ufw --force enable"
    ]
  }
}
