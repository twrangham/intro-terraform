# Configure the Azure provider!!!
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name1
  location = "eastus"
   tags     = {
      CreatedBy = "Travis"
      Env = "Dev"
  }
}

resource "azurerm_resource_group" "rg2" {
  name     = var.resource_group_name2
  location = "eastus"
  tags     = {
      CreatedBy = "Travis"
      Env = "Prod"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg1.name
}

# Store state in Terraform Cloud
cloud {
    organization = "Wrangham1"
    workspaces {
      name = "intro-terraform"
    }
  }