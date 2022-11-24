provider "azurerm" {
  features {}
}

terraform {
  required_providers {
  }
}

terraform {
  backend "azurerm" {
    storage_account_name = "saterraformtest0001"
    container_name       = "statetest"
    key                  = "svdepot.terraform.tfstate"
    resource_group_name  = "rg-beheer-terraform"
    use_azuread_auth     = true
    subscription_id      = "d5409f5d-f4fe-4cf4-aca2-81cb34d37733"	
    
  }
}