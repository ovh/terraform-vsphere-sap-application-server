<!-- BEGIN_TF_DOCS -->
# Simple SAP Application Server VM

Usage of the module to deploy a simple SAP Application Server virtual machine

## vSphere user requirements

User in the vSphere client with the following permissions:
- vSphere access: Read/Write
- Access to the VM Network: Operator
- Access to the V(X)LANs: Operator

## Usage
Replace the value of variables by your values :
- sap\_application\_server\_datastore
- vsphere\_compute\_cluster
- vsphere\_datacenter
- vsphere\_server

```bash
terraform init
terraform plan
terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | >= 2.4.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sap-application-server"></a> [sap-application-server](#module\_sap-application-server) | ../../ | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_affinity_hosts_sap_application_servers_rules"></a> [affinity\_hosts\_sap\_application\_servers\_rules](#output\_affinity\_hosts\_sap\_application\_servers\_rules) | Map of affinity hosts SAP Application Servers virtual machines rules information |
| <a name="output_anti_affinity_sap_application_servers_rule"></a> [anti\_affinity\_sap\_application\_servers\_rule](#output\_anti\_affinity\_sap\_application\_servers\_rule) | Map of anti affinity SAP Application Servers virtual machines rule information |
| <a name="output_sap_application_servers_ids"></a> [sap\_application\_servers\_ids](#output\_sap\_application\_servers\_ids) | Map of SAP Application Server virtual machines names and its IDs |
<!-- END_TF_DOCS -->