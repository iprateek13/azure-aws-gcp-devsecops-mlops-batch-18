#-------------------------------------------------------------
# Azure CLI PowerShell Script
# Creates:
# - 1 Resource Group
# - 1 Virtual Network
# - 3 Subnets
#     - NetflixSubnet
#     - StarbucksSubnet
#     - AzureBastionSubnet
# - 1 NAT Gateway (attached to NetflixSubnet & StarbucksSubnet)
# - 4 Ubuntu VMs (No Public IPs)
# - 1 Azure Bastion
#-------------------------------------------------------------

# Variables
$location = "eastus"
$resourceGroup = "rg-devops-lab"

$vnetName = "vnet-devops"
$vnetAddress = "10.0.0.0/16"

$netflixSubnet = "NetflixSubnet"
$netflixPrefix = "10.0.1.0/24"

$starbucksSubnet = "StarbucksSubnet"
$starbucksPrefix = "10.0.2.0/24"

$bastionSubnet = "AzureBastionSubnet"
$bastionPrefix = "10.0.3.0/26"

$adminUser = "devopsadmin"
$adminPassword = "P@ssw01rd@123"

#-------------------------------------------------------------
# Create Resource Group
#-------------------------------------------------------------
az group create `
    --name $resourceGroup `
    --location $location

#-------------------------------------------------------------
# Create Virtual Network & Netflix Subnet
#-------------------------------------------------------------
az network vnet create `
    --resource-group $resourceGroup `
    --name $vnetName `
    --location $location `
    --address-prefix $vnetAddress `
    --subnet-name $netflixSubnet `
    --subnet-prefix $netflixPrefix

#-------------------------------------------------------------
# Create Starbucks Subnet
#-------------------------------------------------------------
az network vnet subnet create `
    --resource-group $resourceGroup `
    --vnet-name $vnetName `
    --name $starbucksSubnet `
    --address-prefixes $starbucksPrefix

#-------------------------------------------------------------
# Create Azure Bastion Subnet
#-------------------------------------------------------------
az network vnet subnet create `
    --resource-group $resourceGroup `
    --vnet-name $vnetName `
    --name $bastionSubnet `
    --address-prefixes $bastionPrefix

#-------------------------------------------------------------
# Create Public IP for NAT Gateway
#-------------------------------------------------------------
az network public-ip create `
    --resource-group $resourceGroup `
    --name nat-pip `
    --location $location `
    --sku Standard `
    --allocation-method Static

#-------------------------------------------------------------
# Create NAT Gateway
#-------------------------------------------------------------
az network nat gateway create `
    --resource-group $resourceGroup `
    --name nat-gateway `
    --location $location `
    --public-ip-addresses nat-pip `
    --idle-timeout 10

#-------------------------------------------------------------
# Attach NAT Gateway to Netflix Subnet
#-------------------------------------------------------------
az network vnet subnet update `
    --resource-group $resourceGroup `
    --vnet-name $vnetName `
    --name $netflixSubnet `
    --nat-gateway nat-gateway

#-------------------------------------------------------------
# Attach NAT Gateway to Starbucks Subnet
#-------------------------------------------------------------
az network vnet subnet update `
    --resource-group $resourceGroup `
    --vnet-name $vnetName `
    --name $starbucksSubnet `
    --nat-gateway nat-gateway

#-------------------------------------------------------------
# Create Netflix VM1
#-------------------------------------------------------------
az vm create `
    --resource-group $resourceGroup `
    --name netflixvm1 `
    --image Ubuntu2204 `
    --size Standard_B2s `
    --admin-username $adminUser `
    --admin-password $adminPassword `
    --authentication-type password `
    --vnet-name $vnetName `
    --subnet $netflixSubnet `
    --public-ip-address ""

#-------------------------------------------------------------
# Create Netflix VM2
#-------------------------------------------------------------
az vm create `
    --resource-group $resourceGroup `
    --name netflixvm2 `
    --image Ubuntu2204 `
    --size Standard_B2s `
    --admin-username $adminUser `
    --admin-password $adminPassword `
    --authentication-type password `
    --vnet-name $vnetName `
    --subnet $netflixSubnet `
    --public-ip-address ""

#-------------------------------------------------------------
# Create Starbucks VM1
#-------------------------------------------------------------
az vm create `
    --resource-group $resourceGroup `
    --name starbucksvm1 `
    --image Ubuntu2204 `
    --size Standard_B2s `
    --admin-username $adminUser `
    --admin-password $adminPassword `
    --authentication-type password `
    --vnet-name $vnetName `
    --subnet $starbucksSubnet `
    --public-ip-address ""

#-------------------------------------------------------------
# Create Starbucks VM2
#-------------------------------------------------------------
az vm create `
    --resource-group $resourceGroup `
    --name starbucksvm2 `
    --image Ubuntu2204 `
    --size Standard_B2s `
    --admin-username $adminUser `
    --admin-password $adminPassword `
    --authentication-type password `
    --vnet-name $vnetName `
    --subnet $starbucksSubnet `
    --public-ip-address ""

#-------------------------------------------------------------
# Create Public IP for Azure Bastion
#-------------------------------------------------------------
az network public-ip create `
    --resource-group $resourceGroup `
    --name bastion-pip `
    --location $location `
    --sku Standard

#-------------------------------------------------------------
# Create Azure Bastion
#-------------------------------------------------------------
az network bastion create `
    --resource-group $resourceGroup `
    --name bastion-host `
    --location $location `
    --vnet-name $vnetName `
    --public-ip-address bastion-pip

Write-Host ""
Write-Host "========================================"
Write-Host "Deployment completed successfully!"
Write-Host "========================================"
Write-Host "Resource Group : $resourceGroup"
Write-Host "VNet           : $vnetName"
Write-Host "Subnets        : NetflixSubnet, StarbucksSubnet, AzureBastionSubnet"
Write-Host "VMs            : netflixvm1, netflixvm2, starbucksvm1, starbucksvm2"
Write-Host "NAT Gateway    : nat-gateway"
Write-Host "Azure Bastion  : bastion-host"
Write-Host "========================================"