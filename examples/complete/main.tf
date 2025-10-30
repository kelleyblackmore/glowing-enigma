terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "ec2_with_tags" {
  source = "../.."

  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name

  # Custom default tags
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "production"
    Team        = "Platform"
    Application = "WebApp"
  }

  # Extra tags that will be merged with default tags
  extra_tags = {
    Project    = "CustomerPortal"
    CostCenter = "Engineering"
    Owner      = "platform-team@example.com"
    Backup     = "Daily"
    Compliance = "SOC2"
  }
}
