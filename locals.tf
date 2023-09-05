locals {
  sap_application_server_model_cpus = {
    S   = 2,
    M   = 4,
    L   = 8,
    XL  = 16,
    XXL = 32
  }
  sap_application_server_model_memory = {
    S   = 4096,
    M   = 8192,
    L   = 16384,
    XL  = 32768,
    XXL = 65536
  }

  sap_application_server_default_disks = [
    { "id" : 0, "label" : "disk0", "size" : "128", "thin_provisioned" : true, "eagerly_scrub" : false, "datastore_name" : var.sap_application_server_datastore, "datastore_policy" : "" },
    { "id" : 1, "label" : "disk1", "size" : "128", "thin_provisioned" : true, "eagerly_scrub" : false, "datastore_name" : var.sap_application_server_datastore, "datastore_policy" : "" }
  ]

  disks_per_vm = flatten([
    for disk_label in { for sap_application_server in var.sap_application_servers : sap_application_server.name => sap_application_server.disks[*].datastore_name } : disk_label
  ])

  storage_policy_per_disks = flatten([
    for storage_policy in { for sap_application_server in var.sap_application_servers : sap_application_server.name => sap_application_server.disks[*].datastore_policy } : storage_policy
  ])

  network_cards_per_vm = flatten([
    for network_cards in { for sap_application_server in var.sap_application_servers : sap_application_server.name => sap_application_server.networks } : network_cards
  ])

  template_per_vm = { for sap_application_server in var.sap_application_servers : sap_application_server.name => sap_application_server.template if sap_application_server.template != "" }

  content_library_per_vm = { for sap_application_server in var.sap_application_servers : sap_application_server.name => sap_application_server.vsphere_content_library if sap_application_server.vsphere_content_library != "" }

  iso_datastore_per_vm = flatten([
    for iso_datastore in { for sap_application_server in var.sap_application_servers : sap_application_server.name => sap_application_server.iso_datastore } : iso_datastore
  ])

  hosts_distribution_per_vm = flatten([
    for hosts_distribution in { for group in var.sap_application_server_hosts_distribution : group.group_name => group.hosts } : hosts_distribution
  ])
}
