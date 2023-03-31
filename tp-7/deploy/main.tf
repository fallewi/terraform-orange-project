module "network" {
  source = "../modules/network"
}

module "firewall" {
  source = "../modules/firewall"
  vpc_id = module.network.output_vpc_id
}

module "instance" {
  source            = "../modules/instance"
  subnet_id         = module.network.output_subnet_id
  instance_template = lookup(var.instance_template, terraform.workspace)
}





