terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

provider "virtualbox" {}

resource "virtualbox_vm" "ansible_node_02" {
  name   = "ansible-node-02"
  image  = "/home/wale/Downloads/jammy-server-cloudimg-amd64.ova"
  cpus   = 2
  memory = "2048 mib"

  network_adapter {
    type           = "nat"
    host_interface = "enp0s3"
  }
}
