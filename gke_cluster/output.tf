output "endpoint" {
  value = "${google_container_cluster.cluster.endpoint}"
}

output "username" {
  value = "${google_container_cluster.cluster.master_auth.0.username}"
}

output "password" {
  value = "${google_container_cluster.cluster.master_auth.0.password}"
}

output "client_certificate" {
  value = "${google_container_cluster.cluster.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.cluster.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.cluster.master_auth.0.cluster_ca_certificate}"
}

output "tiller-service-account" {
  value = "${kubernetes_service_account.tiller.metadata.0.name}"
}

output "service-account" {
  value = "${length(google_service_account.kubernetes.*.email) > 0 ? join("", google_service_account.kubernetes.*.email) : var.service_account}"
}
