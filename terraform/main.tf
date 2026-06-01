terraform {
  required_version = ">= 1.8.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.47.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-joehiequesho"
    key    = "terraform_state.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}
