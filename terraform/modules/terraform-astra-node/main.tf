resource "vultr_ssh_key" "mission_control" {
  name = "mission_control"
  ssh_key = file("~/.ssh/id_rsa.pub")
}

resource "vultr_server" "astra_node" {
  plan_id     = var.machine_type
  region_id   = data.vultr_region.region.id
  os_id       = data.vultr_os.astra_os.id
  label       = "${uuid()}-astra-node"
  hostname    = "${uuid()}-astra-node"
  ssh_key_ids = [ vultr_ssh_key.mission_control.id ]

  connection {
    type = "ssh"
    user = "root"
    host = self.main_ip
    password = self.default_password
  }

  provisioner "file" {
    source = "${path.module}/local/assets/ksp-1.7.3.tar.gz"
    destination = "/tmp/ksp.tar.gz"
  }

  provisioner "remote-exec" {
    inline = [
      "useradd -m astra",
      "tar -xzvf /tmp/ksp.tar.gz -C /home/astra --strip-components=1"
    ]
  }
}
