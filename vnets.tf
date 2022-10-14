# Create vnet1
resource "azurerm_virtual_network" "vnet1" {
  name                = "myTFVnet1"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg1.name
}

# Create vnet2
resource "azurerm_virtual_network" "vnet2" {
  name                = "myTFVnet2"
  address_space       = ["10.1.0/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg1.name
}


