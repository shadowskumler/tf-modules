resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  chart      = "cert-manager"
  repository = "${var.repository}"
  namespace  = "${var.namespace}"
  version    = "${var.version}"
}
