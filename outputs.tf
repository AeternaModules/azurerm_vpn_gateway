output "vpn_gateways_bgp_route_translation_for_nat_enabled" {
  description = "Map of bgp_route_translation_for_nat_enabled values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.bgp_route_translation_for_nat_enabled }
}
output "vpn_gateways_bgp_settings" {
  description = "Map of bgp_settings values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.bgp_settings }
}
output "vpn_gateways_ip_configuration" {
  description = "Map of ip_configuration values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.ip_configuration }
}
output "vpn_gateways_location" {
  description = "Map of location values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.location }
}
output "vpn_gateways_name" {
  description = "Map of name values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.name }
}
output "vpn_gateways_resource_group_name" {
  description = "Map of resource_group_name values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.resource_group_name }
}
output "vpn_gateways_routing_preference" {
  description = "Map of routing_preference values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.routing_preference }
}
output "vpn_gateways_scale_unit" {
  description = "Map of scale_unit values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.scale_unit }
}
output "vpn_gateways_tags" {
  description = "Map of tags values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.tags }
}
output "vpn_gateways_virtual_hub_id" {
  description = "Map of virtual_hub_id values across all vpn_gateways, keyed the same as var.vpn_gateways"
  value       = { for k, v in azurerm_vpn_gateway.vpn_gateways : k => v.virtual_hub_id }
}

