module "network" {
  source = "../modules/netwok"
    }

module "firewall" {
  source = "../modules/firewall"
  vpc_id = module.network.output_vpc_id
      }

module "instance" {
  source = "../modules/instance"
    vpc_id = module.network.output_subnet_id
          }




    
