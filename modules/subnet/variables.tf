variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "rg_name" {
  description = "Resource Group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "address_prefixes" {
  description = "Subnet CIDR ranges"
  type        = list(string)
}
