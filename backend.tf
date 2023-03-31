terraform {
  backend "s3" {
    bucket = "terraform-backend-new-dev"
    key    = "dev-backend/backend"
    region = "us-east-1"
  }
}
