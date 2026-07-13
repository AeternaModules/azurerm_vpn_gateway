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
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateways : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateways : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateways : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateways : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateways : (
        v.routing_preference == null || (contains(["Microsoft Network", "Internet"], v.routing_preference))
      )
    ])
    error_message = "must be one of: Microsoft Network, Internet"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateways : (
        v.scale_unit == null || (v.scale_unit >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateways : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

