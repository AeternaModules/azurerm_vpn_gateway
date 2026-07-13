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
    bgp_route_translation_for_nat_enabled = optional(bool)
    routing_preference                    = optional(string)
    scale_unit                            = optional(number)
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
  # --- Unconfirmed validation candidates, derived from azurerm_vpn_gateway's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: virtual_hub_id
  #   source:    [from virtualwans.ValidateVirtualHubID] !ok
  # path: virtual_hub_id
  #   source:    [from virtualwans.ValidateVirtualHubID] err != nil
  # path: routing_preference
  #   condition: contains(["Microsoft Network", "Internet"], value)
  #   message:   must be one of: Microsoft Network, Internet
  # path: bgp_settings.instance_0_bgp_peering_address.custom_ips[*]
  #   source:    [from commonValidate.IPv4Address] !ok
  # path: bgp_settings.instance_0_bgp_peering_address.custom_ips[*]
  #   source:    [from commonValidate.IPv4Address] four == nil
  # path: bgp_settings.instance_1_bgp_peering_address.custom_ips[*]
  #   source:    [from commonValidate.IPv4Address] !ok
  # path: bgp_settings.instance_1_bgp_peering_address.custom_ips[*]
  #   source:    [from commonValidate.IPv4Address] four == nil
  # path: scale_unit
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

