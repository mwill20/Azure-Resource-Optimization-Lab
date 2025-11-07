# Azure Resource Optimization Lab - GitHub Setup Script
# Run this script to initialize and push your repository to GitHub

Write-Host "🚀 Azure Resource Optimization Lab - GitHub Setup" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
try {
    $gitVersion = git --version
    Write-Host "✅ Git detected: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git is not installed. Please install Git and try again." -ForegroundColor Red
    Write-Host "Download from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

# Navigate to repository directory
$repoPath = "c:\Users\20mdw\azure-resource-optimization-lab"
Set-Location $repoPath
Write-Host "📂 Current directory: $repoPath" -ForegroundColor Yellow
Write-Host ""

# Initialize git repository
Write-Host "🔧 Initializing Git repository..." -ForegroundColor Cyan
git init
git add .
git commit -m "Initial commit: Azure Resource Optimization Lab with complete documentation"

Write-Host "✅ Local repository initialized and committed" -ForegroundColor Green
Write-Host ""

# Prompt for GitHub username
Write-Host "📝 GitHub Setup" -ForegroundColor Cyan
Write-Host "===============" -ForegroundColor Cyan
$githubUsername = Read-Host "Enter your GitHub username"

# Check if GitHub CLI is available
$hasGhCli = $false
try {
    $ghVersion = gh --version
    $hasGhCli = $true
    Write-Host "✅ GitHub CLI detected: $ghVersion" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "⚠️  GitHub CLI not detected" -ForegroundColor Yellow
    Write-Host ""
}

if ($hasGhCli) {
    # Using GitHub CLI
    Write-Host "🎯 Creating repository with GitHub CLI..." -ForegroundColor Cyan
    
    $repoDescription = "End-to-end Azure Resource Optimization Lab — ARM-based VM deployment with tagging, governance policies, and Azure Monitor alerts. Demonstrates cloud architecture, cost optimization, and observability."
    
    gh repo create azure-resource-optimization-lab `
        --public `
        --description $repoDescription `
        --source=. `
        --remote=origin `
        --push
    
    Write-Host "✅ Repository created and pushed" -ForegroundColor Green
    Write-Host ""
    
    # Add topics
    Write-Host "🏷️  Adding topics..." -ForegroundColor Cyan
    gh repo edit --add-topic azure,cloud-architecture,infrastructure-as-code,arm-template,azure-monitor,governance,cost-optimization,devops,portfolio-project
    
    Write-Host "✅ Topics added successfully" -ForegroundColor Green
    Write-Host ""
    
} else {
    # Manual setup instructions
    Write-Host "📋 Manual Setup Required" -ForegroundColor Yellow
    Write-Host "========================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please follow these steps:" -ForegroundColor White
    Write-Host ""
    Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
    Write-Host "2. Repository name: azure-resource-optimization-lab" -ForegroundColor White
    Write-Host "3. Description:" -ForegroundColor White
    Write-Host "   End-to-end Azure Resource Optimization Lab — ARM-based VM deployment with" -ForegroundColor Gray
    Write-Host "   tagging, governance policies, and Azure Monitor alerts. Demonstrates cloud" -ForegroundColor Gray
    Write-Host "   architecture, cost optimization, and observability." -ForegroundColor Gray
    Write-Host "4. Select: Public" -ForegroundColor White
    Write-Host "5. DO NOT initialize with README, license, or .gitignore" -ForegroundColor White
    Write-Host "6. Click 'Create repository'" -ForegroundColor White
    Write-Host ""
    
    Read-Host "Press Enter after you've created the repository on GitHub"
    
    # Add remote and push
    Write-Host ""
    Write-Host "🔗 Connecting to GitHub..." -ForegroundColor Cyan
    $repoUrl = "https://github.com/$githubUsername/azure-resource-optimization-lab.git"
    
    git remote add origin $repoUrl
    git branch -M main
    git push -u origin main
    
    Write-Host "✅ Code pushed to GitHub" -ForegroundColor Green
    Write-Host ""
    Write-Host "📝 Don't forget to add topics manually:" -ForegroundColor Yellow
    Write-Host "   azure, cloud-architecture, infrastructure-as-code, arm-template," -ForegroundColor Gray
    Write-Host "   azure-monitor, governance, cost-optimization, devops, portfolio-project" -ForegroundColor Gray
}

# Final summary
Write-Host ""
Write-Host "🎉 Setup Complete!" -ForegroundColor Green
Write-Host "==================" -ForegroundColor Green
Write-Host ""
Write-Host "Your repository is ready at:" -ForegroundColor White
Write-Host "https://github.com/$githubUsername/azure-resource-optimization-lab" -ForegroundColor Cyan
Write-Host ""
Write-Host "✅ Files included:" -ForegroundColor White
Write-Host "   - README.md with badges and professional formatting" -ForegroundColor Gray
Write-Host "   - LICENSE (MIT)" -ForegroundColor Gray
Write-Host "   - CONTRIBUTING.md" -ForegroundColor Gray
Write-Host "   - DEPLOYMENT.md" -ForegroundColor Gray
Write-Host "   - SECURITY.md" -ForegroundColor Gray
Write-Host "   - .gitignore" -ForegroundColor Gray
Write-Host "   - Issue & PR templates" -ForegroundColor Gray
Write-Host "   - GitHub Actions workflow" -ForegroundColor Gray
Write-Host ""
Write-Host "🚀 Next steps:" -ForegroundColor White
Write-Host "   1. Add screenshots to the screenshots/ directory" -ForegroundColor Gray
Write-Host "   2. Update the LinkedIn/GitHub badges in README.md with your profile links" -ForegroundColor Gray
Write-Host "   3. Share your repository on LinkedIn and Twitter" -ForegroundColor Gray
Write-Host "   4. Add the repo to your resume and portfolio" -ForegroundColor Gray
Write-Host ""
Write-Host "📚 For more details, see GITHUB_SETUP.md" -ForegroundColor Yellow
Write-Host ""
