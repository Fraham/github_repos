resource "github_repository" "github_repos" {
  name = "github_repos"
}

resource "github_branch" "main" {
  repository = github_repository.github_repos.name
  branch     = "main"
}

resource "github_branch_default" "default" {
  repository = github_repository.github_repos.name
  branch     = github_branch.main.branch
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.github_repos.name
  pattern       = github_branch.main.branch

  enforce_admins = true

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}
