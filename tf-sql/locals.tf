resource "random_integer" "rand" {
  min = 000001
  max = 999999
}
locals {
  randomSuffix = "${format("%06s", random_integer.rand.result)}"
  rgname = "${var.rgPreffix}-${var.rgname}-${local.randomSuffix}"
  location = var.location
  tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    costcenter   = var.costcenter
    environment  = var.environment
  }

  #MS SQL SERVER
  sql_name               = lower("${var.sql_preffix}${var.rgname}-${local.randomSuffix}")  
}