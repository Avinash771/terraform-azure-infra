data "azurerm_network_interface" "existing_nic" {
  name                = var.nic_name
  resource_group_name = var.rg_name
}