variable "instance_template" {
  type = map(any)
  default = {
    default = "f1-micro"
    dev     = "f1-micro"
    prod    = "g1-small"
  }
  description = " template pour les environnements"
}



