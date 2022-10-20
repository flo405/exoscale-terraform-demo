
# Private Networks

resource "exoscale_private_network" "hub-vie" {
  zone = "${var.exoscale_zone}"
  name = "hub-vie"

  netmask  = "255.255.255.0"
  start_ip = "10.0.0.50"
  end_ip   = "10.0.0.250"
}

resource "exoscale_private_network" "spoke-vie-1" {
  zone = "${var.exoscale_zone}"
  name = "spoke-vie-1"

  netmask  = "255.255.255.0"
  start_ip = "10.0.1.1"
  end_ip   = "10.0.1.10"
}

resource "exoscale_private_network" "spoke-vie-2" {
  zone = "${var.exoscale_zone}"
  name = "spoke-vie-2"

  netmask  = "255.255.255.0"
  start_ip = "10.0.1.11"
  end_ip   = "10.0.1.20"
}

# Security Groups

resource "exoscale_security_group" "sg-ssh-bastion" {
  name = "sg-ssh-bastion"
}

resource "exoscale_security_group_rule" "sg-rule-ssh-bastion-1" {
  security_group_id = exoscale_security_group.sg-ssh-bastion.id
  protocol = "TCP"
  type = "INGRESS"
  cidr = "0.0.0.0/0"
  start_port = 22
  end_port = 22
}


# Jump Server (Hub)

data "template_file" "user_data_jump_server" {
  template = file("jump_server.yaml")
}

resource "exoscale_compute_instance" "jump-server"  {
  name = "jump-server"
  labels = tomap({
    env = "prod"
    dataclass = "secret"
    })
  template_id = "79b4fb1c-e115-40ea-9a2d-03b1ca2f2f46"
  zone = "${var.exoscale_zone}"
  type = "standard.micro"
  disk_size = 10
  ssh_key = "key1"
  security_group_ids = [exoscale_security_group.sg-ssh-bastion.id]
  user_data = data.template_file.user_data_jump_server.rendered
  network_interface {
    network_id = exoscale_private_network.hub-vie.id
    ip_address = "10.0.0.250"
  }
  network_interface {
    network_id = exoscale_private_network.spoke-vie-1.id
    ip_address = "10.0.1.10"
  }
}



