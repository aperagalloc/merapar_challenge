terraform {
  backend "s3" {
    bucket         = "terraform-states"
    key            = "merapar/code-challenge/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
