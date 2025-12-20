variable "location" {}
variable "rg_name" {}
variable "vnet_name" {}
variable "subnet_name" {}
# variable "vm_name" {}
variable "nic_name"{}
// Add the following variable declarations:

variable "nsg_rule_name" {
  description = "The name of the NSG rule."
  type        = string
}

variable "nsg_priority" {
  description = "The priority of the NSG rule."
  type        = number
}

variable "nsg_direction" {
  description = "The direction of the NSG rule (Inbound/Outbound)."
  type        = string
}

variable "nsg_access" {
  description = "The access type of the NSG rule (Allow/Deny)."
  type        = string
}

variable "nsg_protocol" {
  description = "The protocol for the NSG rule (Tcp/Udp/All)."
  type        = string
}

variable "nsg_source_port_range" {
  description = "The source port range for the NSG rule."
  type        = string
}

variable "nsg_destination_port_range" {
  description = "The destination port range for the NSG rule."
  type        = string
}

variable "nsg_source_address_prefix" {
  description = "The source address prefix for the NSG rule."
  type        = string
}

variable "nsg_destination_address_prefix" {
  description = "The destination address prefix for the NSG rule."
  type        = string
}
variable "vm_name" {
  description = "The name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Virtual Machine"
  type        = string
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key"
  type        = string
}
