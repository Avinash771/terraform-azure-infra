module "rg" {
  source   = "../../modules/resource_group"
  rg_name = var.rg_name
  location = var.location
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name            = var.vnet_name
  location            = var.location
  rg_name             = var.rg_name
}

module "subnet" {
  source           = "../../modules/subnet"
 subnet_name = var.subnet_name
 rg_name = var.rg_name
 vnet_name = var.vnet_name
}

module "nic" {
  source = "../../modules/netwok_interface_card"
  nic_name = var.nic_name
  location = var.location
  rg_name = var.rg_name
}

module "vm" {
  source = "../../modules/linux_virtual_machine"
  vm_name = var.vm_name
  location = var.location
  rg_name = var.rg_name


  
}


