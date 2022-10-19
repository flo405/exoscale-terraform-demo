
# Security Groups 

resource "exoscale_security_group" "sg-spoke1" {
  name = "sg-spoke1"
}

resource "exoscale_security_group_rule" "sg-rule-spoke1-1" {
  security_group_id = exoscale_security_group.sg-spoke1.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "10.0.1.10/32"
  start_port = 22
  end_port = 22
}


# Webserver 

data "template_file" "user_data_webserver1" {
  template = file("webserver1.yaml")
}

resource "exoscale_compute_instance" "webserver1"  {
  name = "webserver1"
  template_id = "94938d02-6b02-47ad-8812-b678e378c489"
  zone = "${var.exoscale_zone}"
  type = "standard.micro"
  disk_size = 10
  ssh_key = "key1"
  security_group_ids = [exoscale_security_group.sg-spoke1.id, exoscale_security_group.sg-cloudflare.id]
  user_data = data.template_file.user_data_webserver1.rendered
  network_interface {
    network_id = exoscale_private_network.spoke-vie-1.id
    ip_address = "10.0.1.1"
  }
}

