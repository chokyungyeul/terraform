#기존 network에 가상머신 붙일때 사용
# # Subnet Vars
# variable "subname" {
#   type = string
#   description = "The name of the existing subnet"
#   default = "10.250.100.0/24"
# }

# variable "vnetname" {
#   type = string
#   description = "The name of the existing vnet"
#   default = "10.250.100.0/24"
# }

# variable "vnetrg" {
#   type = string
#   description = "The name of the VNet Resource Group"
#   default = "chotest-vm-rg"
# }

#VMVare
variable "adminpw" {
  type = string
  sensitive = true
  description = "the local admin password, must be 12 char or longer"
  default = "rkskekfk1234!@#$"
}

#rg count
variable "rg_name" {
  type = list
  default = ["chotest01-rg","chotest10-rg"]
}

#vm count
variable "vm_name" {
  type = list
  default = ["test01", "test02"]
}

# #vm-vnetname
# variable "vm_vnet" {
#  type = string
# }

# #vm-subnet name
# variable "vm_subnet" {
#  type = string
  
# }

#vm-address
variable "addres" {
  default     = ["10.250.1.0/24"]
  type        = list(string)

}

variable "subnet-addres" {
  default     = ["10.250.1.0/28"]
  type        = list(string)
}

variable "client_secret" {
  default = "Ghksdud@12"
  type     = string  
}

variable "storage_key" {
  default = "E70Recwzb8Uz5521may0POGbF59FnkoaLL8hgG1eycXap2UmJuOOoZwvzzjO52GtUwrCQQ0HwiDR+AStYRvIPg=="
  type     = string  
}

variable "client_path" {
  default = "/terraform/service-principal.pfx"
  type     = string  
}