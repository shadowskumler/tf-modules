variable "repository" {
  description = "Helm repository that contains letsencrypt chart. Defaults to shadowskumler charts repo."
  default     = "https://shadowskumler.github.io/charts"
}

variable "namespace" {
  description = "Namespace to install cert-manager in. Defaults to 'ingress'."
  default     = "ingress"
}

variable "version" {
  description = "Version of chart to deploy. Defaults to latest."
  default     = ""
}

variable "email" {
  description = "Email address to use for letsencrypt issuers."
  type        = "string"
}

variable "enable_staging" {
  description = "Whether or not to enable letsencrypt staging issuer. Must be a string with value 'true' or 'false'. Don't use boolean."
  default     = "false"
}
