# locals.tf - Local Values for AWS Infrastructure
# This file contains local values derived from data sources for easy reference
# across Terraform configurations

locals {
      # Common tags for consistent resource tagging
  common_tags = {
    Environment   = terraform.workspace
    Project       = "infrastructure"
    ManagedBy     = "Terraform"
    Region        = var.region
    CreatedBy     = "Terraform"
    CostCenter    = "Infrastructure"
    Owner         = "DevOps"
    IaC           = "true"
    Repository    = "aws-vpc"
    LastModified  = timestamp()
  }

}