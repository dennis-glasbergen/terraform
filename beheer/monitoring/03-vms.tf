# Create interface for other VMs
resource "azurerm_network_interface" "monitoring" {

  for_each = { for vm in var.virtualmachines : vm.hostname => vm }

  name                = "${each.value.hostname}-nic"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.monitoring.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "monitoring" {

  for_each = { for vm in var.virtualmachines : vm.hostname => vm }

  name                  = each.value.hostname
  resource_group_name   = upper(azurerm_resource_group.rg.name)
  location              = azurerm_resource_group.rg.location
  size                  = each.value.size
  admin_username        = var.vm_user_name
  network_interface_ids = [azurerm_network_interface.monitoring[each.key].id]

  admin_ssh_key {
    username   = var.vm_user_name
    public_key = file(var.public_ssh_key_path)
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

  os_disk {
    name                 = each.value.hostname
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    disk_size_gb         = each.value.osdisk_size
  }

  provision_vm_agent = true
  tags               = var.tags
}

