include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/cluster.hcl"
}

inputs = {
  cidr               = "10.0.0.0/16"
  private_subnets    = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  public_subnets     = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]

  cluster_version = "1.21"

  instance_type        = "t3a.small"
  asg_desired_capacity = 2
  asg_max_size         = 2
}