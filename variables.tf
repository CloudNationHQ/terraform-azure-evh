variable "namespace" {
  description = "Contains all eventhub configuration"
  type = object({
    name                          = string
    resource_group_name           = optional(string)
    location                      = optional(string)
    sku                           = optional(string, "Standard")
    capacity                      = optional(number, 1)
    minimum_tls_version           = optional(string, "1.2")
    auto_inflate_enabled          = optional(bool, false)
    dedicated_cluster_id          = optional(string)
    maximum_throughput_units      = optional(number)
    network_rulesets              = optional(list(any), [])
    local_authentication_enabled  = optional(bool, false)
    public_network_access_enabled = optional(bool, true)
    tags                          = optional(map(string))
    identity = optional(object({
      type         = optional(string, "SystemAssigned")
      identity_ids = optional(list(string))
    }), null)
    schema_groups = optional(map(object({
      name                 = optional(string)
      schema_type          = optional(string, "Avro")
      schema_compatibility = optional(string, "Forward")
    })), {})
    authorization_rules = optional(map(object({
      name   = optional(string)
      listen = optional(bool, false)
      send   = optional(bool, false)
      manage = optional(bool, false)
    })), {})
    eventhubs = optional(map(object({
      name              = optional(string)
      partition_count   = optional(number, 2)
      message_retention = optional(number, 1)
      status            = optional(string, "Active")
      capture_description = optional(object({
        enabled             = bool
        encoding            = string
        interval_in_seconds = optional(number, 300)
        size_limit_in_bytes = optional(number, 314572800)
        skip_empty_archives = optional(bool, false)
        destination = object({
          archive_name_format = string
          blob_container_name = string
          storage_account_id  = string
        })
      }), null)
      authorization_rules = optional(map(object({
        name   = optional(string)
        listen = optional(bool, false)
        send   = optional(bool, false)
        manage = optional(bool, false)
      })), {})
      consumer_groups = optional(map(object({
        name          = optional(string)
        user_metadata = optional(string)
      })), {})
    })), {})
  })

  validation {
    condition     = var.namespace.location != null || var.location != null
    error_message = "location must be provided either in the config object or as a separate variable."
  }

  validation {
    condition     = var.namespace.resource_group_name != null || var.resource_group_name != null
    error_message = "resource group name must be provided either in the config object or as a separate variable."
  }

}

variable "naming" {
  description = "contains naming convention"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "default resource group to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
