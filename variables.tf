variable name {
  type        = string
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}

variable location {
  type        = string
  description = "(Required) The location where the resource group should be created. For a list of all Azure locations, please consult this link or run az account list-locations --output table."
}

variable resource_group {
  type        = string
  description = "(Required) The name of the resource group in which to create the virtual network."
}

variable address_space {
  type        = list(string)
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = ["10.0.0.0/16"]
}

variable dns_servers {
  type        = list(string)
  description = "(Optional) List of DNS Servers configured in the VNET"
  default     = null
}

variable ddos_enabled {
  type        = bool
  description = "(Optional) Adds a DDOS protection to the VNET. False by default"
  default     = false
}

variable nsg_enabled {
  type        = bool
  description = "(Optional) Adds NSG to the VNET."
  default     = false
}

variable subnets {
  type = list(object({
    name           = string,
    address_prefix = string,
    security_group = bool
  }))
  description = "(Optional) Creates the given subnets in the VNET"
  default     = []
}

variable app {
  type        = string
  description = "(Optional) Adds a tag with the application name this resource group belogs to."
  default     = ""
}

variable environment {
  type        = string
  description = "(Optional) Environment name. If not specified, this module will use workspace as default value"
  default     = "default"
}

variable creator {
  type        = string
  description = "(Optional) Adds a tag indicating the creator of this resource"
  default     = "cloudcommons"
}
