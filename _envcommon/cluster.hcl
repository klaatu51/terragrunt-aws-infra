terraform {
  source = "${local.source_base_url}?ref=v0.2.1"
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  env = local.env_vars.locals.env
  
  source_base_url = "git::git@github.com:klaatu51/terraform-aws-eks.git"
}

inputs = {
  cidr               = "10.0.0.0/16"
  private_subnets    = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  public_subnets     = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]

  cluster_version = "1.21"

  instance_type        = "t3a.small"
  asg_desired_capacity = 1
  asg_max_size         = 1

  map_users = [
    {
      userarn = "arn:aws:iam::145157870759:user/liam.mctague"
      username = "liam.mctague"
      groups   = [
        "system:masters"
      ]
    }
  ]
}