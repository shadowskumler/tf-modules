resource "helm_release" "external-dns" {
  name       = "external-dns"
  chart      = "external-dns"
  repository = "${var.repository}"
  namespace  = "${var.namespace}"
  version    = "${var.version}"
  values     = ["${file("${path.module}/external-dns-values.yaml")}"]
}
