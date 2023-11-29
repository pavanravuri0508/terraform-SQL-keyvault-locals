module "rg" {
  source      = "./modules/rg"
  rgname      = local.rgname
  location    = var.location
  tags        = local.tags
}

module "keyvault" {
  source = "./modules/keyvault"
  kv-name = var.kv-name
  rgname = local.rgname
  sku_name = var.sku_name
  policies = var.policies
  location = var.location
  enabled_for_deployment = var.enabled_for_deployment
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  tags = local.tags
  depends_on = [ module.rg ]
}

module "mssqlserver" {
  source                                = "./modules/SQL-Server"
  sql_name                              = local.sql_name
  rgname                                = local.rgname
  location                              = var.location
  sql_version                           = var.sql_version
  sql_login                             = var.sql_login
  sql_loginpass                         = var.sql_loginpass
  sql_tls                               = var.sql_tls
  #aadadmin_name                         = "default-aadadmin" 
  #aadadmin_oid                          = "default-aadadmin-oid"

  tags                                  = local.tags

  depends_on = [module.rg]
}

module "mssqldatabase" {
  source                                = "./modules/SQL-DB"
  mssqldatabase_name                    = var.mssqldatabase_name
  mssqldatabase_serverid                = module.mssqlserver.sqlserver_id
  mssqldatabase_collation               = var.mssqldatabase_collation
  mssqldatabase_license                 = var.mssqldatabase_license
  mssqldatabase_maxsizegb               = var.mssqldatabase_maxsizegb
  mssqldatabase_sku                     = var.mssqldatabase_sku
  tags                                  = local.tags 
  depends_on = [module.mssqlserver]
}

