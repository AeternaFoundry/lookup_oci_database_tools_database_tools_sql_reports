data "oci_database_tools_database_tools_sql_reports" "database_tools_database_tools_sql_reports_lookup" {
  for_each = var.database_tools_database_tools_sql_reports_lookup

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  state          = each.value.state
  type           = each.value.type

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

