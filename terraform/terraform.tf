terraform {
  backend "azurerm" {
    resource_group_name  = "azure-terraform-sample"
    storage_account_name = "tfstatetonnsama"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.65.0"
    }
  }
}
