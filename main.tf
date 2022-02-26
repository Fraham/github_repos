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
