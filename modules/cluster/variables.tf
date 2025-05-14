variable "cluster" {
  description = "contains the cluster configuration"
  type        = map(any)
}

variable "location" {
  description = "contains the region"
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "contains the resourcegroup name"
  type        = string
  default     = null
}
