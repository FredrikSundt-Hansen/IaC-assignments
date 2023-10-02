resource "azurerm_resource_group" "vm_rg" {
  name     = var.vm_rg_name
  location = var.vm_rg_location
  tags = var.common_tags
}

resource "azurerm_public_ip" "vm_pub_ip" {
  name                = var.vm_pub_ip_name
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location
  allocation_method   = "Static"
  tags = var.common_tags
}

resource "azurerm_network_interface" "vm_nic" {
  name                = var.vm_nic_name
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pub_ip.id
  }

  tags = var.common_tags
}

resource "azurerm_linux_virtual_machine" "vm_linux" {
  name                = var.vm_linux_name
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location
  size                = var.vm_size["small"]
  admin_username      = var.vm_username
  admin_password      = var.vm_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
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

  tags = var.common_tags
}