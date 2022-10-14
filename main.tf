# Configure the Azure provider!!!
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  # Store state in Terraform Cloud
  cloud {
    organization = "Wrangham1"
    workspaces {
      name = "intro-terraform"
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
  tags = {
    CreatedBy = "Travis"
    Env       = "Dev"
  }
}

resource "azurerm_resource_group" "rg2" {
  name     = var.resource_group_name2
  location = "eastus"
  tags = {
    CreatedBy = "Travis"
    Env       = "Prod"
  }
}

resource "azurerm_resource_group" "rg3" {
  name     = var.resource_group_name3
  location = "eastus"
  tags = {
    CreatedBy = "Travis"
    Env       = "Prod"
  }
}
