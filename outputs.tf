output "sap_application_servers_ids" {
  description = "Map of SAP Application Server virtual machines names and its IDs"
  value       = { for sap_application_server in vsphere_virtual_machine.sap_application_server : sap_application_server.name => sap_application_server.id }
}

output "affinity_hosts_sap_application_servers_rules" {
  description = "Map of affinity hosts SAP Application Server virtual machines rules information"
  value = { for anti_affinity_rule in vsphere_compute_cluster_vm_host_rule.cluster_vm_host_rule : anti_affinity_rule.name => {
    "sap_application_servers_group_name" = anti_affinity_rule.vm_group_name
    "affinity_host_group_name"           = anti_affinity_rule.affinity_host_group_name
    "sap_application_servers_ids"        = [for sap_application_server in vsphere_compute_cluster_vm_group.cluster_sap_application_server_group : sap_application_server.virtual_machine_ids if sap_application_server.name == anti_affinity_rule.vm_group_name]
    }
  }
}

output "anti_affinity_sap_application_servers_rule" {
  description = "Map of anti affinity SAP Application Servers virtual machines rule information"
  value = { for anti_affinity_rule in vsphere_compute_cluster_vm_anti_affinity_rule.sap_application_server_anti_affinity_rule : anti_affinity_rule.name => {
    "name"                        = anti_affinity_rule.name
    "enable"                      = anti_affinity_rule.enabled
    "mandatory"                   = anti_affinity_rule.mandatory
    "sap_application_servers_ids" = anti_affinity_rule.virtual_machine_ids
    }
  }
}
