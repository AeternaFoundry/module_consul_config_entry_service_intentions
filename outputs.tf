output "config_entry_service_intentions_id" {
  description = "Map of id values across all config_entry_service_intentions, keyed the same as var.config_entry_service_intentions except keys with no id are omitted"
  value       = { for k, v in consul_config_entry_service_intentions.config_entry_service_intentions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "config_entry_service_intentions_jwt" {
  description = "Map of jwt values across all config_entry_service_intentions, keyed the same as var.config_entry_service_intentions except keys with no jwt are omitted"
  value       = { for k, v in consul_config_entry_service_intentions.config_entry_service_intentions : k => v.jwt if v.jwt != null && length(v.jwt) > 0 }
}
output "config_entry_service_intentions_meta" {
  description = "Map of meta values across all config_entry_service_intentions, keyed the same as var.config_entry_service_intentions except keys with no meta are omitted"
  value       = { for k, v in consul_config_entry_service_intentions.config_entry_service_intentions : k => v.meta if v.meta != null && length(v.meta) > 0 }
}
output "config_entry_service_intentions_name" {
  description = "Map of name values across all config_entry_service_intentions, keyed the same as var.config_entry_service_intentions except keys with no name are omitted"
  value       = { for k, v in consul_config_entry_service_intentions.config_entry_service_intentions : k => v.name if v.name != null && length(v.name) > 0 }
}
output "config_entry_service_intentions_namespace" {
  description = "Map of namespace values across all config_entry_service_intentions, keyed the same as var.config_entry_service_intentions except keys with no namespace are omitted"
  value       = { for k, v in consul_config_entry_service_intentions.config_entry_service_intentions : k => v.namespace if v.namespace != null && length(v.namespace) > 0 }
}
output "config_entry_service_intentions_partition" {
  description = "Map of partition values across all config_entry_service_intentions, keyed the same as var.config_entry_service_intentions except keys with no partition are omitted"
  value       = { for k, v in consul_config_entry_service_intentions.config_entry_service_intentions : k => v.partition if v.partition != null && length(v.partition) > 0 }
}
output "config_entry_service_intentions_sources" {
  description = "Map of sources values across all config_entry_service_intentions, keyed the same as var.config_entry_service_intentions except keys with no sources are omitted"
  value       = { for k, v in consul_config_entry_service_intentions.config_entry_service_intentions : k => v.sources if v.sources != null && length(v.sources) > 0 }
}

