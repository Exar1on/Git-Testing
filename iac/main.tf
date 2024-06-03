provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "eu-central-1"
}

resource "aws_instance" "Debian" {
  ami = "ami-042e6fdb154c830c5"
  instance_type = "t2.micro"
}
