#-------------------------------------------------------------
# Create 4 Private Ubuntu VMs using NICs (No Public IPs)
#-------------------------------------------------------------

# Variables
$resourceGroup = "rg-devops-lab"
$vnetName = "vnet-devops"

$netflixSubnet = "NetflixSubnet"
$starbucksSubnet = "StarbucksSubnet"

$adminUser = "devopsadmin"
$adminPassword = "P@ssw01rd@123"

#-------------------------------------------------------------
# Netflix VM1
#-------------------------------------------------------------
az network nic create `
    --resource-group $resourceGroup `
    --name netflixvm1-nic `
    --vnet-name $vnetName `
    --subnet $netflixSubnet

az vm create `
    --resource-group $resourceGroup `
    --name netflixvm1 `
    --nics netflixvm1-nic `
    --image Ubuntu2204 `
    --size Standard_B2s `
    --admin-username $adminUser `
    --admin-password $adminPassword `
    --authentication-type password

#-------------------------------------------------------------
# Netflix VM2
#-------------------------------------------------------------
az network nic create `
    --resource-group $resourceGroup `
    --name netflixvm2-nic `
    --vnet-name $vnetName `
    --subnet $netflixSubnet

az vm create `
    --resource-group $resourceGroup `
    --name netflixvm2 `
    --nics netflixvm2-nic `
    --image Ubuntu2204 `
    --size Standard_B2s `
    --admin-username $adminUser `
    --admin-password $adminPassword `
    --authentication-type password

#-------------------------------------------------------------
# Starbucks VM1
#-------------------------------------------------------------
az network nic create `
    --resource-group $resourceGroup `
    --name starbucksvm1-nic `
    --vnet-name $vnetName `
    --subnet $starbucksSubnet

az vm create `
    --resource-group $resourceGroup `
    --name starbucksvm1 `
    --nics starbucksvm1-nic `
    --image Ubuntu2204 `
    --size Standard_B2s `
    --admin-username $adminUser `
    --admin-password $adminPassword `
    --authentication-type password

#-------------------------------------------------------------
# Starbucks VM2
#-------------------------------------------------------------
az network nic create `
    --resource-group $resourceGroup `
    --name starbucksvm2-nic `
    --vnet-name $vnetName `
    --subnet $starbucksSubnet

az vm create `
    --resource-group $resourceGroup `
    --name starbucksvm2 `
    --nics starbucksvm2-nic `
    --image Ubuntu2204 `
    --size Standard_B2s `
    --admin-username $adminUser `
    --admin-password $adminPassword `
    --authentication-type password

Write-Host ""
Write-Host "========================================"
Write-Host "Private VMs created successfully!"
Write-Host "========================================"
Write-Host "VMs:"
Write-Host " - netflixvm1"
Write-Host " - netflixvm2"
Write-Host " - starbucksvm1"
Write-Host " - starbucksvm2"
Write-Host "========================================"