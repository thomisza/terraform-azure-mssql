data "azurerm_client_config" "current" {}

resource "random_password" "admin" {
  length           = 30
  special          = true
  override_special = "_%?!#()-[]<>,;*@="
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
}

resource "azurerm_mssql_server" "main" {
  name                         = var.mssql_server_name
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = "12.0"
  minimum_tls_version          = "1.2"
  administrator_login          = var.mssql_server_admin_login
  administrator_login_password = random_password.admin.result

  azuread_administrator {
    login_username = var.azure_sql_admin_login
    tenant_id      = data.azurerm_client_config.current.tenant_id
    object_id      = data.azurerm_client_config.current.object_id
  }
}

resource "azurerm_mssql_database" "main" {
  name           = var.mssql_database_name
  server_id      = azurerm_mssql_server.main.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "BC_Gen5_2"
  zone_redundant = true
}
