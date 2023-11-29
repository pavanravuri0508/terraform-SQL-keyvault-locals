resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_name
  resource_group_name          = var.rgname
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_login
  administrator_login_password = var.sql_loginpass
}

# resource "azurerm_mssql_server" "mssqlserver" {
#   name                                  = var.sql_name
#   resource_group_name                   = var.rgname
#   location                              = var.location
#   version                               = var.sql_version
#   administrator_login                   = var.sql_login
#   administrator_login_password          = var.sql_loginpass
#   minimum_tls_version                   = var.sql_tls

#   # azuread_administrator {
#   #   login_username                      = var.aadadmin_name 
#   #   object_id                           = var.aadadmin_oid
#   # }

#   tags                                  = var.tags
# }

