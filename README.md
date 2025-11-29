# 🏠 ImmoFlow - Intelligente Immobilienplattform

**IT Project Basics - HSLU 2025 | Gruppe 12**

Moderne Immobilienplattform mit vollautomatisierten GitHub-Workflows für Kundenanfragen, intelligentes Triage-System und Multi-Channel Benachrichtigungen.

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-success?style=flat&logo=github)](https://dinesnimalthas.github.io/Demo-Gruppe-12/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-9-success?style=flat&logo=github-actions)](https://github.com/dinesnimalthas/Demo-Gruppe-12/actions)

---

## 🚀 Quick Start

```powershell
# Demo starten (Windows)
.\start-demo.ps1

# Oder manuell
cd docs && Start-Process index.html
```

**🎬 Live Demo**: [ImmoFlow Website](https://dinesnimalthas.github.io/Demo-Gruppe-12/) | [Automation Dashboard 🔴 LIVE](https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html)

---

## ✨ Features

### 🏠 Automatisierte Kundenanfragen
Website-Formular → GitHub Issue → Auto-Labeling → Team-Benachrichtigung → Zuweisung

### 🤖 Intelligente Automationen
- **Triage Bot**: Kategorisiert Issues nach Keywords (Besichtigung, Finanzierung, Vertrag)
- **PR Size Labeler**: Berechnet automatisch PR-Größe (XS bis XL) für optimale Reviews
- **Multi-Channel Alerts**: Teams, Discord & Slack Benachrichtigungen
- **CODEOWNERS**: Automatische Reviewer-Zuweisung basierend auf Dateiänderungen

### 📊 Live Dashboard
Echtzeit-Monitoring mit GitHub API Integration:
- Aktive Workflows & Issue-Statistiken
- Response Time & Team Alerts
- Recent Activity Feed
- Workflow Run History
- **Auto-Refresh alle 30 Sekunden**

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
| `DISCORD_WEBHOOK_URL` | Discord Notifications | Optional |
| `SLACK_WEBHOOK_URL` | Slack Notifications | Optional |
| `TEAMS_WEBHOOK_URL` | Teams Notifications | Optional |

**Hinweis**: Alle Workflows funktionieren auch OHNE Webhooks (Graceful Degradation)

📖 Details: [SECRETS.md](documentation/SECRETS.md)

---

## 🎯 Verwendung

### Immobilien-Anfrage erstellen
1. Öffne [Website](https://dinesnimalthas.github.io/Demo-Gruppe-12/)
2. Fülle Support-Formular aus (Besichtigung, Finanzierung, Vertrag, etc.)
3. **→** Issue wird automatisch erstellt
4. **→** Labels werden zugewiesen
5. **→** Team wird benachrichtigt

### Workflows testen
```powershell
# Issue erstellen
gh issue create --title "Besichtigungstermin Villa Luzern" --body "Terminanfrage"

# Webhook testen
.\automations\discord-notifications\test-webhook.ps1
```

---

## 📚 Dokumentation

| Dokument | Beschreibung |
|----------|--------------|
| [📖 Quick-Start](documentation/QUICK-START.md) | In 2 Minuten startklar |
| [🎬 Live-Demo Guide](documentation/LIVE-DEMO-GUIDE.md) | Perfekte Präsentation |
| [🔐 Secrets](documentation/SECRETS.md) | Webhook-Konfiguration |
| [✅ Setup Checklist](documentation/SETUP-CHECKLIST.md) | Komplette Anleitung |
| [📁 Repository Overview](documentation/REPOSITORY-OVERVIEW.md) | Datei-Struktur |
| [🤝 Contributing](documentation/CONTRIBUTING.md) | Beitragen zum Projekt |

**Vollständige Dokumentation**: [documentation/](documentation/) Ordner

---

## 🔗 Links

- 🌐 [Live Website](https://dinesnimalthas.github.io/Demo-Gruppe-12/)
- 📊 [Automation Dashboard 🔴](https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html)
- ⚙️ [GitHub Actions](https://github.com/dinesnimalthas/Demo-Gruppe-12/actions)
- 📚 [Automations Docs](./automations/)

---

## 🎓 Projekt-Info

**Hochschule Luzern** | IT Project Basics | HS 2025

**Made with ❤️ by Gruppe 12**

---

## 📝 Lizenz

MIT License - Demo für Bildungszwecke


