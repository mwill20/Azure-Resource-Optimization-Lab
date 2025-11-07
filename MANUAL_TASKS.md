# ✅ Manual Setup Checklist

This guide walks you through all the manual tasks needed to complete your GitHub repository setup.

---

## 📋 Quick Checklist

- [ ] **Task 1:** Update social media links in README.md
- [ ] **Task 2:** Create GitHub repository and push code
- [ ] **Task 3:** Add GitHub topics/tags
- [ ] **Task 4:** Add screenshots to the repository
- [ ] **Task 5:** (Optional) Configure GitHub Actions secrets
- [ ] **Task 6:** (Optional) Add social preview image
- [ ] **Task 7:** (Optional) Enable GitHub features

---

## Task 1: Update Social Media Links in README.md

### 📍 Location
File: `README.md` (bottom of the file, Author section)

### Current Placeholder Text
```markdown
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/yourprofile)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/yourusername)
```

### What to Do

1. **Find your LinkedIn profile URL:**
   - Go to [LinkedIn](https://www.linkedin.com)
   - Click on your profile
   - Copy the URL (e.g., `https://www.linkedin.com/in/michael-williams-abc123/`)

2. **Find your GitHub username:**
   - Go to [GitHub](https://github.com)
   - Your username appears in the top-right corner
   - Or from the URL: `https://github.com/YOUR_USERNAME`

3. **Update the README.md file:**

   **Replace:**
   ```markdown
   [![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/yourprofile)
   [![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/yourusername)
   ```

   **With (using your actual links):**
   ```markdown
   [![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/your-actual-profile)
   [![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/YOUR_ACTUAL_USERNAME)
   ```

4. **Save the file**

✅ **Task 1 Complete!**

---

## Task 2: Create GitHub Repository and Push Code

### Option A: Using the Automated Script (Easiest)

1. **Open PowerShell** in the repository directory:
   ```powershell
   cd c:\Users\20mdw\azure-resource-optimization-lab
   ```

2. **Run the setup script:**
   ```powershell
   .\setup-github.ps1
   ```

3. **Follow the prompts:**
   - Enter your GitHub username when asked
   - If you have GitHub CLI, it will create the repo automatically
   - If not, it will guide you through manual steps

### Option B: Using GitHub CLI (If Installed)

1. **Check if GitHub CLI is installed:**
   ```powershell
   gh --version
   ```

2. **If not installed, download it:**
   - Go to: https://cli.github.com/
   - Download and install for Windows
   - Run: `gh auth login` to authenticate

3. **Create and push repository:**
   ```powershell
   cd c:\Users\20mdw\azure-resource-optimization-lab
   
   # Initialize Git
   git init
   git add .
   git commit -m "Initial commit: Azure Resource Optimization Lab"
   
   # Create GitHub repo
   gh repo create azure-resource-optimization-lab --public --description "End-to-end Azure Resource Optimization Lab — ARM-based VM deployment with tagging, governance policies, and Azure Monitor alerts. Demonstrates cloud architecture, cost optimization, and observability." --source=. --remote=origin --push
   ```

### Option C: Manual Setup (No GitHub CLI)

1. **Initialize Git repository locally:**
   ```powershell
   cd c:\Users\20mdw\azure-resource-optimization-lab
   git init
   git add .
   git commit -m "Initial commit: Azure Resource Optimization Lab"
   ```

2. **Create repository on GitHub:**
   - Go to: https://github.com/new
   - **Repository name:** `azure-resource-optimization-lab`
   - **Description:** 
     ```
     End-to-end Azure Resource Optimization Lab — ARM-based VM deployment with tagging, governance policies, and Azure Monitor alerts. Demonstrates cloud architecture, cost optimization, and observability.
     ```
   - **Visibility:** Public
   - **IMPORTANT:** Do NOT check these boxes:
     - ❌ Add a README file
     - ❌ Add .gitignore
     - ❌ Choose a license
   - Click **Create repository**

3. **Connect and push your local repository:**
   
   Replace `YOUR_USERNAME` with your actual GitHub username:
   
   ```powershell
   git remote add origin https://github.com/YOUR_USERNAME/azure-resource-optimization-lab.git
   git branch -M main
   git push -u origin main
   ```

4. **Enter credentials when prompted**

✅ **Task 2 Complete!**

---

## Task 3: Add GitHub Topics/Tags

### Using GitHub CLI

```powershell
gh repo edit --add-topic azure,cloud-architecture,infrastructure-as-code,arm-template,azure-monitor,governance,cost-optimization,devops,portfolio-project
```

### Using GitHub Web Interface

1. **Go to your repository:**
   ```
   https://github.com/YOUR_USERNAME/azure-resource-optimization-lab
   ```

2. **Click the ⚙️ gear icon** next to "About" (top-right of the page)

3. **In the "Topics" field, add these tags** (comma-separated or one at a time):
   - `azure`
   - `cloud-architecture`
   - `infrastructure-as-code`
   - `arm-template`
   - `azure-monitor`
   - `governance`
   - `cost-optimization`
   - `devops`
   - `portfolio-project`

4. **Click "Save changes"**

5. **Verify:** The topics should now appear below your repository description

✅ **Task 3 Complete!**

---

## Task 4: Add Screenshots to the Repository

### Why Screenshots Matter
Screenshots provide visual proof of your work and make your portfolio more compelling.

### What Screenshots to Take

Follow the guide in `screenshots/README.md` for detailed instructions. Here's a quick summary:

#### Screenshot 1: Resource Group Overview
**Where:** Azure Portal → Resource groups → Your resource group

**What to capture:**
- All deployed resources listed
- Tags visible (Environment, Owner, Project)
- Resource group name and location

**Suggested filename:** `01-resource-group-overview.png`

---

#### Screenshot 2: ARM Template Deployment Success
**Where:** Azure Portal → Resource group → Deployments

**What to capture:**
- "Deployment succeeded" message
- Deployment name and timestamp
- Duration and deployment details

**Suggested filename:** `02-deployment-success.png`

---

#### Screenshot 3: Virtual Machine Overview
**Where:** Azure Portal → Virtual machines → vm-app

**What to capture:**
- VM status (Running)
- DNS name visible
- VM size, OS, location
- Public IP address

**Suggested filename:** `03-vm-overview-with-dns.png`

---

#### Screenshot 4: Public IP Configuration
**Where:** Azure Portal → Public IP addresses → pip-app

**What to capture:**
- DNS name label
- IP address
- SKU: Standard
- Allocation method: Static

**Suggested filename:** `04-public-ip-config.png`

---

#### Screenshot 5: Azure Monitor Alerts
**Where:** Azure Portal → Virtual machine → Monitoring → Alerts

**What to capture:**
- List of alert rules (CPU-High-Alert, Disk-IO-High-Alert)
- Alert status and severity
- Signal type and condition

**Suggested filename:** `05-alert-rules-list.png`

---

#### Screenshot 6: VM Insights Dashboard
**Where:** Azure Portal → Virtual machine → Monitoring → Insights

**What to capture:**
- Performance charts (CPU, Memory, Disk, Network)
- Data collection status
- Time range shown

**Suggested filename:** `06-vm-insights-dashboard.png`

---

#### Screenshot 7: Network Security Group
**Where:** Azure Portal → Network security groups → nsg-app → Inbound security rules

**What to capture:**
- Allow-SSH rule visible
- Port 22, Priority 1000
- Source and destination

**Suggested filename:** `07-nsg-rules.png`

---

### How to Take Screenshots

**Windows:**
- Press `Win + Shift + S` to use Snipping Tool
- Or use `PrtScn` for full screen
- Or use Windows Snip & Sketch

**Tips:**
- Use 1920x1080 resolution or higher
- Capture full browser window when possible
- Ensure text is readable
- Use PNG format for quality

### Security Before Uploading

⚠️ **IMPORTANT - Redact these items:**
- Subscription IDs (blur them)
- Resource IDs (if sensitive)
- Any IP addresses you want to keep private
- Personal email addresses

**How to redact:**
- Use Paint, PowerPoint, or any image editor
- Draw colored rectangles over sensitive info
- Or use built-in Windows editor (Paint 3D, Snip & Sketch)

### Add Screenshots to Git

1. **Save your screenshots** to the `screenshots/` folder

2. **Add them to Git:**
   ```powershell
   cd c:\Users\20mdw\azure-resource-optimization-lab
   git add screenshots/*.png
   git commit -m "Add: Azure Portal screenshots"
   git push
   ```

✅ **Task 4 Complete!**

---

## Task 5: (Optional) Configure GitHub Actions Secrets

### Purpose
Enables automatic ARM template validation on every commit

### Prerequisites
- Azure subscription
- Azure CLI installed

### Steps

1. **Create Azure Service Principal:**
   ```powershell
   az login
   
   az ad sp create-for-rbac --name "github-actions-azure-opt-lab" --role contributor --scopes /subscriptions/YOUR_SUBSCRIPTION_ID --sdk-auth
   ```

2. **Copy the JSON output** (looks like this):
   ```json
   {
     "clientId": "...",
     "clientSecret": "...",
     "subscriptionId": "...",
     "tenantId": "...",
     ...
   }
   ```

3. **Add to GitHub:**
   - Go to: `https://github.com/YOUR_USERNAME/azure-resource-optimization-lab/settings/secrets/actions`
   - Click **"New repository secret"**
   - Name: `AZURE_CREDENTIALS`
   - Value: Paste the entire JSON output
   - Click **"Add secret"**

4. **Test the workflow:**
   - Go to Actions tab in your repo
   - The ARM validation workflow should appear
   - Click on it to manually trigger or wait for next commit

✅ **Task 5 Complete!**

---

## Task 6: (Optional) Add Social Preview Image

### Purpose
Makes your repository look professional when shared on social media

### What to Create
A banner image (1280x640px recommended) with:
- Project name: "Azure Resource Optimization Lab"
- Key technologies: Azure, ARM, Monitor
- Your name/brand

### Tools to Create It
- **Canva** (free, easy): https://www.canva.com
- **Figma** (free, professional): https://www.figma.com
- **PowerPoint** (quick and simple)

### How to Add It

1. **Create or download your banner image**

2. **Go to GitHub repository settings:**
   ```
   https://github.com/mwill20/Azure-Resource-Optimization-Lab/settings
   ```

3. **Scroll to "Social preview"**

4. **Click "Edit"** → **"Upload an image"**

5. **Upload your banner** (max 1MB, .png or .jpg)

6. **Save**

✅ **Task 6 Complete!**

---

## Task 7: (Optional) Enable GitHub Features

### Enable Discussions
1. Go to: Settings → General → Features
2. Check ✅ **Discussions**
3. Click **Save**

**Purpose:** Allow community Q&A about your project

---

### Enable Projects
1. Go to: Settings → General → Features
2. Check ✅ **Projects**
3. Click **Save**

**Purpose:** Track enhancements and feature requests

---

### Update Repository Description
1. Click the ⚙️ gear next to "About"
2. Add **Website** (if you have a portfolio)
3. Update description if needed
4. Click **Save**

✅ **Task 7 Complete!**

---

## 🎉 Final Verification

After completing all tasks, verify:

- [ ] README displays correctly with your social links
- [ ] Repository has proper description and topics
- [ ] Screenshots are visible in the `screenshots/` folder
- [ ] All files are committed and pushed
- [ ] Links in README work (click them to test)
- [ ] License is visible
- [ ] Contributing guidelines are accessible

---

## 📊 Share Your Work

Once everything is complete:

### LinkedIn Post Template
```
🚀 Excited to share my latest project: Azure Resource Optimization Lab!

This end-to-end cloud architecture project demonstrates:
✅ Infrastructure-as-Code with ARM templates
✅ Cost optimization strategies
✅ Azure governance policies
✅ Monitoring & observability with Azure Monitor

Built to showcase real-world cloud engineering skills.

Check it out: https://github.com/mwill20/Azure-Resource-Optimization-Lab

#Azure #CloudArchitecture #DevOps #InfrastructureAsCode #PortfolioProject
```

### Twitter/X Post Template
```
🚀 Just launched my Azure Resource Optimization Lab!

Features:
✅ ARM templates
✅ Cost optimization
✅ Governance
✅ Azure Monitor

Perfect for learning cloud architecture fundamentals.

🔗 https://github.com/mwill20/Azure-Resource-Optimization-Lab

#Azure #CloudComputing #DevOps
```

### Add to Resume
**Projects Section:**
```
Azure Resource Optimization Lab
- Designed and deployed end-to-end Azure infrastructure using ARM templates
- Implemented cost optimization strategies with resource tagging and governance policies
- Configured Azure Monitor with proactive alerting for CPU and Disk I/O
- Technologies: Azure, ARM, Azure Monitor, PowerShell, Git
- Repository: github.com/mwill20/Azure-Resource-Optimization-Lab
```

---

## 💬 Need Help?

- Review `GITHUB_SETUP.md` for detailed GitHub instructions
- Check `DEPLOYMENT.md` for Azure deployment help
- See `screenshots/README.md` for screenshot guidance
- Open an issue in your repository for community support

---

**You've got this! 🎯**

