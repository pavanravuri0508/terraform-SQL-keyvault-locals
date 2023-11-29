variable "kv-name" {
  type = string
  description = "keyvault name"
}
variable "rgname" {
  type = string
}
variable "location" {
  type = string
}

variable "sku_name" {
  default = "standard"
}

variable "enabled_for_deployment" {
  type = bool
}

variable "enabled_for_disk_encryption" {
  type = bool
}

variable "enabled_for_template_deployment" {
  type = bool
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