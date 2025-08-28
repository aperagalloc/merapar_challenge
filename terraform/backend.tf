terraform {
  backend "s3" {
    bucket       = "merapar-terraform-states"
    key          = "merapar/code-challenge/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
