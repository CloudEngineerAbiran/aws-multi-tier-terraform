provider "aws" {
  region                      = "us-east-1"  
  access_key                  = "test"   
  secret_key                  = "test"   
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3          = "http://localhost:4566"
    ec2         = "http://localhost:4566"
    rds         = "http://localhost:4566"
    sts         = "http://localhost:4566"
    iam         = "http://localhost:4566"
    autoscaling = "http://localhost:4566"
  }
}

