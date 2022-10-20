
# Security Groups 

resource "exoscale_security_group" "sg-spoke2" {
  name = "sg-spoke2"
}

resource "exoscale_security_group_rule" "sg-rule-spoke2-1" {
  security_group_id = exoscale_security_group.sg-spoke2.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "10.0.1.10/32"
  start_port = 22
  end_port = 22
}

# Webserver 

resource "exoscale_compute_instance" "webserver2"  {
  name = "webserver2"
  labels = tomap({
    env = "prod"
    dataclass = "confidential"
    })
  template_id = "94938d02-6b02-47ad-8812-b678e378c489"
  zone = "bg-sof-1"
  type = "standard.micro"
  disk_size = 10
  ssh_key = "key1"
  security_group_ids = [exoscale_security_group.sg-spoke2.id, exoscale_security_group.sg-cloudflare.id]
  user_data = data.template_file.user_data_webserver1.rendered
  network_interface {
    network_id = exoscale_private_network.spoke-vie-2.id
    ip_address = "10.0.1.11"
  }
}

