variable "maintainer" {
  type = string
  default     = "lewis"
  description = "tag pour le déploiement des ressources"
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


variable "instance_template" {
  type        = string
  description = "template pour le déploiement des instances"
}

variable "subnet_id" {
  type        = string
  default     = "NULL"
  description = "subnet à utiliser pour attacher la carte réseau primaire de l'instance"
}


