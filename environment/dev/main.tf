module "rg" {
  source   = "../../modules/resource_group"
  name_rg  = var.rg_name
  location = var.location
}

module "vnet" {
  source              = "../../modules/vnet"
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = module.rg.rg_name
}

module "subnet" {
  source           = "../../modules/subnet"
  subnet_name      = var.subnet_name
  address_prefixes = var.subnet_prefix
  vnet_name        = module.vnet.vnet_name
  rg_name          = module.rg.rg_name
}

module "nsg" {
  source              = "../../modules/nsg"
  name_nsg            = var.nsg_name
  location            = var.location
  resource_group_name = module.rg.rg_name
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-dev"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


