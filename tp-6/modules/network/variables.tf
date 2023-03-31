variable "maintainer" {
  type        = string
  default     = "lewis"
  description = " ceci est le nom pour le tag des ressources"
}


variable "cidr_range" {
  type        = string
  default     = "10.1.0.0/24"
  description = " ceci est le cidr du subnet"
}

