terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.66.0"
    }
  }
}

provider "azurerm" {
  features{}
}

resource "azurerm_resource_group" "rgs" {
  name     = "pinkyMyLobe"
  location = "West Europe"
}