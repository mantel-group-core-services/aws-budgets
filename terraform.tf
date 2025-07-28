terraform {
  required_version = ">= 1.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5"
    }
  }
}

locals {
  enforced_tags = {
    Owner       = "MantelGroupManagedServices"
    CoreService = "AWSBudgets"
  }
}

