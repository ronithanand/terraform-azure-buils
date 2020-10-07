## <https://www.terraform.io/docs/providers/azurerm/r/availability_set.html>
resource "azurerm_availability_set" "win-2016" {
  name                = "dem-aset"
  location            = azurerm_resource_group.windem.location
  resource_group_name = azurerm_resource_group.windem.name
}