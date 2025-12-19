resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.rg_name
  size                = "Standard_F2"
  admin_username      = "aviusername"
  admin_password = "avi@123456"
disable_password_authentication = "false"


  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

