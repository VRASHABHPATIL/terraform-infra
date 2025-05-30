resource "aws_s3_bucket" "my_s3_bucket"{
    bucket = "ittsecurestore"

    tags = {
    Name = "My bucket"
    Enviroment ="Dev"
}
}