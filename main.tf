module "github_repos" {
    source = "./modules/default_repository"

    repository_name = "github_repos"
    default_branch  = "main"
}