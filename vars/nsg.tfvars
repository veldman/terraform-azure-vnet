name           = "test"
location       = "westeu"
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

