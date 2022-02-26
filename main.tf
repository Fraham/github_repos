module "github_repos" {
    source = "./modules/default_repository"

    repository_name = "github_repos"
    default_branch  = "main"
}

moved {
    from = github_repository.github_repos
    to   = module.github_repos.github_repository.repository
}

moved {
    from = github_branch.main
    to   = module.github_repos.github_branch.default_branch
}

moved {
    from = github_branch_default.default
    to   = module.github_repos.github_branch_default.default_branch
}

moved {
    from = github_branch_protection.main
    to   = module.github_repos.github_branch_protection.default_branch_protection
}
