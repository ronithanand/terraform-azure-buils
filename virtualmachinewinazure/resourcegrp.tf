## <https://www.terraform.io/docs/providers/azurerm/r/resource_group.html>
resource "azurerm_resource_group" "windem" {
  name     = "Terraformwindeploy"
  location = "westeurope"
}