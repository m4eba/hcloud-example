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
  example_name    = "keepalived-3vps"
  server_name     = "keepalived"
  server_count    = 3
  attach_volume   = false
  output_filename = "../terraform.inventory"
}