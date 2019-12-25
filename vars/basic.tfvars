name           = "test"
location       = "westeu"
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