provider "vsphere" {
  vsphere_server = "pcc-xx-xx-xx-xx.ovh.com"
}

module "sap-application-server" {
  source = "../../"

  sap_application_server_datastore = "ssd-xxxxxx"
  sap_application_servers = [
    {
      "name"                    = "terraform-vm-1",
      "model"                   = "",
      "cpus"                    = 2,
      "cpus_per_socket"         = 2,
      "memory"                  = 1024,
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
      "name"            = "terraform-vm-2",
      "model"           = "",
      "cpus"            = 4,
      "cpus_per_socket" = 4,
      "memory"          = 2048,
      "custom_disks"    = true,
      "disks" = [
        { "id" : 0, "label" : "disk0", "size" : "128", "thin_provisioned" : true, "eagerly_scrub" : false, "datastore_name" : "ssd-xxxxxx", "datastore_policy" : "" },
        { "id" : 1, "label" : "disk1", "size" : "128", "thin_provisioned" : true, "eagerly_scrub" : false, "datastore_name" : "ssd-xxxxxx", "datastore_policy" : "" },
        { "id" : 2, "label" : "disk2", "size" : "64", "thin_provisioned" : true, "eagerly_scrub" : false, "datastore_name" : "ssd-xxxxxx", "datastore_policy" : "" },
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
  vsphere_compute_cluster = "Cluster1"
  vsphere_datacenter      = "pcc-xx-xx-xx-xx_datacenterxxxx"
}
