

resource "azurerm_virtual_network" "vm-vnet" {
  name                = "${var.vm-vnet}-vnet"
  address_space       = var.addres
  location            = var.location
  resource_group_name = var.rgname
}

resource "azurerm_subnet" "vm-subnet" {
  name                 = "${var.vm-subnet}-subnet"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vm-vnet.name
  address_prefixes     = var.subnet-addres
}

# Create public IPs
resource "azurerm_public_ip" "pip" {
  name                = "${var.vmname}-pip"
  location            = var.location
  resource_group_name = var.rgname
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "netinterface" {
  name                = "${var.vmname}-nic"
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm-subnet.id
    public_ip_address_id          = azurerm_public_ip.pip.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nsg_join" {
  network_interface_id      = azurerm_network_interface.netinterface.id
  network_security_group_id = azurerm_network_security_group.vm-nsg.id
}

resource "azurerm_network_security_group" "vm-nsg" {
  name                = "${var.vmname}-nsg"
  location            = var.location
  resource_group_name = var.rgname

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vmname
  resource_group_name = var.rgname
  location            = var.location
  size                = var.size
  admin_username      = var.localadmin
  admin_password      = var.adminpw
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.netinterface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

   source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}


