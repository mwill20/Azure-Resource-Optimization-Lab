# GitHub Repository Setup Guide

## 🎯 Quick Setup

Follow these steps to push your repository to GitHub with the provided description and topics.

### Prerequisites

- Git installed on your system
- GitHub account created
- GitHub CLI (optional but recommended): [Install](https://cli.github.com/)

---

## 📝 Option 1: GitHub CLI (Recommended)

### Step 1: Initialize Git Repository

```bash
cd c:\Users\20mdw\azure-resource-optimization-lab
git init
git add .
git commit -m "Initial commit: Azure Resource Optimization Lab"
```

### Step 2: Create GitHub Repository

```bash
gh repo create azure-resource-optimization-lab --public --description "End-to-end Azure Resource Optimization Lab — ARM-based VM deployment with tagging, governance policies, and Azure Monitor alerts. Demonstrates cloud architecture, cost optimization, and observability." --source=. --remote=origin --push
```

### Step 3: Add Topics

```bash
gh repo edit --add-topic azure,cloud-architecture,infrastructure-as-code,arm-template,azure-monitor,governance,cost-optimization,devops,portfolio-project
```

---

## 📝 Option 2: GitHub Web Interface

### Step 1: Initialize Git Repository

```bash
cd c:\Users\20mdw\azure-resource-optimization-lab
git init
git add .
git commit -m "Initial commit: Azure Resource Optimization Lab"
```

### Step 2: Create Repository on GitHub

1. Go to [GitHub](https://github.com/new)
2. **Repository name**: `azure-resource-optimization-lab`
3. **Description**: 
   ```
   End-to-end Azure Resource Optimization Lab — ARM-based VM deployment with tagging, governance policies, and Azure Monitor alerts. Demonstrates cloud architecture, cost optimization, and observability.
   ```
4. Select **Public**
5. **Do NOT initialize** with README, license, or .gitignore (already exists locally)
6. Click **Create repository**

### Step 3: Push to GitHub

```bash
git remote add origin https://github.com/YOUR_USERNAME/azure-resource-optimization-lab.git
git branch -M main
git push -u origin main
```

### Step 4: Add Topics

1. Go to your repository on GitHub
2. Click the ⚙️ gear icon next to "About"
3. Add topics (one at a time or comma-separated):
   - `azure`
   - `cloud-architecture`
   - `infrastructure-as-code`
   - `arm-template`
   - `azure-monitor`
   - `governance`
   - `cost-optimization`
   - `devops`
   - `portfolio-project`
4. Click **Save changes**

---

## 🎨 Additional GitHub Repository Setup

### Enable GitHub Features

1. **Enable Issues**: Settings → General → Features → ✅ Issues
2. **Enable Discussions** (optional): Settings → General → Features → ✅ Discussions
3. **Add Repository Topics**: Already done in steps above
4. **Set Social Preview Image** (optional): Settings → General → Social preview → Upload image

### Configure Branch Protection (Optional)

For collaborative projects:

1. Settings → Branches → Add rule
2. Branch name pattern: `main`
3. Enable:
   - ✅ Require pull request reviews before merging
   - ✅ Require status checks to pass before merging
   - ✅ Require branches to be up to date before merging

### Add GitHub Actions Secrets (Optional)

If you want to enable the ARM template validation workflow:

1. Settings → Secrets and variables → Actions
2. Click **New repository secret**
3. Name: `AZURE_CREDENTIALS`
4. Value: Azure service principal credentials (JSON format)
   ```json
   {
     "clientId": "<client-id>",
     "clientSecret": "<client-secret>",
     "subscriptionId": "<subscription-id>",
     "tenantId": "<tenant-id>"
   }
   ```

---

## ✅ Verification Checklist

After setup, verify:

- [ ] Repository is public and accessible
- [ ] README displays correctly with badges
- [ ] All topics are visible in the About section
- [ ] Description matches the provided text
- [ ] LICENSE file is present
- [ ] All folders and files are committed
- [ ] Links in README work correctly
- [ ] Issue templates are available
- [ ] GitHub Actions workflow is present (even if not enabled)

---

## 🎉 Your Repository is Ready!

Your Azure Resource Optimization Lab is now professionally presented on GitHub and ready to:

- ✨ Impress potential employers or collaborators
- 📚 Serve as a learning resource for others
- 🤝 Accept contributions from the community
- 📈 Track stars and engagement
- 🏆 Showcase your cloud architecture skills

### Share Your Repository

Share your repository URL:
```
https://github.com/mwill20/Azure-Resource-Optimization-Lab
```

Add it to:
- Your LinkedIn profile (Featured section)
- Your resume/CV (Projects section)
- Your personal website/portfolio
- Cloud engineering communities

---

## 📧 Need Help?

If you encounter issues:
1. Check GitHub's [documentation](https://docs.github.com)
2. Review the [CONTRIBUTING.md](../CONTRIBUTING.md) guide
3. Open an issue in the repository

