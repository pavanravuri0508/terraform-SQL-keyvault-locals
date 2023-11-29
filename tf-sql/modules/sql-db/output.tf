# output "stoname" {
#   description = "The name of the resoruce created."
#   value       = azurerm_storage_account.stoacctmssqldatabase.name
# }

# output "stoid" {
#   description = "The id of the resource created."
#   value       = azurerm_storage_account.stoacctmssqldatabase.id
# }

output "dbname" {
  description = "The name of the resoruce created."
  value       = azurerm_mssql_database.mssqldatabase.name
}

output "dbid" {
  description = "The id of the resource created."
  value       = azurerm_mssql_database.mssqldatabase.id
}
