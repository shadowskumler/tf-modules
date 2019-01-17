variable "name" {
  description = "Name of cluster. Must be unique within your Google Cloud Project."
  type        = "string"
}

variable "zone" {
  description = "Primary zone for cluster."
  type        = "string"
}

variable "additional_zones" {
  description = "Additional zones to provision cluster nodes in."
  type        = "list"
  default     = []
}

variable "service_account" {
  description = "Service account to use for Kubernetes cluster."
  type        = "string"
}

variable "preempt_autoscaling_min" {
  description = "Minimum number of nodes in preemptible node pool. Default = 0."
  default     = 0
}

variable "preempt_autoscaling_max" {
  description = "Maximum number of nodes to scale preemptible node pool up to. Default = 10."
  default     = 10
}

variable "preempt_machine_type" {
  description = "Machine type for nodes in preemptible node pool. Default = n1-standard-1."
  default     = "n1-standard-1"
}

variable "non_preempt_machine_type" {
  description = "Machine type for non-preemptible nodes in default node pool. Default = n1-standard-1."
}
