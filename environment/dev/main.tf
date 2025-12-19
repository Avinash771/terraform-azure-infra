module "rg" {
  source   = "../../modules/resource_group"
  rg_name = var.rg_name
  location = var.location
}

module "vnet" {
  source              = "../../modules/virtual_network"
  depends_on = [ module.rg ]
  vnet_name            = var.vnet_name
  location            = var.location
  rg_name             = var.rg_name
}

module "subnet" {
  source = "../../modules/subnet"
  depends_on = [ module.vnet ]
  subnet_name = var.subnet_name
  rg_name = var.rg_name
  vnet_name = var.vnet_name
}

module "nic"{
  source = "../../modules/network_interface_card"
    depends_on = [ module.rg,module.vnet,module.subnet]
  nic_name = var.nic_name
  rg_name = var.rg_name
  location = var.location
  subnet_name = var.subnet_name
  vnet_name = var.vnet_name
}

# module "vm" {
#   source = "../../modules/linux_virtual_machine"
#   vm_name = var.vm_name
#   location = var.location
#   rg_name = var.rg_name
  
# }


