
# Provider

terraform {
  required_providers {
    exoscale = {
      source  = "exoscale/exoscale"
    }
  }
}

# API Key

provider "exoscale" {
  key = "${var.exoscale_api_key}"
  secret = "${var.exoscale_secret_key}"
}


