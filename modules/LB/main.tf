# resource "azurerm_lb" "lb" {
#  name                = var.lbname
#  location            = var.location
#  resource_group_name = var.rgname
 
#  frontend_ip_configuration {
#    name                 = var.frontendpip
#    public_ip_address_id = azurerm_public_ip.lb.id
#  }
 
#  tags = var.tags
# }
 
# resource "azurerm_lb_backend_address_pool" "bpepool" {
#  resource_group_name = azurerm_resource_group.lb.name
#  loadbalancer_id     = azurerm_lb.lb.id
#  name                = "BackEndAddressPool"
# }
 
# resource "azurerm_lb_probe" "lbprobe" {
#  resource_group_name = azurerm_resource_group.lb.name
#  loadbalancer_id     = azurerm_lb.lb.id
#  name                = "ssh-running-probe"
#  port                = var.application_port
# }
 
# resource "azurerm_lb_rule" "lbnatrule" {
#    resource_group_name            = azurerm_resource_group.lb.name
#    loadbalancer_id                = azurerm_lb.lb.id
#    name                           = "http"
#    protocol                       = "Tcp"
#    frontend_port                  = var.application_port
#    backend_port                   = var.application_port
#    backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
#    frontend_ip_configuration_name = var.frontendpip
#    probe_id                       = azurerm_lb_probe.lb.id
# }