terraform {
 backend "s3" {
 encrypt = true
 bucket = "pipeline003"
 region = "eu-west-1"
 key = "pipelineAscode/terraform.tfstate"
 }
}
