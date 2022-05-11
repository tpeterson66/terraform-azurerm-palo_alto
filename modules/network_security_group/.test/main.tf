terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "buildId" {
  default     = "111111"
  description = "Azure DevOps Build ID"
  type        = string
}

resource "azurerm_resource_group" "testing" {
  name     = "automated_testing_${var.buildId}"
  location = "East US"
}

module "network_security_group" {
  source         = "../"
  name           = "automated_testing_${var.buildId}"
  resource_group = azurerm_resource_group.testing
}