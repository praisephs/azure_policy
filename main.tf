
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

data "azurerm_subscription" "current" {}


// Built in Policies for Sanbdbox
data "azurerm_policy_definition_built_in" "policy" {
  for_each     = var.policy
  display_name = each.value
}

resource "azurerm_resource_group_policy_assignment" "policy_assignmt" {
  for_each             = var.policy
  name                 = each.key 
  resource_group_id    = data.azurerm_resource_group.this.id
  policy_definition_id = data.azurerm_policy_definition_built_in.policy[each.key].id
}

// Built in Initiatives for Sanbox 
data "azurerm_policy_set_definition" "policy_initiative" {
  for_each     = var.policy_initiative
  display_name = each.value
}

resource "azurerm_resource_group_policy_assignment" "initiative_assignmt" {
  for_each             = var.policy_initiative
  name                 = each.key 
  resource_group_id    = data.azurerm_resource_group.this.id
  policy_definition_id = data.azurerm_policy_set_definition.policy_initiative[each.key].id
}

