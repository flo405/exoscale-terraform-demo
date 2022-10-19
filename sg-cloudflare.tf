# Security Groups 

resource "exoscale_security_group" "sg-cloudflare" {
  name = "sg-cloudflare"
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-1" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "173.245.48.0/20"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-2" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "103.21.244.0/22"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-3" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "103.22.200.0/22"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-4" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "103.31.4.0/22"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-5" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "141.101.64.0/18"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-6" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "108.162.192.0/18"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-7" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "190.93.240.0/20"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-8" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "188.114.96.0/20"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-9" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "197.234.240.0/22"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-10" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "198.41.128.0/17"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-11" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "162.158.0.0/15"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-12" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "104.16.0.0/13"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-13" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "104.24.0.0/14"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-14" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "172.64.0.0/13"
  start_port = 443
  end_port = 443
}

resource "exoscale_security_group_rule" "sg-rule-cloudflare-15" {
  security_group_id = exoscale_security_group.sg-cloudflare.id
  protocol = "TCP"
  type = "INGRESS"
  cidr =  "131.0.72.0/22"
  start_port = 443
  end_port = 443
}