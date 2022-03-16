variable "hcloud_token" {
  description = "api token for hetzner cloud"
  type        = string
}

variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "example_name" {
  description = "Name of the example"
  type        = string
}

variable "server_name" {
  description = "Name of the servers"
  type        = string
}

variable "ssh_key" {
  description = "Name of the ssh key"
  type        = string
}


variable "image" {
  description = "image for the server"
  type        = string
  default     = "ubuntu-20.04"
}

variable "datacenter" {
  description = "Datacenter location"
  type        = string
  default     = "fsn1"
}

variable "server_type" {
  description = "Server type"
  type        = string
  default     = "cpx11"
}

variable "server_count" {
  description = "Number of server"
  type        = number
}

variable "attach_volume" {
  description = "Attach a volume to the servers"
  type        = bool
  default     = false
}

variable "volume_size" {
  description = "Size of the volumes"
  type        = number
  default     = 2
}

variable "output_filename" {
  description = "Path to the inventory file"
  type        = string
}