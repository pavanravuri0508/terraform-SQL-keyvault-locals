
variable "tags" {
    type  = map(string) 
    description = "tags related to project"
}

variable "mssqldatabase_name" {
  type  = string 
  description = "MS SQL DATABASE name"
 }  
variable "mssqldatabase_serverid" {
  type  = string 
  description = "assign database to an existing MS SQL server ID "
 }  

variable "mssqldatabase_collation" {
  type  = string
  description = "database collation"

 } 

variable "mssqldatabase_license" {
  type  = string
  description = "inform type of licensing to be used"

 } 

variable "mssqldatabase_maxsizegb" {
  type  = string
  description = "estabilish the max size allocated to the database (limit 4096 GB)"

 } 

variable "mssqldatabase_sku" {
  type  = string
  description = "database capacity"

 } 

