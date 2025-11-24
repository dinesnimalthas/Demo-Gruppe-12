# How to Use the Reusable PR Size Labeler

> **Make your repository smarter!** Add automatic PR size labeling in under 5 minutes.

This reusable workflow can be used by **any GitHub repository** to automatically label Pull Requests by their size.

---

## 🚀 Quick Start (3 Steps)

### Step 1: Create the Workflow File

In your repository, create `.github/workflows/pr-size-labeler.yml`:

```yaml
name: PR Size Labeler

on:
  pull_request:
    types: [opened, synchronize, reopened]

permissions:
  contents: read
  pull-requests: write

jobs:
  label-pr:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
```

### Step 2: Create the Labels

Run this in your repository (or create manually on GitHub):

```powershell
# Required labels (create these on GitHub):
# - size: XS (color: 0e8a16)
# - size: S (color: 1d76db)
# - size: M (color: fbca04)
# - size: L (color: d93f0b)
# - size: XL (color: b60205)
# - needs split (color: e99695)
```

### Step 3: Test It!

Create a Pull Request in your repository. The workflow will automatically:
- ✅ Analyze the PR size
- ✅ Add the appropriate size label
- ✅ Post a comment with statistics
- ✅ Add "needs split" label for XL PRs

---

## ⚙️ Configuration Options

### Default Configuration (Simple)

```yaml
jobs:
  label-pr:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
```

**Default thresholds:**
- XS: < 10 lines
- S: 10-49 lines
- M: 50-199 lines
- L: 200-499 lines
- XL: ≥ 500 lines

---

### Custom Thresholds

Want different size categories? Configure them!

```yaml
jobs:
  label-pr:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
    with:
      size_xs: 5      # XS: < 5 lines
      size_s: 25      # S: 5-24 lines
      size_m: 100     # M: 25-99 lines
      size_l: 300     # L: 100-299 lines
                      # XL: ≥ 300 lines
```

---

### With Discord Notifications

Get real-time alerts in Discord!

```yaml
jobs:
  label-pr:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
    with:
      enable_discord: true
    secrets:
      discord_webhook: ${{ secrets.DISCORD_WEBHOOK_URL }}
```

**Setup Discord:**
1. Discord Server → **Server Settings** → **Integrations** → **Webhooks**
2. Create webhook, copy URL
3. GitHub Repo → **Settings** → **Secrets and variables** → **Actions**
4. Add secret: `DISCORD_WEBHOOK_URL`

---

### Full Configuration Example

```yaml
name: PR Size Labeler with Discord

on:
  pull_request:
    types: [opened, synchronize, reopened]

permissions:
  contents: read
  pull-requests: write

jobs:
  label-pr:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
    with:
      # Custom thresholds
      size_xs: 10
      size_s: 50
      size_m: 200
      size_l: 500
      # Enable Discord
      enable_discord: true
    secrets:
      discord_webhook: ${{ secrets.DISCORD_WEBHOOK_URL }}
```

---

## 📊 What You Get

### Automatic Labels

PRs are automatically labeled:
- 🟢 **size: XS** - Tiny changes
- 🟢 **size: S** - Small PRs
- 🟡 **size: M** - Medium PRs
- 🟠 **size: L** - Large PRs
- 🔴 **size: XL** - Extra large PRs (+ "needs split" label)

### Statistics Comment

Every PR gets a detailed comment:

```markdown
## 🟡 PR Size Analysis: M

| Metric | Value |
|--------|-------|
| Additions | +87 |
| Deletions | -12 |
| Total Changes | 99 lines |
| Files Changed | 4 files |

### Size Categories
| Size | Range | Status |
|------|-------|--------|
| XS | < 10 lines | |
| S | 10-49 lines | |
| M | 50-199 lines | ✅ Current |
| L | 200-499 lines | |
| XL | ≥ 500 lines | |
```

### Discord Alerts (Optional)

Rich embed notifications with:
- Size badge (XS/S/M/L/XL)
- PR statistics
- Direct link to PR
- Author information
- Warning for XL PRs

---

## 🔧 Required Permissions

The workflow needs these permissions:

```yaml
permissions:
  contents: read        # Read repository content
  pull-requests: write  # Add labels and comments
```

These are automatically handled when you use the reusable workflow.

---

## 📋 Required Labels

Create these labels in your repository:

| Label | Color | Description |
|-------|-------|-------------|
| `size: XS` | `#0e8a16` | Extra small PR (< 10 lines) |
| `size: S` | `#1d76db` | Small PR (10-49 lines) |
| `size: M` | `#fbca04` | Medium PR (50-199 lines) |
| `size: L` | `#d93f0b` | Large PR (200-499 lines) |
| `size: XL` | `#b60205` | Extra large PR (≥ 500 lines) |
| `needs split` | `#e99695` | PR should be split |

**Quick create script:**

```bash
# Create labels via GitHub CLI
gh label create "size: XS" --color 0e8a16 --description "Extra small PR"
gh label create "size: S" --color 1d76db --description "Small PR"
gh label create "size: M" --color fbca04 --description "Medium PR"
gh label create "size: L" --color d93f0b --description "Large PR"
gh label create "size: XL" --color b60205 --description "Extra large PR"
gh label create "needs split" --color e99695 --description "PR should be split"
```

---

## 🧪 Testing

### Test in Your Repository

1. Create the workflow file
2. Create a new branch
3. Make some changes (e.g., add 50 lines)
4. Create a Pull Request
5. Wait ~30 seconds

**Expected result:**
- ✅ PR gets labeled (e.g., "size: M")
- ✅ Comment appears with statistics
- ✅ (Optional) Discord notification

---

## ❓ Troubleshooting

### Labels not applied

**Check:**
- ✅ Are permissions set correctly? (`pull-requests: write`)
- ✅ Do the labels exist in your repository?
- ✅ Is the workflow file in `.github/workflows/`?

### Discord notifications not working

**Check:**
- ✅ Is `enable_discord: true` set?
- ✅ Is secret `DISCORD_WEBHOOK_URL` configured?
- ✅ Is the webhook URL valid?

### Workflow not triggered

**Check:**
- ✅ Is the workflow file on the default branch (main/master)?
- ✅ Does the file have correct YAML syntax?
- ✅ Are GitHub Actions enabled in repository settings?

---

## 🎯 Use Cases

### For Code Review Teams
- Quickly identify PR complexity
- Prioritize smaller PRs for faster reviews
- Encourage splitting large PRs

### For Open Source Projects
- Help maintainers triage contributions
- Set expectations for contributors
- Improve review throughput

### For Enterprise Teams
- Enforce PR size policies
- Track code review metrics
- Improve development velocity

---

## 📚 Advanced Usage

### Version Pinning

Use a specific version instead of `@main`:

```yaml
uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@v1.0.0
```

### Multiple Workflows

Combine with other workflows:

```yaml
jobs:
  # Size labeler
  label-pr-size:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
  
  # Your other jobs
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm run lint
```

### Conditional Execution

Only run on specific branches:

```yaml
on:
  pull_request:
    types: [opened, synchronize]
    branches: [main, develop]  # Only these branches
```

---

## 💡 Pro Tips

1. **Start with defaults** - Try it without custom configuration first
2. **Monitor for a week** - See what sizes your team typically creates
3. **Adjust thresholds** - Customize based on your team's patterns
4. **Add Discord** - Real-time notifications improve visibility
5. **Educate team** - Explain why smaller PRs are better

---

## 🤝 Contributing

Found a bug or have a feature request?

1. Open an issue: [GitHub Issues](https://github.com/HSLU-Exercise/scope-your-project-gruppe-12/issues)
2. Submit a PR with improvements
3. Share feedback in discussions

---

## 📄 License

MIT License - Feel free to use in any project!

---

## 🔗 Links

- [Source Repository](https://github.com/HSLU-Exercise/scope-your-project-gruppe-12)
- [GitHub Actions Documentation](https://docs.github.com/en/actions/using-workflows/reusing-workflows)
- [Reusable Workflows Guide](https://docs.github.com/en/actions/using-workflows/reusing-workflows)

---

**Made with ❤️ by Gruppe 12 - HSLU IT Project Basics**
