
provider "hcloud" {
  token = var.hcloud_token
}

data "hcloud_ssh_key" "default" {
  name = var.ssh_key
}

data "hcloud_network" "network" {
  name = var.network_name
}


resource "hcloud_server" "vps" {
  count       = var.server_count
  name        = "${var.example_name}-${var.server_name}-${count.index + 1}"
  ssh_keys    = [data.hcloud_ssh_key.default.id]
  image       = var.image
  server_type = var.server_type
  location    = var.datacenter
}

resource "hcloud_server_network" "subnet" {
  count      = length(hcloud_server.vps)
  network_id = data.hcloud_network.network.id
  server_id  = hcloud_server.vps.*.id[count.index]
}

resource "hcloud_volume" "volume" {
  count     = var.attach_volume ? length(hcloud_server.vps) : 0
  name      = "${var.example_name}-${var.server_name}-${count.index + 1}"
  size      = var.volume_size
  server_id = hcloud_server.vps.*.id[count.index]
  automount = true
  format    = "ext4"
}
