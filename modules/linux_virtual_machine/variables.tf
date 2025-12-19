variable "location" {
  default = "centralindia"
}

variable "resource_group_name" {
  default = "dev-rg"
}

variable "subnet_id" {
  description = "Subnet ID where NIC will be attached"
}
