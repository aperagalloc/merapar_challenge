# Comment all the lines below if saving the tfsate into an AWS S3 bucket is NOT needed.

terraform {
  backend "s3" {
    bucket       = "merapar-terraform-states"
    key          = "merapar/code-challenge/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
