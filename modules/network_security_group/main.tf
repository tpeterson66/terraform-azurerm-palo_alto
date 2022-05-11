variable "name" {
  type        = string
  description = "network security group name"
}

variable "resource_group" {
  description = "Resource group object"
}

resource "azurerm_network_security_group" "this" {
  name                = var.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  tags = {
    environment = "Production"
  }
}
