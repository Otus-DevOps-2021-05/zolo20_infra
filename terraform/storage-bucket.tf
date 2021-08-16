terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "bucket-ars"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "atin79z1u3Qa6lappa9b"
    secret_key = "xKyEX1S_PmFhpZMklHaCwfFhP23QHkYXQNTAwZu8"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
