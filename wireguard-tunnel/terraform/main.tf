variable "hcloud_token" {
  description = "api token for hetzner cloud"
  type        = string
}

variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "ssh_key" {
  description = "Name of the ssh key"
  type        = string
}

module "server" {
  source          = "../../common/terraform"
  hcloud_token    = var.hcloud_token
  network_name    = var.network_name
  ssh_key         = var.ssh_key
  example_name    = "wireguard"
  server_name     = "vps"
  server_count    = 2
  attach_volume   = false
  output_filename = "../vps.inventory"
}
