data "template_file" "values" {
  template = "${file("${path.module}/letsencrypt-values.yaml")}"

  vars = {
    email          = "${var.email}"
    enable_staging = "${var.enable_staging}"
  }
}

resource "helm_release" "letsencrypt" {
  name       = "letsencrypt"
  chart      = "letsencrypt"
  repository = "${var.repository}"
  namespace  = "${var.namespace}"
  version    = "${var.version}"
}
