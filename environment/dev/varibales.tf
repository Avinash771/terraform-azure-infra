variable "location" {}
variable "rg_name" {}
variable "vnet_name" {}
variable "vnet_address_space" {
  type = list(string)
}
variable "subnet_name" {}
variable "subnet_prefix" {
  type = list(string)
}
variable "nsg_name" {}
variable "vm_name" {}
variable "ssh_public_key" {}
variable "subnet_id" {}
variable "nsg_id" {}
