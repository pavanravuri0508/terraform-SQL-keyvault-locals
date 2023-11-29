

resource "azurerm_mssql_database" "mssqldatabase" {
  name                                  = var.mssqldatabase_name
  server_id                             = var.mssqldatabase_serverid
  collation                             = var.mssqldatabase_collation
  license_type                          = var.mssqldatabase_license
  max_size_gb                           = var.mssqldatabase_maxsizegb
  sku_name                              = var.mssqldatabase_sku

  tags                                  = var.tags

  
}

