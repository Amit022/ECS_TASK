terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"

    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "eu-west-1"
  access_key = "AKIASCRVBZCTW6UWZDMH"
  secret_key = "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"
}