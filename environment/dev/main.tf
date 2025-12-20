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

module "nsg" {
  source = "../../modules/nsg"
  depends_on = [ module.rg ]
  rg_name = var.rg_name
  nsg_rule_name = var.nsg_rule_name
  priority = var.nsg_priority
  direction = var.nsg_direction
  access = var.nsg_access
  protocol = var.nsg_protocol
  source_port_range = var.nsg_source_port_range
  destination_port_range = var.nsg_destination_port_range
  source_address_prefix = var.nsg_source_address_prefix
  destination_address_prefix = var.nsg_destination_address_prefix
}

module "vm" {
  source                = "../../modules/linux_virtual_machine"
  depends_on            = [module.nic]
  vm_name               = var.vm_name
  location              = var.location
  rg_name               = var.rg_name
  resource_group_name   = var.rg_name
  nic_name              = var.nic_name
  vm_size               = var.vm_size
  admin_username        = var.admin_username
  ssh_public_key_path   = var.ssh_public_key_path
}


