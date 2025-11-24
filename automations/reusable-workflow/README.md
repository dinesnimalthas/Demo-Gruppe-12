# Reusable Workflow

> **Make our PR Size Labeler available to ANY GitHub repository!**

This folder contains everything needed to share our PR Size Labeler as a **reusable workflow** that other teams can use.

---

## 📦 What's a Reusable Workflow?

A **reusable workflow** is a GitHub Actions workflow that can be called from other repositories. Instead of every team writing the same automation code, they can just reference ours!

**Benefits:**
- ✅ **One source of truth** - Updates automatically benefit all users
- ✅ **Easy to use** - Just 3 lines of YAML
- ✅ **Configurable** - Teams can customize it for their needs
- ✅ **Professional** - Real-world best practice

---

## 🚀 For Other Teams (External Use)

### Quick Start (3 Steps)

**1. Create workflow file in YOUR repository:**

`.github/workflows/pr-size-labeler.yml`
```yaml
name: PR Size Labeler
on:
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  label-pr:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
```

**2. Create the labels** (on GitHub or via script)

**3. Test!** Create a PR and watch it get labeled automatically! 🎉

---

## 📚 Documentation

| File | Purpose |
|------|---------|
| [HOW-TO-USE.md](HOW-TO-USE.md) | Complete usage guide with setup instructions |
| [example-usage.yml](example-usage.yml) | 7 real-world examples |
| [reusable-pr-size-labeler.yml](../../.github/workflows/reusable-pr-size-labeler.yml) | The actual workflow |

---

## ⚙️ Configuration Options

### Input Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `size_xs` | number | 10 | Maximum lines for XS label |
| `size_s` | number | 50 | Maximum lines for S label |
| `size_m` | number | 200 | Maximum lines for M label |
| `size_l` | number | 500 | Maximum lines for L label |
| `enable_discord` | boolean | false | Enable Discord notifications |

### Secrets

| Secret | Required | Description |
|--------|----------|-------------|
| `discord_webhook` | No* | Discord webhook URL (*required if `enable_discord: true`) |

---

## 🎯 Examples

### Example 1: Basic (Default Settings)
```yaml
jobs:
  label-pr:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
```

### Example 2: Custom Thresholds
```yaml
jobs:
  label-pr:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
    with:
      size_xs: 5
      size_s: 25
      size_m: 100
      size_l: 300
```

### Example 3: With Discord
```yaml
jobs:
  label-pr:
    uses: HSLU-Exercise/scope-your-project-gruppe-12/.github/workflows/reusable-pr-size-labeler.yml@main
    with:
      enable_discord: true
    secrets:
      discord_webhook: ${{ secrets.DISCORD_WEBHOOK_URL }}
```

[See all 7 examples →](example-usage.yml)

---

## 🔧 Features

| Feature | Included |
|---------|----------|
| Automatic size labeling | ✅ |
| Statistics comment | ✅ |
| "needs split" for XL PRs | ✅ |
| Customizable thresholds | ✅ |
| Discord notifications | ✅ (optional) |
| Comment updates | ✅ |
| Label cleanup | ✅ |

---

## 📊 Size Categories (Default)

| Label | Range | Color | Icon |
|-------|-------|-------|------|
| size: XS | < 10 lines | 🟢 Green | Tiny changes |
| size: S | 10-49 lines | 🟢 Green | Small PRs |
| size: M | 50-199 lines | 🟡 Yellow | Medium PRs |
| size: L | 200-499 lines | 🟠 Orange | Large PRs |
| size: XL | ≥ 500 lines | 🔴 Red | Split recommended! |

---

## 🎬 For Presentations

### Wow-Factor Demo:

**1. Show the reusable workflow:**
```
"We created a workflow that ANY team can use!"
```

**2. Show how easy it is:**
```yaml
# Just 3 lines to add to any repo:
jobs:
  label-pr:
    uses: our-repo/.github/workflows/reusable-pr-size-labeler.yml@main
```

**3. Show configuration:**
```
"Teams can customize it for their needs - strict or relaxed!"
```

**4. Show real usage:**
```
"Create a PR → Watch it get labeled in real-time!"
```

**5. Highlight benefits:**
```
✅ Saves time - no copy-paste needed
✅ Always up-to-date - one source of truth
✅ Professional - real-world best practice
✅ Shareable - helps the whole community!
```

---

## 🧪 Testing

### Test in This Repository
```bash
# Already works! Just create a PR
git checkout -b test/demo
# make changes
git commit -m "test"
git push
# Create PR → watch it get labeled
```

### Test in Another Repository
1. Create a new test repo
2. Add the workflow file (3 lines)
3. Create labels
4. Create a test PR
5. 🎉 It works!

---

## 💡 Use Cases

### For Code Review Teams
- Quickly see PR complexity
- Prioritize smaller PRs
- Encourage splitting large changes

### For Open Source
- Help maintainers triage contributions
- Set clear expectations
- Improve contributor experience

### For Teaching
- Demonstrate reusable workflows
- Show professional practices
- Share with other students

---

## 🤝 Contributing

Want to improve the workflow?

1. Test your changes locally
2. Update documentation
3. Submit a PR
4. Help other teams!

---

## 📄 License

MIT License - Free to use anywhere!

---

## 🔗 Links

- **Main Repo:** [scope-your-project-gruppe-12](https://github.com/HSLU-Exercise/scope-your-project-gruppe-12)
- **Workflow File:** [reusable-pr-size-labeler.yml](../../.github/workflows/reusable-pr-size-labeler.yml)
- **Usage Guide:** [HOW-TO-USE.md](HOW-TO-USE.md)
- **Examples:** [example-usage.yml](example-usage.yml)
- **GitHub Docs:** [Reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows)

---

**Made with ❤️ by Gruppe 12 - HSLU IT Project Basics**  
Semester 1, 2024/2025
