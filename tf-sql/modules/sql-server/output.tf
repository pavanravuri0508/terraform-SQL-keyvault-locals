output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_sql_server.sql_server.name
}

output "sqlserver_id" {
  description = "The id of the resource created."
  value       = azurerm_sql_server.sql_server.id
}

