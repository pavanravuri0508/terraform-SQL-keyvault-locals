data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                = var.kv-name
  location            = var.location
  resource_group_name = var.rgname
  sku_name            = var.sku_name

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tags                            = var.tags
}

resource "azurerm_key_vault_access_policy" "default_policy" {
  ## Default policy with Admin permissions for the object creating the resource. Note that this must be kept for a proper run of the "destroy" process, to maintain the ability to delete kv data before deleting kv access policy (race condition conflict in Terraform)

  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  lifecycle {
    create_before_destroy = true
  }

  key_permissions = [
    "Get",
    "Create",
  ]

  secret_permissions = [
    "Get",
    "List",
  ]

  certificate_permissions = [
    "Create",
    "List",
  ]
}

resource "azurerm_key_vault_access_policy" "policy" {
  for_each                = var.policies
  key_vault_id            = azurerm_key_vault.key_vault.id
  tenant_id               = lookup(each.value, "tenant_id")
  object_id               = lookup(each.value, "object_id")
  key_permissions         = lookup(each.value, "key_permissions")
  secret_permissions      = lookup(each.value, "secret_permissions")
  certificate_permissions = lookup(each.value, "certificate_permissions")
}

resource "random_password" "password" {
  for_each    = var.secrets
  length      = 14
  min_upper   = 2
  min_lower   = 2
  min_numeric = 2
  min_special = 2

  keepers = {
    name = each.key
  }
}

resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.secrets
  key_vault_id = azurerm_key_vault.key_vault.id
  name         = each.key
  value        = lookup(each.value, "value") != "" ? lookup(each.value, "value") : random_password.password[each.key].result
  tags         = var.tags
  depends_on = [
    azurerm_key_vault.key_vault,
    azurerm_key_vault_access_policy.default_policy,
  ]
}