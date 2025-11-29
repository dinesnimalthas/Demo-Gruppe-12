# GitHub Repository Settings (für Dokumentation)
# Diese Einstellungen sollten im Repository manuell konfiguriert werden

## 🔧 General Settings

### Repository name
Demo-Gruppe-12

### Description
TechGear Store - GitHub Actions Automation Demo | HSLU IT Project Basics 2025 | Discord, Slack, Teams Integration | PR Size Labeling | Triage Bot

### Topics (Keywords)
- github-actions
- automation
- webhooks
- discord-bot
- slack-integration
- microsoft-teams
- ci-cd
- devops
- hslu
- demo-project
- workflow-automation
- notification-system

### Features
✅ Issues
✅ Projects (optional)
✅ Wiki (optional)
✅ Discussions (empfohlen für Q&A)
✅ Sponsorships (optional)

### Pull Requests
✅ Allow merge commits
✅ Allow squash merging
✅ Allow rebase merging
✅ Always suggest updating pull request branches
✅ Allow auto-merge
✅ Automatically delete head branches

---

## 🔐 Security & Analysis

### Security
✅ Private vulnerability reporting
✅ Dependency graph
✅ Dependabot alerts
✅ Dependabot security updates

### Code scanning
⚠️  Optional: Code scanning (GitHub Advanced Security)

---

## 🌿 Branches

### Default branch
main

### Branch protection rules for `main`:
✅ Require a pull request before merging
  - Required approvals: 1
  ✅ Dismiss stale pull request approvals when new commits are pushed
  ✅ Require review from Code Owners

✅ Require status checks to pass before merging
  - Required status checks:
    - triage (Triage Bot)
    - pr-size-labeler (PR Size Labeler)
  ✅ Require branches to be up to date before merging

✅ Require conversation resolution before merging
✅ Require signed commits (optional, aber empfohlen)
✅ Require linear history (optional)

⚠️  Do not allow bypassing the above settings
⚠️  Restrict who can push to matching branches (nur Maintainer)

✅ Allow force pushes: Everyone (für Maintainer)
❌ Allow deletions: Disabled

---

## 🔔 Notifications

### Email notifications
✅ Watching
✅ Participating and @mentions
✅ All activity (optional)

### Custom notification settings
✅ Pull request reviews
✅ Pull request pushes
✅ Comments on Issues and PRs

---

## 🤝 Collaborators & Teams

### Direct collaborators
- @dinesnimalthas (Admin)
- [Weitere Teammitglieder hinzufügen]

### Teams (optional)
- @demo-gruppe-12/maintainers (Admin)
- @demo-gruppe-12/reviewers (Write)
- @demo-gruppe-12/contributors (Read)

---

## 📋 Labels

### Automatisch erstellt durch Workflows:
- needs triage
- size/XS, size/S, size/M, size/L, size/XL

### Manuell zu erstellen:
- bug (rot)
- enhancement (grün)
- documentation (blau)
- automation (lila)
- good first issue (grün hell)
- help wanted (gelb)
- priority: high (rot)
- priority: medium (orange)
- priority: low (grau)
- wontfix (grau dunkel)
- duplicate (grau)
- invalid (grau)
- question (rosa)
- needs review (gelb)
- ready for demo (grün hell)

---

## 🚀 Pages

### Source
✅ Deploy from a branch
Branch: main
Folder: /docs

### Custom domain (optional)
[Ihre Domain hier]

### Enforce HTTPS
✅ Enabled

---

## 🎯 Actions

### General
✅ Allow all actions and reusable workflows
✅ Allow actions created by GitHub
✅ Allow actions by Marketplace verified creators

### Workflow permissions
⚪ Read and write permissions (Standard)
  ✅ Allow GitHub Actions to create and approve pull requests

---

## 🔐 Secrets (siehe SECRETS.md)

### Required Secrets:
- DISCORD_WEBHOOK_URL (optional)
- SLACK_WEBHOOK_URL (optional)
- TEAMS_WEBHOOK_URL (optional)

### Auto-generated:
- GITHUB_TOKEN (automatisch)

---

## 📊 Insights

### Pulse
Wöchentliche Übersicht über Aktivitäten

### Contributors
Zeigt alle Contributors und ihre Beiträge

### Traffic
Besucher und Clone-Statistiken (14 Tage)

### Commits
Commit-Aktivität über Zeit

---

## ⚙️ Webhooks (optional)

Falls externe Services benötigt werden:

### Webhook URL
[Ihre externe Webhook URL]

### Events
- Issues
- Pull requests
- Push
- Release
- Workflow run

---

## 📝 Notes

Diese Einstellungen müssen manuell im Repository unter Settings konfiguriert werden:
https://github.com/dinesnimalthas/Demo-Gruppe-12/settings

Für CODEOWNERS automatisch zu funktionieren, muss:
1. Branch Protection aktiviert sein
2. "Require review from Code Owners" aktiviert sein

---

**Letzte Aktualisierung**: November 2025
**Maintainer**: @dinesnimalthas
