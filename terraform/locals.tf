# locals.tf - Local Values for AWS Infrastructure

locals {
  # Region reference
  region = var.region

  standard_lifecycle = {
    ignore_changes = [tags_all]
  }
}
