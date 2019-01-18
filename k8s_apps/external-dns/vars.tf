variable "repository" {
  description = "Helm repository that contains external-dns chart. Defaults to stable kubernetes charts repo."
  default     = "https://kubernetes-charts.storage.googleapis.com"
}

variable "namespace" {
  description = "Namespace to install external-dns in. Defaults to 'ingress'."
  default     = "ingress"
}

variable "version" {
  description = "Version of chart to deploy."
  default     = ""
}
