module "ResourceGroup" {
  source = "github.com/chokyungyeul/terraform.git//modules/ResourceGroup?ref=v0.0.85"
  count   = length(var.rg_name)
  rg_name = element(var.rg_name, count.index)
  location = "koreacentral"
}
 
 
#  lifecycle {
#     ignore_changes = [
#         tags
#     ]
#   }




# 모듈 사용하여 VM 생성
# 여러대 생성 시에는 addres 부분 변수를 선언하여 사용가능
# module "vm01" {
#   source     = "github.com/chokyungyeul/terraform.git//modules/win-datacenter-2019?ref=v0.0.7"
#   count   = length(var.vm_name)
#   rgname     = "chotest01-rg"
#   location   = "koreacentral"
#   # count      = length(var.vm_name)
#   vmname     = element(var.vm_name, count.index)
#   size       = "Standard_B2ms"
#   localadmin = "azureadmin"
#   adminpw    = var.adminpw
#   vm-vnet = element(var.vm_name, count.index)
#   vm-subnet = element(var.vm_name, count.index)
#   addres = var.addres
#   subnet-addres = var.subnet-addres
#   # subnetid = var.subnetid
# }

# module "vm02" {
#   source     = "./modules/win-datacenter-2019"
#   rgname     = "chotest02-rg"
#   location   = "koreacentral"
#   # count      = length(var.vm_name)
#   vmname     = "vm02"
#   size       = "Standard_B2ms"
#   localadmin = "azureadmin"
#   adminpw    = var.adminpw
#   vm-vnet = "vm02"
#   vm-subnet = "vm02"
#   addres = var.addres
#   subnet-addres = var.subnet-addres
#   # subnetid = var.subnetid
# }

# module "vm03" {
#   source     = "./modules/linux-ubunt"
#   rgname     = "chotest03-rg"
#   location   = "koreacentral"
#   # count      = length(var.vm_name)
#   vmname     = "linux-03"
#   size       = "Standard_B2ms"
#   localadmin = "azureadmin"
#   adminpw    = var.adminpw
#   vm-vnet = "linux-03"
#   vm-subnet = "linux03"
#   addres = var.addres
#   subnet-addres = var.subnet-addres
#   # subnetid = var.subnetid
# }

# 스토리지 계정 생성 모듈 사용##
# module "StorageAccount" {
#   source = "./modules/StorageAccount"
#   rg_name = "Account"
#   resource_group_name = module.ResourceGroup.rg_name_out
#   location = "koreacentral"
# }

# 리소스 그룹생성# 만들고싶음 이름 넣기
# resource "azurerm_resource_group" "resourcegroup" {
#     name     = "rg-test01"
#   location = "koreacentral"
# }

# 기존 만들어진 서브넷 넣기
# data "azurerm_subnet" "vmsubnet" {
#   name                 = var.subname
#   virtual_network_name = var.vnetname
#   resource_group_name  = var.vnetrg
# }