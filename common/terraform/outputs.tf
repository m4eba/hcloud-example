output "server_ipv4" {
  description = "server ipv4"
  value       = [hcloud_server.vps.*.ipv4_address]
}

output "subnet_ipv4" {
  description = "subnet private ipv4"
  value       = [hcloud_server_network.subnet.*.ip]
}

output "volume" {
  description = "path on the file system"
  value       = [hcloud_volume.volume.*.linux_device]
}


resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tmpl",
  {
    server_name   = var.server_name
    attach_volume = var.attach_volume
    server        = hcloud_server.vps.*
    subnet        = hcloud_server_network.subnet.*
    volume        = hcloud_volume.volume.*
  }
  )
  filename = var.output_filename
}

resource "local_file" "ansible_vars" {
  content = templatefile("${path.module}/ansible_vars.tmpl",
  {
     hcloud_token     = var.hcloud_token
     network_name     = var.network_name
  }
  )
  filename = "${dirname(var.output_filename)}/group_vars/all/terraform_generated.yaml"
}