# Creating A VM
az vm create \
  --name myVM \
  --resource-group [sandbox resource group name] \
  --image UbuntuLTS \
  --location eastus \
  --size Standard_DS2_v2 \
  --admin-username azureuser \
  --generate-ssh-keys
  
  
#Script to install Nginx with basic landing page
az vm extension set \
  --resource-group [sandbox resource group name] \
  --vm-name myVM \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --settings "{'fileUris':['https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh']}" \
  --protected-settings "{'commandToExecute': './configure-nginx.sh'}"
  
#Open a port (here 80 for HTTP) through the firewall 
az vm open-port \
  --name myVM \
  --resource-group [sandbox resource group name] \
  --port 80
  
#Resize a VM
az vm resize \
  --resource-group [sandbox resource group name] \
  --name myVM \
  --size Standard_DS3_v2
  
#Verify VM config
az vm show \
  --name myVM \
  --resource-group [sandbox resource group name] \
  --show-details \
  --query [publicIps] \
  --query "hardwareProfile" \
  --output tsv
  