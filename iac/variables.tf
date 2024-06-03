variable "access_key" {
  type = string
  description = "AWS IAM access key"
  sensitive = "true"
}

variable "secret_key"{
  type = string
  description = "AWS IAM secret key"
  sensitive = "true"
}