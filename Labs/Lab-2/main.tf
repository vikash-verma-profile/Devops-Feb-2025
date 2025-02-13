#setting 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.18.0"
    }
  }
}

#azure provider
provider "azurerm" {
  features {
  }
  subscription_id = "af1fc9db-46ec-4432-a9a9-baecfdd29a96"
}

#Resource block
resource "azurerm_resource_group" "my_demo_rg" {
  location = var.location
  name     = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  location            = var.location
  resource_group_name = azurerm_resource_group.my_demo_rg.name
  address_space       = ["10.0.0.0/16"]
}
