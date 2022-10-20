
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

resource "exoscale_security_group_rule" "sg-rule-spoke1-2" {
  security_group_id = exoscale_security_group.sg-spoke1.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "0.0.0.0/0"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-spoke1-3" {
  security_group_id = exoscale_security_group.sg-spoke1.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "50.60.70.80/32"
  start_port = 80
  end_port = 80
}

# Webserver 

data "template_file" "user_data_webserver1" {
  template = file("webserver1.yaml")
}

resource "exoscale_compute_instance" "webserver1"  {
  name = "webserver1"
  labels = tomap({
    env = "prod"
    dataclass = "public"
    })
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

