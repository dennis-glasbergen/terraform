# Sort of roles and explains what it does:

####################################################
# GENERAL ROLES
####################################################

# Contributor:
# Grants full access to manage all resources, but does not allow you to assign roles in Azure RBAC, manage assignments in Azure Blueprints, or share image galleries
data "azurerm_role_definition" "contributor" {
  name = "Contributor"
}

# Owner:
# Grants full access to manage all resources, including the ability to assign roles in Azure RBAC.
data "azurerm_role_definition" "owner"{
name = "Owner"
}

# Reader:
# View all resources, but does not allow you to make any changes.
data "azurerm_role_definition" "reader" {
  name = "Reader"
}

########################################################
# COMPUTE
########################################################

# Virtual Machine Contributor
# Create and manage virtual machines, manage disks and disk snapshots, install and run software, reset password of the root user of the virtual machine using VM esxtensions,
# and manage local user accounts using VM extensions. This role does not grant you management access to the virtual network or storage account the virtual machines are connected to.
# This role does not allow you to assign roles in Azure RBAC
data "azurerm_role_definition" "vm_contributor" {
  name = "Virtual Machine Contributor"
}




########################################################
# Storage
########################################################

# Storage Account Contributor
# Permits management of storage accounts. Provides access to the account key, which can be used to access data via Shared Key authorization.
data "azurerm_role_definition" "storage_account_contributor" {
  name = "Storage Account Contributor"
 }

# Storage Blob Data Contributor
# Read, write, and delete Azure Storage containers and blobs. To learn which actions are required for a given data operation.
data "azurerm_role_definition" "storage_blob_data_contributor" {
  name = "Storage Blob Data Contributor"
 }


########################################################
# Web
########################################################

# Web Plan Contributor
# Lets you manage the web plans for websites, but not access to them.
data "azurerm_role_definition" "web_plan_contributor" {
  name = "Web Plan Contributor"
}

# Website Contributor
# Lets you manage websites (not web plans), but not access to them
data "azurerm_role_definition" "web_site_contributor" {
  name = "Website Contributor"
}


##########################################################
# Containers
##########################################################

# ArcPull
# Pull artifacts from a container registry.
data "azurerm_role_definition" "acr_pull" {
  name = "AcrPull"
}

# ArcPush
# Push artifacts to or pull artifacts from a container registry.
data "azurerm_role_definition" "acr_push" {
  name = "AcrPush"
}

# Azure Kubernetes Service Cluster User Role
# List cluster user credential action
data "azurerm_role_definition" "aks_cluster_user" {
  name = "Azure Kubernetes Service Cluster User Role"
}


############################################################
# Database
############################################################

# SQL Server Contributor
# Lets you manage SQL servers and databases, but not access to them, and not their security-related policies.
data "azurerm_role_definition" "sql_server_contributor" {
  name = "SQL Server Contributor"
}



#############################################################
# Analytics
#############################################################

# Data Factory Contributor
# Create and manage data factories, as well as child resources within them.
data "azurerm_role_definition" "df_contributor" {
  name = "Data Factory Contributor"
}

# Log Analytics Reader
# Log Analytics Reader can view and search all monitoring data as well as and view monitoring settings, including viewing the configuration of Azure diagnostics on all Azure resources.
data "azurerm_role_definition" "lawreader" {
  name = "Log Analytics Reader"
}


###############################################################
# Security
###############################################################

# Key Vault Certificates Officer
# Perform any action on the certificates of a key vault, except manage permissions. Only works for key vaults that use the 'Azure role-based access control' permission model.
data "azurerm_role_definition" "kv_cert_officer" {
  name = "Key Vault Certificates Officer"
}

# Key Vault Crypto Officer
# Perform any action on the keys of a key vault, except manage permissions. Only works for key vaults that use the 'Azure role-based access control' permission model.
data "azurerm_role_definition" "kv_crypto_officer" {
  name = "Key Vault Crypto Officer"
}

# Key Vault Secrets Officer
# Perform any action on the secrets of a key vault, except manage permissions. Only works for key vaults that use the 'Azure role-based access control' permission model.
data "azurerm_role_definition" "kv_secrets_officer" {
  name = "Key Vault Secrets Officer"
}

# Key Vault Secrets User
# Read secret contents. Only works for key vaults that use the 'Azure role-based access control' permission model.
data "azurerm_role_definition" "kv_secrets_user" {
  name = "Key Vault Secrets User"
}














