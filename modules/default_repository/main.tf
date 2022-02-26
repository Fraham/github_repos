#tfsec:ignore:github-repositories-private
resource "github_repository" "repository" {
  name = var.repository_name

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_branch" "default_branch" {
  repository = github_repository.repository.name
  branch     = var.default_branch
}

resource "github_branch_default" "default_branch" {
  repository = github_repository.repository.name
  branch     = github_branch.default_branch.branch
}

resource "github_branch_protection" "default_branch_protection" {
  repository_id = github_repository.repository.name
  pattern       = github_branch.default_branch.branch

  enforce_admins = false

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}
