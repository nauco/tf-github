terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.ggtk
}
# Add a user to the organization


resource "github_repository" "example" {
  name        = "spacelift-example"
  description = "My awesome codebase"

  visibility = "public"
}

variable "ggtk" {
  type = string
}

output "repository_url" {
  value = github_repository.example.http_clone_url
}
