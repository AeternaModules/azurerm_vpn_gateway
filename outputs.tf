output "vpn_gateways" {
  description = "All vpn_gateway resources"
  value       = azurerm_vpn_gateway.vpn_gateways
}
output "vpn_gateways_bgp_route_translation_for_nat_enabled" {
  description = "List of bgp_route_translation_for_nat_enabled values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.bgp_route_translation_for_nat_enabled]
}
output "vpn_gateways_bgp_settings" {
  description = "List of bgp_settings values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.bgp_settings]
}
output "vpn_gateways_ip_configuration" {
  description = "List of ip_configuration values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.ip_configuration]
}
output "vpn_gateways_location" {
  description = "List of location values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.location]
}
output "vpn_gateways_name" {
  description = "List of name values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.name]
}
output "vpn_gateways_resource_group_name" {
  description = "List of resource_group_name values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.resource_group_name]
}
output "vpn_gateways_routing_preference" {
  description = "List of routing_preference values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.routing_preference]
}
output "vpn_gateways_scale_unit" {
  description = "List of scale_unit values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.scale_unit]
}
output "vpn_gateways_tags" {
  description = "List of tags values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.tags]
}
output "vpn_gateways_virtual_hub_id" {
  description = "List of virtual_hub_id values across all vpn_gateways"
  value       = [for k, v in azurerm_vpn_gateway.vpn_gateways : v.virtual_hub_id]
}

