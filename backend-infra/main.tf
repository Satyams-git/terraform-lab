resource "aws_s3_bucket" "tf_state_bucket" {
    bucket = "satyam-teraform-states-ap-south-1"
  
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.tf_state_bucket.id
    
    versioning_configuration {
        status = "Enabled"
    }
  
}
 resource "aws_s3_bucket_server_side_encryption_configuration" "encryption"{
    bucket = aws_s3_bucket.tf_state_bucket.bucket

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
   
 }

   resource "aws_dynamodb_table" "tf_lock" {
    name         = "tf-lock-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
   }