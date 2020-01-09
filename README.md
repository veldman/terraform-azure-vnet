# Azure VNET

Terraform module to create a new VNET in Azure. Optional features that can be added:

* Network Security Group
* DDos Protection

## Usage

This module expectec several input variables. Please find next a common usage example.

### Basic usage

The basic setup createas an address space, without NSG nor DDOS plan, and creates only a subnet

``` tf
name           = "test"
location       = "westeurope"
resource_group = "test_rg"
address_space  = ["10.0.0.0/16"]
dns_servers    = ["10.0.0.4", "10.0.0.5"]
nsg_enabled    = false
ddos_enabled   = false
subnets = [
  {
    name           = "subnet1"
    address_prefix = "10.0.1.0/16"
    security_group = false
  }
]
```

### Disable the VNET

It is possible to dynamically disable this module by changing the property ```enabled``` to ```false```. Please note that all mandatory fields should fulfilled anyway.

``` tf
name           = "test"
location       = "westeurope"
enabled        = false
resource_group = "test_rg"
address_space  = ["10.0.0.0/16"]
dns_servers    = ["10.0.0.4", "10.0.0.5"]
nsg_enabled    = false
ddos_enabled   = false
subnets = [
  {
    name           = "subnet1"
    address_prefix = "10.0.1.0/16"
    security_group = false
  }
]
```

### Network Security Group

This example cretes a Network Security Group and three VNETs. The NSG is pluged into subnet1 only. Subnets 2 and 3 do not have NSG.

```tf
name           = "test"
location       = "westeurope"
resource_group = "test_rg"
address_space  = ["10.0.0.0/16"]
dns_servers    = ["10.0.0.4", "10.0.0.5"]
nsg_enabled    = true
ddos_enabled   = false
subnets = [
  {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
    security_group = true
  },
  {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = false
  },
  {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
    security_group = false
  }
]
```

### DDos Plan

This example adds a DDos Plan to the VNET. No NSG is created

```tf
name           = "test"
location       = "westeurope"
resource_group = "test_rg"
address_space  = ["10.0.0.0/16"]
dns_servers    = ["10.0.0.4", "10.0.0.5"]
nsg_enabled    = false
ddos_enabled   = true
subnets = [
  {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
    security_group = false
  },
  {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = false
  },
  {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
    security_group = false
  }
]
```

### VNET with DDos and NSG

This example creates a VNET with DDos Plan and NSG, and three subnets. subnet1 has an NSG associated. subnet2 and subnet3 don't.

```tf
name           = "test"
location       = "westeurope"
resource_group = "test_rg"
address_space  = ["10.0.0.0/16"]
dns_servers    = ["10.0.0.4", "10.0.0.5"]
nsg_enabled    = true
ddos_enabled   = true
subnets = [
  {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
    security_group = true
  },
  {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = false
  },
  {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
    security_group = false
  }
]
```
