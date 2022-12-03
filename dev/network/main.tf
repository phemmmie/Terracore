terraform {
  backend "s3" {
    bucket         = "terraform-state-aws-es-devops"
    dynamodb_table = "terraform-state-aws-es-devops"
    encrypt        = true
    key            = "dev-network.tfstate"
    region         = "eu-central-1"
  }
}

provider "aws" {
  allowed_account_ids = [var.account_id]
  region              = var.region
}

module "network" {
  source = "../../modules/network"

  account_id = var.account_id
  env        = var.env
  project    = var.project
  region     = var.region

  az_num              = 3
  vpc_ip_block        = "172.27.72.0/22"
  subnet_cidr_private = "172.27.72.0/24"
  subnet_cidr_public  = "172.27.73.0/24"
  new_bits_private    = 2
  new_bits_public     = 2
  natgw_count         = "one"

  management_ips = {
    "x.x.x.x/32" = "VPN",
  }

  app_direct_access = {
    "vpn" = {
      "x.x.x.x/32" = "VPN",
    }
  }
}
