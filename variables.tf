variable "horizontal_pod_autoscaler_v1s" {
  description = <<EOT
Map of horizontal_pod_autoscaler_v1s, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
        - namespace (optional)
    - spec (block):
        - max_replicas (required)
        - min_replicas (optional)
        - scale_target_ref (required, block):
            - api_version (optional)
            - kind (required)
            - name (required)
        - target_cpu_utilization_percentage (optional)
EOT

  type = map(object({
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
      namespace     = optional(string)
    })
    spec = object({
      max_replicas = number
      min_replicas = optional(number)
      scale_target_ref = object({
        api_version = optional(string)
        kind        = string
        name        = string
      })
      target_cpu_utilization_percentage = optional(number)
    })
  }))
}

