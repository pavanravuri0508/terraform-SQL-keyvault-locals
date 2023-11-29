variable "company" {
    type  = string 
    description = "company name"
    default = "volvo"
}
variable "project" {
    type  = string 
    description = "project name"
    default = "terraforming"
}
variable "costcenter" {
  type = string
  description = "cost center id"
  default = "1234"
}
variable "rgname" {
    type  = string 
    description = "preffix to resource group name"
    default = "pavan"
}
variable "location" {
    type  = string 
    description = "location"
    default = "eastus"
}
variable "environment" {
    type  = string 
    description = "env name"
    default = "dev"
}

variable "rgPreffix" {
  type = string
  description = "preffix"
  default = "rg"
}

#KV variables
variable "kv-name" {
  type = string
  description = "keyvault name"
  default = "pavan0805kv"
}


variable "sku_name" {
  default = "standard"
}

variable "enabled_for_deployment" {
  default = true
}

variable "enabled_for_disk_encryption" {
  default = true
}

variable "enabled_for_template_deployment" {
  default = true
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "policies" {
  type = map(object({
    tenant_id               = string
    object_id               = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
  }))
  default = {}
}

variable "secrets" {
  type = map(object({
    value = string
  }))
  default = {}
}

# variables related to MS SQL SERVER
variable "sql_version" {
  type  = string 
  description = "MS SQL Server version"
  default = "12.0"
}

variable "sql_login" {
  type  = string 
  description = "SQL login with SYSADMIN privileges"
  default = "azureadmin"
}

variable "sql_loginpass" {
  type  = string 
  description = "Password"
  default = "admin@123456"
 }  

variable "sql_tls" {
  type  = string 
  description = "TLS version"
  default = "1.2"
 }  

variable "aadadmin_name" {
  type  = string
  description = "AAD login with SYSADMIN privileges"
  default = "pavanravuri@hotmail.com"
 } 

variable "aadadmin_oid" {
  type  = string
  description = "Object Id correspondent to AAD login <aadadmin_name>"
  default = "value"
 } 

variable "sql_preffix" {
    type  =  string
    description = "preffix to MS SQL Server name"
    default = "sqlsrv"
}

# variables related to MS SQL SERVER DATABASE

variable "mssqldatabase_name" {
  type  = string 
  description = "MS SQL DATABASE name"
  default = "testsqlDB"
 }  

variable "mssqldatabase_collation" {
  type  = string
  description = "database collation"
  default = "SQL_Latin1_General_CP1_CI_AS"
 } 

variable "mssqldatabase_license" {
  type  = string
  description = "inform type of licensing to be used"
  default = "LicenseIncluded"

 } 

variable "mssqldatabase_maxsizegb" {
  type  = string
  description = "estabilish the max size allocated to the database (limit 4096 GB)"
  default = "1"
 } 

variable "mssqldatabase_sku" {
  type  = string
  description = "database capacity"
  default = "S0"
} 


