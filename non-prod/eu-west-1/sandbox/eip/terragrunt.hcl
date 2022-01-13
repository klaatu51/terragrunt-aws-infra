include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/eip.hcl"
}

inputs = {
  eips = {
    eks-sandbox-default-gateway-2 = {
      name = "eks-sandbox-default-gateway-1"
      vpc  = true
    }
    eks-sandbox-default-gateway-2 = {
      name = "eks-sandbox-default-gateway-2"
      vpc  = true
    }
    eks-sandbox-default-gateway-3 = {
      name = "eks-sandbox-default-gateway-3"
      vpc  = true
    }
  }
}
