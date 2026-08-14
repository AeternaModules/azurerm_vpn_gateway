output "vpn_gateways_id" {
  description = "Map of id values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vpn_gateways_bgp_route_translation_for_nat_enabled" {
  description = "Map of bgp_route_translation_for_nat_enabled values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.bgp_route_translation_for_nat_enabled if v.bgp_route_translation_for_nat_enabled != null }
}
output "vpn_gateways_bgp_settings" {
  description = "Map of bgp_settings values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => one(v.bgp_settings) if v.bgp_settings != null && length(v.bgp_settings) > 0 }
}
output "vpn_gateways_ip_configuration" {
  description = "Map of ip_configuration values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.ip_configuration if v.ip_configuration != null && length(v.ip_configuration) > 0 }
}
output "vpn_gateways_location" {
  description = "Map of location values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.location if v.location != null && length(v.location) > 0 }
}
output "vpn_gateways_name" {
  description = "Map of name values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.name if v.name != null && length(v.name) > 0 }
}
output "vpn_gateways_resource_group_name" {
  description = "Map of resource_group_name values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "vpn_gateways_routing_preference" {
  description = "Map of routing_preference values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.routing_preference if v.routing_preference != null && length(v.routing_preference) > 0 }
}
output "vpn_gateways_scale_unit" {
  description = "Map of scale_unit values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.scale_unit if v.scale_unit != null }
}
output "vpn_gateways_tags" {
  description = "Map of tags values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "vpn_gateways_virtual_hub_id" {
  description = "Map of virtual_hub_id values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.virtual_hub_id if v.virtual_hub_id != null && length(v.virtual_hub_id) > 0 }
}

