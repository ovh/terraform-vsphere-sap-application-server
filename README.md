<!-- BEGIN_TF_DOCS -->
# OVHcloud SAP Application Servers Terraform module

Terraform module to create a set of SAP Application Servers virtual machines on VMware on OVHcloud.
You have the possibility to create many SAP Application Servers virtual machines with different parameters.

This module can be used to create SAP SCS, SAP AS, SAProuter servers and so many other SAP servers.

## vSphere user requirements

User in the vSphere client with the following permissions:
- vSphere access: Read/Write
- Access to the VM Network: Operator
- Access to the V(X)LANs: Operator

## How to use this module

This repository has an example folder which includes several ways to use this module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.5.5 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement_vsphere) | >= 2.4.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vsphere"></a> [vsphere](#provider_vsphere) | 2.4.1 |

## Resources

| Name | Type |
|------|------|
| [vsphere_compute_cluster_host_group.cluster_host_group](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/compute_cluster_host_group) | resource |
| [vsphere_compute_cluster_vm_anti_affinity_rule.sap_application_server_anti_affinity_rule](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/compute_cluster_vm_anti_affinity_rule) | resource |
| [vsphere_compute_cluster_vm_group.cluster_sap_application_server_group](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/compute_cluster_vm_group) | resource |
| [vsphere_compute_cluster_vm_host_rule.cluster_vm_host_rule](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/compute_cluster_vm_host_rule) | resource |
| [vsphere_virtual_machine.sap_application_server](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine) | resource |
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/compute_cluster) | data source |
| [vsphere_content_library.library](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/content_library) | data source |
| [vsphere_content_library_item.item](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/content_library_item) | data source |
| [vsphere_datacenter.datacenter](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter) | data source |
| [vsphere_datastore.custom_datastore_disks](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_datastore.default_datastore_disks](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_datastore.iso_datastore](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_host.host](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/host) | data source |
| [vsphere_network.network](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_storage_policy.custom_datastore_disks](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/storage_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sap_application_server_datastore"></a> [sap_application_server_datastore](#input_sap_application_server_datastore) | Name of the datastore to store SAP Application Servers virtual machines | `string` | n/a | yes |
| <a name="input_sap_application_servers"></a> [sap_application_servers](#input_sap_application_servers) | List of SAP Application Servers virtual machines wanted with these parameters (mandatory, even if empty).<br><br>  Example:<br>  [<br>    &emsp;{<br>&emsp;&emsp;      "name"                    = "sidscs",<br>&emsp;&emsp;      "model"                   = "",<br>&emsp;&emsp;      "cpus"                    = "4",<br>&emsp;&emsp;      "cpus_per_socket"         = "4",<br>&emsp;&emsp;      "memory"                  = "4096",<br>&emsp;&emsp;      "custom_disks"            = false,<br>&emsp;&emsp;      "disks"                   = [],<br>&emsp;&emsp;      "networks"                = ["VLAN20"],<br>&emsp;&emsp;      "guest_id"                = "sles15_64Guest",<br>&emsp;&emsp;      "vsphere_content_library" = "",<br>&emsp;&emsp;      "template"                = "",<br>&emsp;&emsp;      "iso_datastore"           = "",<br>&emsp;&emsp;      "iso_path"                = "",<br>&emsp;&emsp;      "vapp_options"            = {}<br>    &emsp;},<br>&emsp;{<br>&emsp;&emsp;      "name"                    = "sidpas",<br>&emsp;&emsp;      "model"                   = "M",<br>&emsp;&emsp;      "cpus"                    = "",<br>&emsp;&emsp;      "cpus_per_socket"         = "",<br>&emsp;&emsp;      "memory"                  = "",<br>&emsp;&emsp;      "custom_disks"            = true,<br>&emsp;&emsp;      "disks" = [<br>        &emsp;&emsp;&emsp;&emsp;{ "id" : 0, "label" : "disk0", "size" : "128", "thin_provisioned" : true, "eagerly_scrub": false, "datastore_name" : "ssd-xxxxxx", "datastore_policy" : "" },<br>&emsp;        &emsp;&emsp;&emsp;{ "id" : 1, "label" : "disk1", "size" : "128", "thin_provisioned" : true, "eagerly_scrub": false, "datastore_name" : "ssd-xxxxxx", "datastore_policy" : "" },<br>&emsp;        &emsp;&emsp;&emsp;{ "id" : 2, "label" : "disk2", "size" : "64", "thin_provisioned" : true, "eagerly_scrub": false, "datastore_name" : "ssd-xxxxxx", "datastore_policy" : "" }<br>&emsp;&emsp;&emsp;],<br>&emsp;&emsp;      "networks"                = ["VLAN20"],<br>&emsp;&emsp;      "guest_id"                = "sles15_64Guest",<br>&emsp;&emsp;      "vsphere_content_library" = "",<br>&emsp;&emsp;      "template"                = "",<br>&emsp;&emsp;      "iso_datastore"           = "",<br>&emsp;&emsp;      "iso_path"                = "",<br>&emsp;&emsp;      "vapp_options"            = {}<br>   &emsp;}<br>  ] | `list(any)` | n/a | yes |
| <a name="input_vsphere_compute_cluster"></a> [vsphere_compute_cluster](#input_vsphere_compute_cluster) | Name of the vSphere cluster<br>  Example: Cluster1 | `string` | n/a | yes |
| <a name="input_vsphere_datacenter"></a> [vsphere_datacenter](#input_vsphere_datacenter) | Name of the datacenter in vSphere interface | `string` | n/a | yes |
| <a name="input_sap_application_server_anti_affinity_rule_enable"></a> [sap_application_server_anti_affinity_rule_enable](#input_sap_application_server_anti_affinity_rule_enable) | Avoid running SAP Application Servers virtual machines on the same ESXi host | `bool` | `false` | no |
| <a name="input_sap_application_server_anti_affinity_rule_mandatory"></a> [sap_application_server_anti_affinity_rule_mandatory](#input_sap_application_server_anti_affinity_rule_mandatory) | When this value is true, prevents any virtual machine operations that may violate this rule | `bool` | `false` | no |
| <a name="input_sap_application_server_anti_affinity_rule_name"></a> [sap_application_server_anti_affinity_rule_name](#input_sap_application_server_anti_affinity_rule_name) | Name for the anti-affinity rule | `string` | `"sap-application-server-anti-affinity-rule"` | no |
| <a name="input_sap_application_server_folder"></a> [sap_application_server_folder](#input_sap_application_server_folder) | Name of the folder to store the SAP Application Server virtual machines | `string` | `""` | no |
| <a name="input_sap_application_server_hardware_version"></a> [sap_application_server_hardware_version](#input_sap_application_server_hardware_version) | Hardware compatibility between SAP Application Server virtual machine and ESXi host. By default, the newest version.<br>  More information available on [VMware](https://kb.vmware.com/s/article/2007240) | `number` | `19` | no |
| <a name="input_sap_application_server_hosts_distribution"></a> [sap_application_server_hosts_distribution](#input_sap_application_server_hosts_distribution) | Allow to set which SAP Application Server virtual machines have to run on a specific ESXi host.<br>  When mandatory is true, prevents any virtual machine operations that may violate this rule.<br><br>  Example:<br>  [<br>    &emsp;{<br>&emsp;&emsp;      "group_name" = "scs-ts1",<br>&emsp;&emsp;      "hosts" = ["192.168.2.1", "192.168.2.2"],<br>&emsp;&emsp;      "sap_application_servers" = ["sidscs"],<br>&emsp;&emsp;      "mandatory" = true<br>    &emsp;},<br>&emsp;{<br>&emsp;&emsp;      "group_name" = "pas-ts1",<br>&emsp;&emsp;      "hosts" = ["192.168.2.2"],<br>&emsp;&emsp;      "sap_application_servers" = ["sidpas"],<br>&emsp;&emsp;      "mandatory" = false<br>   &emsp;}<br>  ] | `list(any)` | `[]` | no |
| <a name="input_sap_application_server_wait_for_guest_ip_timeout"></a> [sap_application_server_wait_for_guest_ip_timeout](#input_sap_application_server_wait_for_guest_ip_timeout) | The amount of time, in minutes, to wait for an available guest IP address on the SAP Application Server virtual machine. | `number` | `0` | no |
| <a name="input_sap_application_server_wait_for_guest_net_timeout"></a> [sap_application_server_wait_for_guest_net_timeout](#input_sap_application_server_wait_for_guest_net_timeout) | The amount of time, in minutes, to wait for an available guest IP address on the SAP Application Server virtual machine. | `number` | `0` | no |

As the variable `sap_application_servers` is a list with many parameters, we present you one by one each parameter.

<table>
<thead>
  <tr>
    <th>Name</th>
    <th>Description</th>
    <th>Type</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>name</td>
    <td>Name of the virtual machine.</td>
    <td>string</td>
  </tr>
  <tr>
    <td>model</td>
    <td>The module proposes 5 models:<br>
        - S: 2vCPU and 4GB of memory<br>
        - M: 4vCPU and 8GB of memory<br>
        - L: 8vCPU and 16GB of memory<br>
        - XL: 16vCPU and 32GB of memory<br>
        - XXL: 32vCPU and 64GB of memory<br>
    </td>
    <td>string</td>
  </tr>
  <tr>
    <td>cpus</td>
    <td>Number of vCPU for the virtual machine.<br>
        <b>Mandatory if the variable model is empty.</b>
    </td>
    <td>string</td>
  </tr>
  <tr>
    <td>cpus_per_socket</td>
    <td>Number of vCPU per socket for the virtual machine.<br>
        <b>Mandatory even if the variable model is empty.</b>
    </td>
    <td>string</td>
  </tr>
  <tr>
    <td>memory</td>
    <td>Number of memory (in MB) for the virtual machine.<br>
        <b>Mandatory if the variable model is empty.</b>
    </td>
    <td>string</td>
  </tr>
  <tr>
    <td>custom_disks</td>
    <td>The module proposes by default two disks:<br>
        - disk0 (root) | 128 GB | Thin provisioning<br>
        - disk1 (sap) | 128 GB | Thin provisioning<br><br>
        If you want to set your own configuration for disks, set the variable to true.
    </td>
    <td>boolean</td>
  </tr>
  <tr>
    <td>disks</td>
    <td>List of disks wanted if the variable custom_disks has been set to true.<br>
        <b>The default disk are no longer created if the variable custom_disks has been set to true</b><br>
        The structure has to be like this:<br><br>
        [<br>
        &emsp;{ "id" : 0, "label" : "disk0", "size" : "{size in GB}", "thin_provisioned" : {true | false=thick}, "datastore_name" : "{datastore to store disk}", "datastore_policy" : "{datastore policy}" },<br>&emsp;
        { "id" : 1, "label" : "disk1", "size" : "{size in GB}", "thin_provisioned" : {true | false=thick}, "datastore_name" : "{datastore to store disk}", "datastore_policy" : "{datastore policy}" },<br>&emsp;
        { "id" : 2, "label" : "disk2", "size" : "{size in GB}", "thin_provisioned" : {true | false=thick}, "datastore_name" : "{datastore to store disk}", "datastore_policy" : "{datastore policy}" },<br>&emsp;
        ...<br>
        ]<br><br>
        Caution, the datastore policy has to be set with the same behaviour on the thin or thick provisioning. Don't set a thin provisioning in the variable if the datastore policy set a thick provisioning.<br><br>
        You have also the possibility to let the datastore_policy empty (""), the Storage Policy by default for the datastore will be applied.<br><br>
        To know more about the Storage Policy (datastore_policy), please refer to the <a href="https://docs.vmware.com/en/VMware-vSphere/6.7/com.vmware.vsphere.storage.doc/GUID-89091D59-D844-46B2-94C2-35A3961D23E7.html">official documentation</a> on VMware.
    </td>
    <td>list()</td>
  </tr>
  <tr>
    <td>networks</td>
    <td>List of network cards.</td>
    <td>list()</td>
  </tr>
  <tr>
    <td>guest_id</td>
    <td>Operating System to be compatible between ESXi host and the virtual machine.<br>
        To know the possible value for this variable, please refer to the <a href="https://vdc-repo.vmware.com/vmwb-repository/dcr-public/da47f910-60ac-438b-8b9b-6122f4d14524/16b7274a-bf8b-4b4c-a05e-746f2aa93c8c/doc/vim.vm.GuestOsDescriptor.GuestOsIdentifier.html">official list</a> on VMware.
    </td>
    <td>string</td>
  </tr>
  <tr>
    <td>vsphere_content_library</td>
    <td>The Content Library name where the OVA is stored, if you want to create the virtual machine from a template.</td>
    <td>string</td>
  </tr>
  <tr>
    <td>template</td>
    <td>Name of the template.<br>
        <b>Mandatory if the variable vsphere_content_library has been set.</b>
    </td>
    <td>string</td>
  </tr>
  <tr>
    <td>iso_datastore</td>
    <td>Datastore name where the ISO file is stored, if you want to add a CD-ROM device and start the virtual machine on it.</td>
    <td>string</td>
  </tr>
  <tr>
    <td>iso_path</td>
    <td>Path in the datastore to locate the ISO file.<br>
        <b>Mandatory if the variable iso_datastore is not empty.</b>
    </td>
    <td>string</td>
  </tr>
  <tr>
    <td>vapp_options</td>
    <td>Map that you want to pass to the virtual machine.<br>
        <b>Only available with template which has vApp Options enabled.</b><br><br>
        Example: <br>
        &emsp;{<br>&emsp;&emsp;
          "guestinfo.hostname" : "vm-sap-pas",<br>&emsp;&emsp;
          "guestinfo.user" : "my-user",<br>&emsp;&emsp;
          "guestinfo.password" : "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ",<br>&emsp;&emsp;
          "guestinfo.password_crypted" : "False"<br>
       &emsp;}<br>
    </td>
    <td>map</td>
  </tr>
</tbody>
</table>

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_affinity_hosts_sap_application_servers_rules"></a> [affinity_hosts_sap_application_servers_rules](#output_affinity_hosts_sap_application_servers_rules) | Map of affinity hosts SAP Application Server virtual machines rules information |
| <a name="output_anti_affinity_sap_application_servers_rule"></a> [anti_affinity_sap_application_servers_rule](#output_anti_affinity_sap_application_servers_rule) | Map of anti affinity SAP Application Servers virtual machines rule information |
| <a name="output_sap_application_servers_ids"></a> [sap_application_servers_ids](#output_sap_application_servers_ids) | Map of SAP Application Server virtual machines names and its IDs |

## How do I contribute to this Terraform Module?

Contributions are very welcome! Check out the Contribution Guidelines for instructions.

## How is this Terraform Module versioned?

This Terraform Module follows the principles of Semantic Versioning. You can find each new release, along with the changelog, in the Releases Page.

During initial development, the major version will be 0 (e.g., 0.x.y), which indicates the code does not yet have a stable API. Once we hit 1.0.0, we will make every effort to maintain a backwards compatible API and use the MAJOR, MINOR, and PATCH versions on each release to indicate any incompatibilities.

## License

This code is released under the Apache 2.0 License. Please see LICENSE for more details.
<!-- END_TF_DOCS -->