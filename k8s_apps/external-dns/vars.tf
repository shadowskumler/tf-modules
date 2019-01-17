variable "repository" {
  description = "Helm repository that contains external-dns chart."
}

variable "namespace" {
  description = "Namespace to install external-dns in."
  default     = "ingress"
}
