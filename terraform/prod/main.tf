provider "yandex" {
  version                  = "0.35"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "vpc" {
  source = "../modules/vpc"
}
module "app" {
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  subnet_id        = module.vpc.vpc_subnet_id
  image_id         = var.image_id
  private_key_path = var.private_key_path
}
module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = module.vpc.vpc_subnet_id
}
