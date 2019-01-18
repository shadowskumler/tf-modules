resource "helm_release" "nginx-ingress" {
  name       = "nginx-ingress"
  chart      = "nginx-ingress"
  version    = "${var.version}"
  repository = "${var.repository}"
  namespace  = "${var.namespace}"
  values     = ["${file("${path.module}/nginx-ingress-values.yaml")}"]
}
