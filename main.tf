resource "kubernetes_horizontal_pod_autoscaler_v1" "horizontal_pod_autoscaler_v1s" {
  for_each = var.horizontal_pod_autoscaler_v1s


  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
    namespace     = each.value.metadata.namespace
  }

  spec {
    max_replicas = each.value.spec.max_replicas
    min_replicas = each.value.spec.min_replicas
    scale_target_ref {
      api_version = each.value.spec.scale_target_ref.api_version
      kind        = each.value.spec.scale_target_ref.kind
      name        = each.value.spec.scale_target_ref.name
    }
    target_cpu_utilization_percentage = each.value.spec.target_cpu_utilization_percentage
  }
}

