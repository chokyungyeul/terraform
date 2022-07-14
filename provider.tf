terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
backend "azurerm" {
        resource_group_name  = "Jenkins-vm-rg"
        storage_account_name = "savetfstate"
        container_name       = "terraform"
        key                  = "E70Recwzb8Uz5521may0POGbF59FnkoaLL8hgG1eycXap2UmJuOOoZwvzzjO52GtUwrCQQ0HwiDR+AStYRvIPg=="
    }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
     virtual_machine {
      delete_os_disk_on_deletion    = true
      skip_shutdown_and_force_delete = true
  }
  }
  subscription_id = "a30376d1-42be-4a6d-a201-8254f23c7064"
  client_id       = "fbf9bfce-a44e-4632-a9bc-4a1c4280ea08"
  client_secret   = var.client_secret
  tenant_id       = "785087ba-1e72-4e7d-b1d1-4a9639137a66"
}
