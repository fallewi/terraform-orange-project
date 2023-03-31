variable "vpc_id" {
  type        = string
  default     = "NULL"
  description = "ceci est le vpc à utiliser pour le déploiement des ressources"
}


variable "maintainer" {
  type        = string
  default     = "lewis"
  description = "ceci est le nom pour le tag des ressources"
}

