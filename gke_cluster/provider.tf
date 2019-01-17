provider "kubernetes" {
  host                   = "${google_container_cluster.cluster.endpoint}"
  username               = "${google_container_cluster.cluster.master_auth.0.username}"
  password               = "${google_container_cluster.cluster.master_auth.0.password}"
  client_certificate     = "${base64decode(google_container_cluster.cluster.master_auth.0.client_certificate)}"
  client_key             = "${base64decode(google_container_cluster.cluster.master_auth.0.client_key)}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.cluster.master_auth.0.cluster_ca_certificate)}"
}

provider "helm" {
  kubernetes {
    host                   = "${google_container_cluster.cluster.endpoint}"
    username               = "${google_container_cluster.cluster.master_auth.0.username}"
    password               = "${google_container_cluster.cluster.master_auth.0.password}"
    client_certificate     = "${base64decode(google_container_cluster.cluster.master_auth.0.client_certificate)}"
    client_key             = "${base64decode(google_container_cluster.cluster.master_auth.0.client_key)}"
    cluster_ca_certificate = "${base64decode(google_container_cluster.cluster.master_auth.0.cluster_ca_certificate)}"
  }

  install_tiller  = true
  namespace       = "kube-system"
  service_account = "${kubernetes_service_account.tiller.metadata.0.name}"
}
