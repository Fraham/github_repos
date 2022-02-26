[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $RepositoryName,

    [Parameter()]
    [string]
    $ModuleName,

    [Parameter()]
    [string]
    $DefaultBranch = "main"
)

if ($PSScriptRoot -eq (Get-Location).Path) {
    Write-Host "This script should be ran from the terraform folder"
    return
}

terraform init | Out-Null

if (!$?){
    Write-Host "terraform init failed"
    return
}

$resourcesInState = @(terraform state list)

if (!($resourcesInState -icontains "module.$($ModuleName).github_repository.repository")){
    Write-Host "Need to import repository"

    terraform import "module.$($ModuleName).github_repository.repository" "$($RepositoryName)"
}

if (!($resourcesInState -icontains "module.$($ModuleName).github_branch.default_branch")){
    Write-Host "Need to import branch"

    terraform import "module.$($ModuleName).github_branch.default_branch" "$($RepositoryName):$($DefaultBranch)"
}

if (!($resourcesInState -icontains "module.$($ModuleName).github_branch_default.default_branch")){
    Write-Host "Need to import default branch"

    terraform import "module.$($ModuleName).github_branch_default.default_branch" "$($RepositoryName)"
}

if (!($resourcesInState -icontains "module.$($ModuleName).github_branch_protection.default_branch_protection")){
    Write-Host "Need to import default branch protection"

    terraform import "module.$($ModuleName).github_branch_protection.default_branch_protection" "$($RepositoryName):$($DefaultBranch)"
}