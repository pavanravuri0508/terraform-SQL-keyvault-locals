variable "rgname" {
  type  = string 
  description = "The resource group name."
}

variable "location" {
  type  = string 
  description = "The region were the resource will be deployed."
}


variable "tags" {
    type  = map(string) 
    description = "tags related to project"
}

variable "sql_name" {
  type  = string 
  description = "MS SQL Server name."
}  

variable "sql_version" {
  type  = string 
  description = "MS SQL Server version"
}

variable "sql_login" {
  type  = string 
  description = "SQL login with SYSADMIN privileges"
}

variable "sql_loginpass" {
  type  = string 
  description = "Password"
 }  

variable "sql_tls" {
  type  = string 
  description = "TLS version"
 }  

# variable "aadadmin_name" {
#   type  = string
#   description = "AAD login with SYSADMIN privileges"
#  } 

# variable "aadadmin_oid" {
#   type  = string
#   description = "Object Id correspondent to AAD login <aadadmin_name>"
#  } 
