resource "google_container_cluster" "cluster" {
  name               = "${var.name}"
  zone               = "${var.zone}"
  additional_zones   = ["${var.additional_zones}"]
  initial_node_count = 1

  node_config {
    machine_type    = "${var.non_preempt_machine_type}"
    service_account = "${var.service_account}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
    ]
  }

  ip_allocation_policy {
    create_subnetwork = true
  }
}

resource "google_container_node_pool" "preempt" {
  name    = "preempt"
  cluster = "${google_container_cluster.cluster.id}"
  zone    = "${var.zone}"

  autoscaling {
    min_node_count = "${var.preempt_autoscaling_min}"
    max_node_count = "${var.preempt_autoscaling_max}"
  }

  node_config {
    machine_type    = "${var.preempt_machine_type}"
    service_account = "${var.service_account}"
    preemptible     = true

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
    ]
  }
}

resource "kubernetes_service_account" "tiller" {
  metadata {
    name      = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = "tiller"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "tiller"
    namespace = "kube-system"
    api_group = ""
  }
}
