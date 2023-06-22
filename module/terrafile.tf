module "module_homologation" {
  source                           = "../homologation"
  region                           = "us-east-1"
  cluster-name                     = "poc-atlantis"
  cluster_endpoint_private_access  = true
  cluster_endpoint_public_access   = true
  availability-zones               = ["us-east-1a", "us-east-1b"]
  k8s-version                      = "1.25"
  node-name                        = "poc-atlantis"
  node-instance-type               = "t3.small"
  root-block-size                  = "20"
  min-size                         = 1
  desired-capacity                 = 1
  max-size                         = 2


    # Atlantis
  atlantis_github_app_id     = "1234567"
  atlantis_github_app_key    = "-----BEGIN RSA PRIVATE KEY-----(...)"
  atlantis_repo_allowlist    = ["github.com/terraform-aws-modules/*"]

}