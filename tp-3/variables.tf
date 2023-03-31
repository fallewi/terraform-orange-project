variable "instance_template" {
  type        = string
  default     = "g1.small"
  description = "permet de fournir un template à l'instance"
}


variable "region" {
  type        = string
  default     = "us-central1"
  description = "région de déploiement de mes ressources"
}

variable "zone" {
  type        = string
  default     = "us-central1-c"
  description = "zone de déploiement de mes ressources"
}

