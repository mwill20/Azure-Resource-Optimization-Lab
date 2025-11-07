# Contributing to Azure Resource Optimization Lab

Thank you for considering contributing to this project! This repository serves as an educational demonstration of Azure best practices, and contributions are welcome.

## 🤝 How to Contribute

### Reporting Issues
- Use the GitHub Issues tab to report bugs or suggest enhancements
- Provide clear descriptions and reproduction steps
- Include screenshots when relevant

### Suggesting Enhancements
- Open an issue with the "enhancement" label
- Describe the feature and its benefits
- Explain how it aligns with the project's learning objectives

### Submitting Pull Requests

1. **Fork the repository** and create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** with clear, descriptive commits:
   ```bash
   git commit -m "Add: new Azure Policy example for storage accounts"
   ```

3. **Test your changes** by deploying the ARM template in your own Azure subscription

4. **Update documentation** to reflect your changes (README, comments, etc.)

5. **Submit a pull request** with:
   - Clear title and description
   - Reference to related issues
   - Screenshots or test results (if applicable)

## 📋 Code Standards

### ARM Templates
- Use descriptive resource names and variables
- Include metadata descriptions for all parameters
- Follow Azure naming conventions
- Add inline comments for complex logic
- Validate templates using `az deployment group validate`

### Documentation
- Use clear, concise language
- Include code examples where relevant
- Update the README if adding new features
- Keep the repository structure organized

### Commits
- Use conventional commit messages:
  - `Add:` new features
  - `Fix:` bug fixes
  - `Update:` changes to existing features
  - `Docs:` documentation only
  - `Refactor:` code restructuring

## 🎯 Areas for Contribution

Priority areas where contributions are especially welcome:

- **Azure Policy examples** (Bicep or ARM)
- **Cost optimization strategies** and documentation
- **Alternative deployment methods** (Terraform, Bicep)
- **Monitoring enhancements** (custom KQL queries, dashboards)
- **CI/CD pipeline examples** (GitHub Actions, Azure DevOps)
- **Security hardening** (Key Vault integration, managed identities)
- **Documentation improvements** (tutorials, video guides)

## 🧪 Testing

Before submitting:
- Deploy the ARM template successfully in a test environment
- Verify all resources are created with correct configurations
- Test monitoring alerts if applicable
- Clean up resources after testing

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 💬 Questions?

Feel free to open an issue for questions about contributing or reach out via GitHub discussions.

---

**Thank you for helping make this project better!** 🚀
