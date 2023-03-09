terraform {
  required_providers {
    aws ={
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.0, < 2.0"
}

module "s3" {

  source = "./s3_module"
  
}

