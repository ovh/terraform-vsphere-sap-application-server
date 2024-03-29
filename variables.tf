variable "vsphere_datacenter" {
  type        = string
  description = "Name of the datacenter in vSphere interface"
}

variable "sap_application_server_datastore" {
  type        = string
  description = "Name of the datastore to store SAP Application Servers virtual machines"
}

variable "vsphere_compute_cluster" {
  type        = string
  description = <<EOH
  Name of the vSphere cluster
  Example: Cluster1
  EOH
}

variable "sap_application_servers" {
  type        = list(any)
  description = <<EOH
  List of SAP Application Servers virtual machines wanted with these parameters (mandatory, even if empty).

  Example:
  [
    {
      "name"                    = "sidscs",
      "model"                   = "",
      "cpus"                    = "4",
      "cpus_per_socket"         = "4",
      "memory"                  = "4096",
      "custom_disks"            = false,
      "disks"                   = [],
      "networks"                = ["VLAN20"],
      "guest_id"                = "sles15_64Guest",
      "vsphere_content_library" = "",
      "template"                = "",
      "iso_datastore"           = "",
      "iso_path"                = "",
      "vapp_options"            = {}
    },
    {
      "name"                    = "sidpas",
      "model"                   = "M",
      "cpus"                    = "",
      "cpus_per_socket"         = "",
      "memory"                  = "",
      "custom_disks"            = true,
      "disks" = [
        { "id" : 0, "label" : "disk0", "size" : "128", "thin_provisioned" : true, "eagerly_scrub": false, "datastore_name" : "ssd-xxxxxx", "datastore_policy" : "" },
        { "id" : 1, "label" : "disk1", "size" : "128", "thin_provisioned" : true, "eagerly_scrub": false, "datastore_name" : "ssd-xxxxxx", "datastore_policy" : "" },
        { "id" : 2, "label" : "disk2", "size" : "64", "thin_provisioned" : true, "eagerly_scrub": false, "datastore_name" : "ssd-xxxxxx", "datastore_policy" : "" }
      ],
      "networks"                = ["VLAN20"],
      "guest_id"                = "sles15_64Guest",
      "vsphere_content_library" = "",
      "template"                = "",
      "iso_datastore"           = "",
      "iso_path"                = "",
      "vapp_options"            = {}
    }
  ]
  EOH
}

variable "sap_application_server_folder" {
  type        = string
  default     = ""
  description = "Name of the folder to store the SAP Application Server virtual machines"
}

variable "sap_application_server_anti_affinity_rule_enable" {
  type        = bool
  default     = false
  description = "Avoid running SAP Application Servers virtual machines on the same ESXi host"
}

variable "sap_application_server_anti_affinity_rule_name" {
  type        = string
  default     = "sap-application-server-anti-affinity-rule"
  description = "Name for the anti-affinity rule"
}

variable "sap_application_server_anti_affinity_rule_mandatory" {
  type        = bool
  default     = false
  description = "When this value is true, prevents any virtual machine operations that may violate this rule"
}

variable "sap_application_server_hardware_version" {
  type        = number
  default     = 19
  description = <<EOH
  Hardware compatibility between SAP Application Server virtual machine and ESXi host. By default, the newest version.
  More information available on [VMware](https://kb.vmware.com/s/article/2007240)
  EOH
}

variable "sap_application_server_wait_for_guest_net_timeout" {
  type        = number
  default     = 0
  description = "The amount of time, in minutes, to wait for an available guest IP address on the SAP Application Server virtual machine."
}

variable "sap_application_server_wait_for_guest_ip_timeout" {
  type        = number
  default     = 0
  description = "The amount of time, in minutes, to wait for an available guest IP address on the SAP Application Server virtual machine."
}

variable "sap_application_server_hosts_distribution" {
  type        = list(any)
  default     = []
  description = <<EOH
  Allow to set which SAP Application Server virtual machines have to run on a specific ESXi host.
  When mandatory is true, prevents any virtual machine operations that may violate this rule.
  
  Example:
  [
    {
      "group_name" = "scs-ts1",
      "hosts" = ["192.168.2.1", "192.168.2.2"],
      "sap_application_servers" = ["sidscs"],
      "mandatory" = true
    },
    {
      "group_name" = "pas-ts1",
      "hosts" = ["192.168.2.2"],
      "sap_application_servers" = ["sidpas"],
      "mandatory" = false
    }
  ]
  EOH
}
