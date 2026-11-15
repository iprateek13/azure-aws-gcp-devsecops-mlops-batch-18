terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.13.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "8.11.0"
    }   
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }     
  }
}