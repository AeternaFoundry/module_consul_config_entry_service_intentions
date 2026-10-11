variable "config_entry_service_intentions" {
  description = <<EOT
Map of config_entry_service_intentions, attributes below
Required:
    - name
Optional:
    - meta
    - namespace
    - partition
    - jwt (block):
        - providers (optional, block):
            - name (optional)
            - verify_claims (optional, block):
                - path (optional)
                - value (optional)
    - sources (block):
        - action (optional)
        - description (optional)
        - name (optional)
        - namespace (optional)
        - partition (optional)
        - peer (optional)
        - permissions (optional, block):
            - action (required)
            - http (required, block):
                - headers (optional, block):
                    - exact (optional)
                    - invert (optional)
                    - name (required)
                    - prefix (optional)
                    - present (optional)
                    - regex (optional)
                    - suffix (optional)
                - methods (optional)
                - path_exact (optional)
                - path_prefix (optional)
                - path_regex (optional)
        - precedence (optional)
        - sameness_group (optional)
        - type (optional)
EOT

  type = map(object({
    name      = string
    meta      = optional(map(string))
    namespace = optional(string)
    partition = optional(string)
    jwt = optional(list(object({
      providers = optional(list(object({
        name = optional(string)
        verify_claims = optional(list(object({
          path  = optional(list(string))
          value = optional(string)
        })))
      })))
    })))
    sources = optional(list(object({
      action      = optional(string)
      description = optional(string)
      name        = optional(string)
      namespace   = optional(string)
      partition   = optional(string)
      peer        = optional(string)
      permissions = optional(list(object({
        action = string
        http = list(object({
          headers = optional(list(object({
            exact   = optional(string)
            invert  = optional(bool)
            name    = string
            prefix  = optional(string)
            present = optional(bool)
            regex   = optional(string)
            suffix  = optional(string)
          })))
          methods     = optional(list(string))
          path_exact  = optional(string)
          path_prefix = optional(string)
          path_regex  = optional(string)
        }))
      })))
      precedence     = optional(number)
      sameness_group = optional(string)
      type           = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.config_entry_service_intentions : (
        v.sources == null || alltrue([for item in v.sources : (item.permissions == null || alltrue([for item in item.permissions : (length(item.http) >= 1)]))])
      )
    ])
    error_message = "Each http list must contain at least 1 items"
  }
}

