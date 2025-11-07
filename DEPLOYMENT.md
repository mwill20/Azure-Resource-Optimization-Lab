# 🚀 Deployment Guide

This guide provides detailed, step-by-step instructions for deploying the Azure Resource Optimization Lab infrastructure.

## 📋 Prerequisites

Before you begin, ensure you have:

- **Active Azure Subscription** (Azure for Students, Pay-As-You-Go, or Enterprise)
- **Appropriate permissions** to create resources and resource groups
- **Resource quotas** available for:
  - Virtual Machines (B-series or D-series)
  - Virtual Networks
  - Public IP addresses (Standard SKU)
  - Network Security Groups

### Subscription Considerations

- **Azure for Students**: Limited to certain VM SKUs and Standard Public IPs (Basic IPs often blocked)
- **Quota Limits**: Check quotas in Azure Portal → Subscriptions → Usage + quotas
- **Cost**: Estimated $20-50/month for a B2s VM running continuously (less if stopped when not in use)

---

## 🎯 Deployment Methods

### Method 1: Azure Portal (Recommended for Beginners)

#### Step 1: Create Resource Group

1. Navigate to [Azure Portal](https://portal.azure.com)
2. Click **Resource groups** → **+ Create**
3. Configure:
   - **Subscription**: Select your subscription
   - **Resource group**: `rg-azureopt-dev-<yourinitials>`
   - **Region**: Choose your preferred region (e.g., `West US 3`)
4. Click **Next: Tags**
5. Add tags:
   - `Environment` = `Dev`
   - `Owner` = `<YourName>`
   - `Project` = `azure-opt-lab`
6. Click **Review + create** → **Create**

#### Step 2: Deploy ARM Template

1. In the Azure Portal, search for **Deploy a custom template**
2. Click **Build your own template in the editor**
3. Copy the contents of `arm-template/vm-deploy.json` from this repository
4. Paste into the editor and click **Save**
5. Configure parameters:
   - **Resource group**: Select the RG created in Step 1
   - **Region**: (auto-populated from RG)
   - **Admin Username**: `azureuser`
   - **Admin Password**: Create a strong password (min 12 characters, mix of upper/lower/numbers/symbols)
   - **Dns Label Prefix**: Choose a unique name (e.g., `mwoptlab2024`)
   - **Vm Size**: `Standard_B2s` (recommended for cost efficiency)
   - **Environment Tag**: `Dev`
   - **Owner Tag**: `<YourName>`
   - **Project Tag**: `azure-opt-lab`
6. Click **Review + create**
7. Review the validation results
8. Click **Create**

#### Step 3: Monitor Deployment

- Deployment typically takes 3-5 minutes
- Watch the deployment progress in the Notifications panel
- Once complete, click **Go to resource group**

#### Step 4: Verify Resources

Confirm the following resources were created:

- ✅ `vm-app` - Virtual Machine (Ubuntu 22.04)
- ✅ `vnet-app` - Virtual Network
- ✅ `subnet-app` - Subnet
- ✅ `nsg-app` - Network Security Group
- ✅ `nic-app` - Network Interface
- ✅ `pip-app` - Public IP Address
- ✅ OS Disk (auto-created)

#### Step 5: Configure DNS (if needed)

If the DNS label wasn't set during deployment:

1. Navigate to the Public IP resource (`pip-app`)
2. Click **Configuration**
3. Enter your **DNS name label**
4. Click **Save**

#### Step 6: Connect to VM

1. Navigate to the VM resource (`vm-app`)
2. Copy the **DNS name** from the Overview page (e.g., `mwoptlab.westus3.cloudapp.azure.com`)
3. Connect via SSH:

   ```bash
   ssh azureuser@<your-dns-name>
   ```

4. Enter the password you created during deployment

---

### Method 2: Azure CLI

#### Prerequisites

- [Azure CLI installed](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Authenticated: `az login`

#### Deployment Commands

```bash
# Set variables
RG_NAME="rg-azureopt-dev-mw"
LOCATION="westus3"
ADMIN_USER="azureuser"
DNS_PREFIX="mwoptlab2024"
VM_SIZE="Standard_B2s"

# Create resource group with tags
az group create \
  --name $RG_NAME \
  --location $LOCATION \
  --tags Environment=Dev Owner=Michael Project=azure-opt-lab

# Deploy ARM template
az deployment group create \
  --resource-group $RG_NAME \
  --template-file arm-template/vm-deploy.json \
  --parameters \
    adminUsername=$ADMIN_USER \
    adminPassword='<YourStrongPassword>' \
    dnsLabelPrefix=$DNS_PREFIX \
    vmSize=$VM_SIZE \
    environmentTag=Dev \
    ownerTag=Michael \
    projectTag=azure-opt-lab

# Get VM connection info
az vm show \
  --resource-group $RG_NAME \
  --name vm-app \
  --show-details \
  --query [publicIps,fqdns] \
  --output table
```

---

### Method 3: PowerShell

```powershell
# Variables
$rgName = "rg-azureopt-dev-mw"
$location = "westus3"
$adminUser = "azureuser"
$dnsPrefix = "mwoptlab2024"
$vmSize = "Standard_B2s"

# Create resource group
New-AzResourceGroup `
  -Name $rgName `
  -Location $location `
  -Tag @{Environment="Dev"; Owner="Michael"; Project="azure-opt-lab"}

# Deploy template
$securePassword = Read-Host "Enter admin password" -AsSecureString

New-AzResourceGroupDeployment `
  -ResourceGroupName $rgName `
  -TemplateFile "arm-template/vm-deploy.json" `
  -adminUsername $adminUser `
  -adminPassword $securePassword `
  -dnsLabelPrefix $dnsPrefix `
  -vmSize $vmSize `
  -environmentTag "Dev" `
  -ownerTag "Michael" `
  -projectTag "azure-opt-lab"
```

---

## 🔍 Post-Deployment Configuration

### Enable Azure Monitor VM Insights

1. Navigate to your VM in the Azure Portal
2. Go to **Monitoring** → **Insights**
3. Click **Enable**
4. Select or create a Log Analytics Workspace
5. Wait 5-10 minutes for data collection to begin

### Configure Alerts

See detailed alert configuration steps in [`monitoring/alerts.md`](monitoring/alerts.md).

Quick setup:

1. Navigate to VM → **Monitoring** → **Alerts**
2. Click **+ Create** → **Alert rule**
3. Configure **CPU High Alert**:
   - Signal: Percentage CPU
   - Operator: Greater than
   - Threshold: 85
   - Aggregation: Average
   - Period: 5 minutes
   - Severity: Warning (2)
4. Repeat for **Disk I/O High Alert** using Disk Operations/Sec > 300

---

## ✅ Validation Checklist

After deployment, verify:

- [ ] All 6+ resources created successfully
- [ ] VM is in "Running" state
- [ ] DNS name resolves correctly
- [ ] SSH connection works
- [ ] All resources have proper tags
- [ ] VM Insights enabled and collecting data
- [ ] Alert rules configured and active

---

## 🧹 Cleanup

### Portal Cleanup

1. Navigate to **Resource groups**
2. Select your resource group
3. Click **Delete resource group**
4. Type the resource group name to confirm
5. Click **Delete**

### CLI Cleanup

```bash
az group delete --name rg-azureopt-dev-mw --yes --no-wait
```

### PowerShell Cleanup

```powershell
Remove-AzResourceGroup -Name rg-azureopt-dev-mw -Force -AsJob
```

---

## 🐛 Troubleshooting

### Issue: "Quota exceeded" error

**Solution**: 
- Check quota limits: Portal → Subscriptions → Usage + quotas
- Try a different region with available capacity
- Use a smaller VM size (Standard_B1ms)

### Issue: Public IP deployment fails

**Solution**:
- Azure for Students may block Basic IPs
- Template already uses Standard SKU + Static allocation
- Verify subscription supports Standard Public IPs

### Issue: VM size not available in region

**Solution**:
- Check VM size availability: `az vm list-skus --location westus3 --size Standard_B --output table`
- Choose an alternative from the allowed values in the template

### Issue: SSH connection timeout

**Solution**:
- Verify NSG allows port 22 from your IP
- Check VM is in "Running" state
- Confirm DNS name resolves: `nslookup <your-dns-name>`
- Try connecting from Azure Cloud Shell

---

## 📚 Additional Resources

- [Azure Resource Manager Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/)
- [Azure Virtual Machines Documentation](https://docs.microsoft.com/en-us/azure/virtual-machines/)
- [Azure Monitor Documentation](https://docs.microsoft.com/en-us/azure/azure-monitor/)
- [Azure Policy Documentation](https://docs.microsoft.com/en-us/azure/governance/policy/)

---

## 💬 Need Help?

- Open an [issue](https://github.com/mwill20/Azure-Resource-Optimization-Lab/issues)
- Check existing [issues](https://github.com/mwill20/Azure-Resource-Optimization-Lab/issues) for solutions
- Review the [Contributing Guidelines](CONTRIBUTING.md)

