provider "azurerm" {
  features {}
}

module "my-mssql-db" {
  source                   = "git::https://github.com/thomisza/tf-azdo-mssql"
  rg_name                  = ""
  rg_location              = ""
  mssql_server_name        = ""
  mssql_server_admin_login = ""
  mssql_database_name      = ""
  azure_sql_admin_login    = ""
}
