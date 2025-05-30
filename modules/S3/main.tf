resource "aws_s3_bucket" "my_s3_bucket"{
    bucket = "secure_store"

    tags = {
    Name = "My bucket"
    Enviroment ="Dev"
}
}