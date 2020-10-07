## <https://www.terraform.io/docs/providers/azurerm/r/virtual_network.html>
resource "azurerm_virtual_network" "network150" {
  name                = "vNet"
  address_space       = ["150.0.0.0/16"]
  location            = azurerm_resource_group.windem.location
  resource_group_name = azurerm_resource_group.windem.name
}
## <https://www.terraform.io/docs/providers/azurerm/r/subnet.html> 
resource "azurerm_subnet" "subnet" {
  name                 = "sub1"
  resource_group_name  = azurerm_resource_group.windem.name
  virtual_network_name = azurerm_virtual_network.network150.name
  address_prefix       = "150.0.2.0/24"
}
## <https://www.terraform.io/docs/providers/azurerm/r/network_interface.html>
resource "azurerm_network_interface" "niccardid" {
  name                = "demo-nic"
  location            = azurerm_resource_group.windem.location
  resource_group_name = azurerm_resource_group.windem.name

  ip_configuration {
    name                          = "sub1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
## creating netowrk security group
resource "azurerm_network_security_group" "security" {
    name = "Azure_nsg"
    location  = "westeurope"
    resource_group_name = azurerm_resource_group.windem.name
    
security_rule {
    name="open_port80"
    priority = 400
    direction = "inbound"
    access = "allow"
    protocol = "Tcp"
    source_port_range ="*"
    destination_port_range = "*"
    source_address_prefix="*"
    destination_address_prefix= "*"


}
tags= {
    

  env: "seccurity_group" 
  owner: "Ronith"
  
 
}


}
