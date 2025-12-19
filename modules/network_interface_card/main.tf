resource "azurerm_public_ip" "pip" {
  name                = "infra_pip"
  location            = var.location
  resource_group_name = var.rg_name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.existing_subnet.id
    private_ip_address_allocation = "Dynamic"
     public_ip_address_id = azurerm_public_ip.pip.id
  }
  depends_on = [ azurerm_public_ip.pip ]
}




