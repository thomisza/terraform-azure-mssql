variable "rg_name" {
  type        = string
  default     = "default-RG"
  description = "Ressource group name"
}

variable "rg_location" {
  type        = string
  default     = "westeurope"
  description = "Ressource groupe location"
}

variable "mssql_server_name" {
  type        = string
  default     = "default-MSSQL-server"
  description = "MSSQL Server name"
}

variable "mssql_server_admin_login" {
  type        = string
  default     = "admin"
  description = "MSSQL Server admin login"
}

variable "mssql_database_name" {
  type        = string
  default     = "default-MSSQL-database"
  description = "MSSQL database name"
}

variable "azure_sql_admin_login" {
  type        = string
  default     = "default-MSSQL-database"
  description = "MSSQL database name"
}
