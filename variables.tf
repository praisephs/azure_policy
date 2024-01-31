variable "resource_group_name" {
  type = string
}

variable "policy" {
  type        = map(string)
  description = "Built in Policy definitions to be assigned"
}

variable "policy_initiative" {
  type        = map(string)
  description = "Built in Policy Initiatives to be assigned"
}

variable "mgt_group_name" {
  type        = string
  description = "Name for the Management group"
}