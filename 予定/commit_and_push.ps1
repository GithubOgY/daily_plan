# Commit and Push Script
# Usage: .\commit_and_push.ps1 "commit message"

param(
    [Parameter(Mandatory=$false)]
    [string]$CommitMessage = "Update schedule files"
)

Write-Host "=== Commit and Push ===" -ForegroundColor Cyan

# 1. Check status
Write-Host "`n[1/4] Checking changes..." -ForegroundColor Yellow
$status = git status --short
if ($status) {
    Write-Host "Changed files:" -ForegroundColor Green
    git status --short
} else {
    Write-Host "No changes to commit." -ForegroundColor Yellow
    exit 0
}

# 2. Stage all changes
Write-Host "`n[2/4] Staging changes..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Staging failed." -ForegroundColor Red
    exit 1
}
Write-Host "Staging completed" -ForegroundColor Green

# 3. Commit
Write-Host "`n[3/4] Committing..." -ForegroundColor Yellow
git commit -m $CommitMessage
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Commit failed." -ForegroundColor Red
    exit 1
}
Write-Host "Commit completed: $CommitMessage" -ForegroundColor Green

# 4. Push to daily_plan
Write-Host "`n[4/4] Pushing to daily_plan repository..." -ForegroundColor Yellow
git push daily_plan main
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Push failed." -ForegroundColor Red
    exit 1
}
Write-Host "Push completed" -ForegroundColor Green

Write-Host "`n=== Done ===" -ForegroundColor Cyan
Write-Host "All changes have been pushed to daily_plan repository." -ForegroundColor Green
