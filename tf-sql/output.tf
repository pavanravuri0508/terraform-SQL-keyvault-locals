output "rgname" {
  value = module.rg.newResourceGroupName
}
# output "kvname" {
#   value = module.keyvault.name
# }
output "sql-server-name" {
  value = module.mssqlserver.name
}