terraform {
 required_providers {
 local = {
 source = "hashicorp/local"
 version = "~> 2.0"
 }
 }
}
provider "local" {}
resource "local_file" "example" {
 content = var.file_content
 filename = "${path.module}/${var.file_name}"
}
