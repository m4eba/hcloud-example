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

module "server_controller" {
  source          = "../../common/terraform"
  hcloud_token    = var.hcloud_token
  network_name    = var.network_name
  ssh_key         = var.ssh_key
  example_name    = "kubernetes-4vps"
  server_name     = "controller"
  server_count    = 2
  attach_volume   = false
  output_filename = "../controller.inventory"
}

module "server_worker" {
  source          = "../../common/terraform"
  hcloud_token    = var.hcloud_token
  network_name    = var.network_name
  ssh_key         = var.ssh_key
  example_name    = "kubernetes-4vps"
  server_name     = "worker"
  server_count    = 2
  attach_volume   = false
  output_filename = "../worker.inventory"
}