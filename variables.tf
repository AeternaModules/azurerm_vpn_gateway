variable "vpn_gateways" {
  description = <<EOT
Map of vpn_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
    - virtual_hub_id
Optional:
    - bgp_route_translation_for_nat_enabled
    - routing_preference
    - scale_unit
    - tags
    - bgp_settings (block):
        - asn (required)
        - instance_0_bgp_peering_address (optional, block):
            - custom_ips (required)
        - instance_1_bgp_peering_address (optional, block):
            - custom_ips (required)
        - peer_weight (required)
EOT

  type = map(object({
    location                              = string
    name                                  = string
    resource_group_name                   = string
    virtual_hub_id                        = string
    bgp_route_translation_for_nat_enabled = optional(bool, false)
    routing_preference                    = optional(string, "Microsoft Network")
    scale_unit                            = optional(number, 1)
    tags                                  = optional(map(string))
    bgp_settings = optional(object({
      asn = number
      instance_0_bgp_peering_address = optional(object({
        custom_ips = set(string)
      }))
      instance_1_bgp_peering_address = optional(object({
        custom_ips = set(string)
      }))
      peer_weight = number
    }))
  }))
}

