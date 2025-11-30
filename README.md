# 🏠 ImmoFlow - Intelligente Immobilienplattform

**IT Project Basics - HSLU 2025 | Gruppe 12**

Vollautomatisierte Immobilienplattform mit GitHub Actions, KI-Matching und Multi-Channel Notifications.

[![Live Demo](https://img.shields.io/badge/🔴_LIVE-Demo-success?style=for-the-badge)](https://dinesnimalthas.github.io/Demo-Gruppe-12/)
[![Dashboard](https://img.shields.io/badge/📊-Dashboard-blue?style=for-the-badge)](https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html)

---

## 🚀 Quick Demo

```powershell
# Demo starten (Windows)
.\start-demo.ps1

# Oder manuell
cd docs && Start-Process index.html
```

**🎬 Live Demo**: [ImmoFlow Website](https://dinesnimalthas.github.io/Demo-Gruppe-12/) | [Automation Dashboard 🔴 LIVE](https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html)

---

## 💡 Der komplette Flow

```
1. Formular ausfüllen (Website)
   ↓
2. GitHub Issue erstellt (automatisch)
   ↓
3. Triage Bot kategorisiert (viewing/financing/contract)
   ↓
4. Team-Notification (Discord, Slack, Teams)
   ↓
5. CODEOWNERS weist Reviewer zu
   ↓
6. Live Dashboard zeigt Status
```

### ✨ Highlights
- 🤖 **9 GitHub Actions Workflows** - Vollautomatisiert
- 🎨 **Moderne UI** - Glassmorphism, Animationen, Responsive
- 📊 **Live Dashboard** - Real-time GitHub API (30s refresh)
- 🔔 **Multi-Channel** - Discord, Slack, Teams Integration
- 🏷️ **Smart Labels** - Auto-Kategorisierung & Priorisierung

---

## 📁 Projektstruktur

```
Demo-Gruppe-12/
├── .github/
│   ├── workflows/           # 9 GitHub Actions Workflows
│   ├── ISSUE_TEMPLATE/      # 5 Issue Templates
│   ├── CODEOWNERS           # Auto Reviewer Assignment
│   └── dependabot.yml       # Dependency Updates
│
├── docs/                    # 🌐 GitHub Pages Website
│   ├── index.html           # ImmoFlow Hauptseite
│   ├── automation-dashboard.html  # 🔴 Live Dashboard
│   └── dashboard-live.js    # GitHub API Integration
│
├── documentation/           # 📚 Komplette Dokumentation
│   ├── QUICK-START.md       # In 2 Minuten startklar
│   ├── LIVE-DEMO-GUIDE.md   # Präsentations-Anleitung
│   ├── SECRETS.md           # Webhook-Konfiguration
│   └── ...                  # 10+ weitere Guides
│
└── automations/             # Automation-Dokumentation
    ├── discord-notifications/
    ├── slack-notifications/
    ├── teams-email-integration/
    ├── label-triage-bot/
    └── pr-size-labeler/
```

---

## 🛠️ Setup

### 1. Repository klonen
```bash
git clone https://github.com/dinesnimalthas/Demo-Gruppe-12.git
cd Demo-Gruppe-12
```

### 2. GitHub Pages aktivieren
**Settings → Pages** → Source: `main` branch, `/docs` folder → Save

### 3. Webhooks konfigurieren (Optional)
```
Settings → Secrets → Actions → New secret
```

| Secret | Beschreibung | Erforderlich |
|--------|--------------|--------------|
---

## 🎯 Demo-Flow für Präsentation

**1. Website zeigen** → https://dinesnimalthas.github.io/Demo-Gruppe-12/
   - Moderne UI mit Animationen
   - 4 Immobilien-Angebote
   - Services & Automation-Übersicht

**2. Formular ausfüllen** → Support-Sektion
   - Name, Email, Kategorie (z.B. "Besichtigungstermin")
   - Issue wird automatisch erstellt

**3. GitHub Issue ansehen** → Repository → Issues
   - Auto-Labels: `support`, `viewing`
   - Triage Bot Comment
   - CODEOWNERS Assignment

**4. Notifications prüfen**
   - Discord/Slack/Teams erhält Nachricht
   - Workflow-Status in Actions

**5. Live Dashboard** → automation-dashboard.html
   - Echtzeit Stats
   - Workflow Runs
   - Activity Feed (auto-refresh 30s)

---

## 🛠️ Setup für Secrets

| Secret | Verwendung | Status |
|--------|------------|--------|
| `TOKEN_ACTIONS_2` | GitHub API (Issues erstellen) | ✅ Konfiguriert |
| `DISCORD_WEBHOOK_URL` | Discord Notifications | Optional |
| `SLACK_WEBHOOK_URL` | Slack Notifications | Optional |
| `TEAMS_WEBHOOK_URL` | Teams Notifications | Optional |

---

## 📚 Mehr Infos

- 📖 [Komplette Dokumentation](documentation/)
- 🎬 [Präsentations-Guide](documentation/LIVE-DEMO-GUIDE.md)
- 🔐 [Secrets Setup](documentation/SECRETS.md)

---

**🎓 HSLU IT Project Basics | HS 2025 | Made with ❤️ by Gruppe 12**


