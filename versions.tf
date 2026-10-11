terraform {
  required_version = ">= 1.6.0"
  required_providers {
    consul = {
      source  = "hashicorp/consul"
      version = "~> 2.23.0"
    }
  }
}
