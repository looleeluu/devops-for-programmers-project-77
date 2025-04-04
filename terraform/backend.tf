terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ilyuha-corporation"

    workspaces {
      name = "devops-course"
    }
  }
}