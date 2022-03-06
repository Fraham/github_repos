module "github_repos" {
    source = "./modules/default_repository"

    repository_name = "github_repos"
    default_branch  = "main"
}

module "terraform_module_s3_replication" {
    source = "./modules/default_repository"

    repository_name = "TerraformModule-S3Replication"
    default_branch  = "main"
}

module "terraform_module_s3_cross_region_cloudfront" {
    source = "./modules/default_repository"

    repository_name = "TerraformModule-S3CrossRegionCloudfront"
    default_branch  = "main"
}