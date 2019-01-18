variable "repository" {
  description = "Helm repository that contains cert-manager chart. Defaults to stable kubernetes charts repo."
  default     = "https://kubernetes-charts.storage.googleapis.com"
}

variable "namespace" {
  description = "Namespace to install cert-manager in. Defaults to 'ingress'."
  default     = "ingress"
}

variable "version" {
  description = "Version of chart to deploy. Defaults to latest."
  default     = ""
}
