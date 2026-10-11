resource "consul_config_entry_service_intentions" "config_entry_service_intentions" {
  for_each = var.config_entry_service_intentions

  name      = each.value.name
  meta      = each.value.meta
  namespace = each.value.namespace
  partition = each.value.partition

  dynamic "jwt" {
    for_each = each.value.jwt != null ? each.value.jwt : []
    content {
      dynamic "providers" {
        for_each = jwt.value.providers != null ? jwt.value.providers : []
        content {
          name = providers.value.name
          dynamic "verify_claims" {
            for_each = providers.value.verify_claims != null ? providers.value.verify_claims : []
            content {
              path  = verify_claims.value.path
              value = verify_claims.value.value
            }
          }
        }
      }
    }
  }

  dynamic "sources" {
    for_each = each.value.sources != null ? each.value.sources : []
    content {
      action      = sources.value.action
      description = sources.value.description
      name        = sources.value.name
      namespace   = sources.value.namespace
      partition   = sources.value.partition
      peer        = sources.value.peer
      dynamic "permissions" {
        for_each = sources.value.permissions != null ? sources.value.permissions : []
        content {
          action = permissions.value.action
          dynamic "http" {
            for_each = permissions.value.http
            content {
              dynamic "headers" {
                for_each = http.value.headers != null ? http.value.headers : []
                content {
                  exact   = headers.value.exact
                  invert  = headers.value.invert
                  name    = headers.value.name
                  prefix  = headers.value.prefix
                  present = headers.value.present
                  regex   = headers.value.regex
                  suffix  = headers.value.suffix
                }
              }
              methods     = http.value.methods
              path_exact  = http.value.path_exact
              path_prefix = http.value.path_prefix
              path_regex  = http.value.path_regex
            }
          }
        }
      }
      precedence     = sources.value.precedence
      sameness_group = sources.value.sameness_group
      type           = sources.value.type
    }
  }
}

