terraform {
  required_version = ">= 1.0.0"
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}