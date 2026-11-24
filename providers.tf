terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.72.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "dev"
      Project     = "clc16-network-iac"
      Turma       = "clc16"
    }
  }
}
