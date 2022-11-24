# Create interfaces for automation VMs
resource "azurerm_network_interface" "automationvms" {

  for_each = { for vm in var.virtualmachines : vm.hostname => vm }

  name                = "${each.value.hostname}-nic"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "ipconfig0"
    subnet_id                     = data.azurerm_subnet.automation.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "automationvms" {

  for_each = { for vm in var.virtualmachines : vm.hostname => vm }

  name                  = each.value.hostname
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = each.value.size
  admin_username        = var.vm_user_name
  network_interface_ids = [azurerm_network_interface.automationvms[each.key].id]

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
    name                 = "${each.value.hostname}-osdisk"
    storage_account_type = "Premium_LRS"
    caching              = "ReadWrite"
    disk_size_gb         = each.value.osdisk_size
  }

  zone = each.value.zone

  provision_vm_agent = true
  tags               = var.tags
}

resource "azurerm_managed_disk" "datadisk_01" {

  for_each = { for vm in var.virtualmachines : vm.hostname => vm
    if vm.create_datadisk == true
  }

  name                 = "${each.value.hostname}-datadisk-01"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = each.value.datadisk_size
  zones                = [each.value.zone]

  # Added this to prevent recreation
  lifecycle {
    ignore_changes = [
      create_option,
      source_resource_id
    ]
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_01" {

  for_each = { for vm in var.virtualmachines : vm.hostname => vm
    if vm.create_datadisk == true
  }

  managed_disk_id    = azurerm_managed_disk.datadisk_01[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.automationvms[each.key].id
  lun                = "10"
  caching            = "ReadWrite"

}
