output "sap_application_servers_ids" {
  description = "Map of SAP Application Server virtual machines names and its IDs"
  value       = module.sap-application-server.sap_application_servers_ids
}

output "affinity_hosts_sap_application_servers_rules" {
  description = "Map of affinity hosts SAP Application Servers virtual machines rules information"
  value       = module.sap-application-server.affinity_hosts_sap_application_servers_rules
}

output "anti_affinity_sap_application_servers_rule" {
  description = "Map of anti affinity SAP Application Servers virtual machines rule information"
  value       = module.sap-application-server.anti_affinity_sap_application_servers_rule
}
