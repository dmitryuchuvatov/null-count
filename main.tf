terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

provider "null" {}

resource "null_resource" "test" {
  count = 2

  provisioner "local-exec" {
    command = "echo 'Test ${count.index}'"
  }
}
