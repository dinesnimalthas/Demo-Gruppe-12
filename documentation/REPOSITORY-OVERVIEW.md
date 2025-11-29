# 📁 Repository Übersicht - Demo-Gruppe-12

Vollständige Übersicht aller Dateien und deren Zweck im Repository.

## 🌳 Verzeichnisstruktur

```
Demo-Gruppe-12/
│
├── 📄 README.md                        # ⭐ Haupt-Dokumentation - Start hier!
├── 📄 QUICK-START.md                   # 🚀 Schnellstart in 2 Minuten
├── 📄 LIVE-DEMO-GUIDE.md              # 🎬 Live-Präsentations-Anleitung
├── 📄 PRESENTATION-GUIDE.md           # 🎤 Detaillierte Präsentations-Tipps
├── 📄 SECRETS.md                       # 🔐 Webhook-Konfiguration (Detailliert)
├── 📄 SECRETS-QUICKREF.md             # ⚡ Secrets Quick-Reference
├── 📄 SETUP-CHECKLIST.md              # ✅ Komplette Setup-Checkliste
├── 📄 CONTRIBUTING.md                  # 🤝 Wie man beiträgt
├── 📄 SECURITY.md                      # 🛡️ Sicherheitsrichtlinien
├── 📄 LICENSE                          # 📜 MIT Lizenz
│
├── 📄 package.json                     # 📦 NPM Projekt-Konfiguration
├── 📄 .editorconfig                    # ⚙️ Editor-Einstellungen
├── 📄 .gitattributes                   # 🔧 Git-Attribute für Line Endings
├── 📄 .gitignore                       # 🚫 Ignorierte Dateien
│
├── 📄 start-demo.ps1                   # 🎯 Demo-Start-Script (PowerShell)
│
├── 📁 .github/                         # 🤖 GitHub-spezifische Konfiguration
│   │
│   ├── 📄 CODEOWNERS                   # 👥 Automatische Reviewer-Zuweisung
│   ├── 📄 dependabot.yml              # 🔄 Automatische Dependency-Updates
│   ├── 📄 PULL_REQUEST_TEMPLATE.md    # 📋 PR-Template
│   ├── 📄 REPOSITORY-SETTINGS.md      # ⚙️ Empfohlene Repository-Settings
│   │
│   ├── 📁 ISSUE_TEMPLATE/             # 📝 Issue-Templates
│   │   ├── bug_report.md              # 🐛 Bug-Meldung
│   │   ├── feature_request.md         # ✨ Feature-Vorschlag
│   │   ├── documentation.md           # 📚 Dokumentation
│   │   ├── automation.md              # 🔧 Automation-Problem
│   │   └── config.yml                 # ⚙️ Issue-Template-Konfiguration
│   │
│   └── 📁 workflows/                  # 🔄 GitHub Actions Workflows
│       ├── discord-notifications.yml   # 💬 Discord Benachrichtigungen
│       ├── slack-notifications.yml     # 📢 Slack Benachrichtigungen
│       ├── teams-email-notifications.yml # 📧 Teams & Email Alerts
│       ├── triage-bot.yml             # 🏷️ Automatisches Issue-Triage
│       ├── label-bot.yml              # 🏷️ Label-Bot (Alternative)
│       ├── labeler.yml                # 🏷️ PR Labeler
│       ├── pr-size-labeler.yml        # 📊 PR-Größen-Analyse
│       ├── reusable-pr-size-labeler.yml # ♻️ Wiederverwendbarer Workflow
│       └── deploy-pages.yml           # 🚀 GitHub Pages Deployment
│
├── 📁 docs/                           # 🌐 Website (GitHub Pages)
│   ├── 📄 index.html                  # 🏠 TechGear Store Hauptseite
│   ├── 📄 automation-dashboard.html   # 📊 Live Automation Dashboard
│   ├── 📄 script.js                   # 💻 Frontend JavaScript
│   ├── 📄 styles.css                  # 🎨 Styling
│   ├── 📄 config.example.js           # ⚙️ Konfig-Beispiel
│   ├── 📄 README.md                   # 📖 Website-Dokumentation
│   └── 📄 DESIGN-CHANGES.md          # 🎨 Design-Änderungen
│
└── 📁 automations/                    # 📚 Automation-Dokumentation
    ├── 📄 README.md                   # 📖 Automations-Übersicht
    │
    ├── 📁 discord-notifications/      # 💬 Discord Integration
    │   ├── README.md                  # 📖 Discord Setup-Anleitung
    │   ├── LIVE-DEMO-GUIDE.md        # 🎬 Demo-Anleitung
    │   └── test-webhook.ps1          # 🧪 Webhook-Test-Script
    │
    ├── 📁 slack-notifications/        # 📢 Slack Integration
    │   ├── README.md                  # 📖 Slack Setup-Anleitung
    │   ├── SETUP-GUIDE.md            # ⚙️ Detaillierte Setup-Anleitung
    │   ├── EXAMPLES.md               # 💡 Beispiele & Use-Cases
    │   └── test-slack-webhook.ps1    # 🧪 Webhook-Test-Script
    │
    ├── 📁 teams-email-integration/    # 📧 Teams & Email
    │   ├── README.md                  # 📖 Teams Setup-Anleitung
    │   ├── SCHNELLSTART.md           # 🚀 Schnellstart
    │   ├── test-teams-webhook.ps1    # 🧪 Teams-Test
    │   └── test-email-config.ps1     # 🧪 Email-Test
    │
    ├── 📁 label-triage-bot/          # 🏷️ Automatisches Labeling
    │   ├── README.md                  # 📖 Bot-Dokumentation
    │   ├── BOT-SETUP.md              # ⚙️ Bot-Setup-Anleitung
    │   ├── LABELS.md                 # 🏷️ Label-Übersicht
    │   ├── create-labels.js          # 📝 Label-Erstellung (Node.js)
    │   ├── create-labels.ps1         # 📝 Label-Erstellung (PowerShell)
    │   │
    │   └── 📁 example-code/          # 💡 Beispiel-Code für Tests
    │       ├── api-handler.js        # 🔌 API-Beispiel
    │       ├── calculator.js         # 🔢 Calculator-Beispiel
    │       ├── database.js           # 🗄️ Datenbank-Beispiel
    │       └── package.json          # 📦 NPM-Konfiguration
    │
    ├── 📁 pr-size-labeler/           # 📊 PR-Größen-Analyse
    │   ├── README.md                  # 📖 PR-Labeler-Dokumentation
    │   ├── PRESENTATION-GUIDE.md     # 🎤 Präsentations-Tipps
    │   ├── BUGFIX.md                 # 🐛 Bugfix-Dokumentation
    │   ├── create-labels.js          # 📝 Label-Erstellung (Node.js)
    │   ├── create-labels.ps1         # 📝 Label-Erstellung (PowerShell)
    │   │
    │   └── 📁 demo-files/            # 🎬 Demo-Dateien für Tests
    │       ├── README.md             # 📖 Demo-Anleitung
    │       ├── tiny-change.js        # 📄 XS-Demo (sehr klein)
    │       ├── small-feature.js      # 📄 S-Demo (klein)
    │       └── medium-feature.js     # 📄 M-Demo (mittel)
    │
    └── 📁 reusable-workflow/         # ♻️ Wiederverwendbare Workflows
        ├── README.md                  # 📖 Workflow-Dokumentation
        ├── HOW-TO-USE.md             # 🎓 Verwendungs-Anleitung
        └── example-usage.yml         # 💡 Verwendungs-Beispiel
```

---

## 📊 Datei-Kategorien

### 🌟 Wichtigste Dateien (Starte hier!)

1. **README.md** - Haupt-Dokumentation mit Übersicht
2. **QUICK-START.md** - Schnellstart in 2 Minuten
3. **SECRETS.md** - Webhook-Konfiguration
4. **start-demo.ps1** - Interaktiver Demo-Start

### 📖 Dokumentation

| Datei | Zweck | Für wen |
|-------|-------|---------|
| README.md | Projekt-Übersicht | Alle |
| QUICK-START.md | Schnellstart | Neue Benutzer |
| LIVE-DEMO-GUIDE.md | Live-Präsentation | Präsentatoren |
| PRESENTATION-GUIDE.md | Detaillierte Präsentation | Präsentatoren |
| SECRETS.md | Webhook-Setup | Admins |
| SECRETS-QUICKREF.md | Secrets Quick-Ref | Admins |
| SETUP-CHECKLIST.md | Komplette Setup-Liste | Admins |
| CONTRIBUTING.md | Contribution-Guidelines | Contributors |
| SECURITY.md | Sicherheitsrichtlinien | Security-Team |

### 🤖 GitHub Automationen

| Workflow | Trigger | Zweck |
|----------|---------|-------|
| discord-notifications.yml | Issues, PRs, Reviews | Discord-Benachrichtigungen |
| slack-notifications.yml | Issues, PRs, Pushes, Releases | Slack-Benachrichtigungen |
| teams-email-notifications.yml | Kritische Issues, Releases | Teams-Alerts |
| triage-bot.yml | Neue Issues/PRs | Auto-Labeling & Welcome |
| pr-size-labeler.yml | PRs | Größen-Analyse |
| deploy-pages.yml | Push zu main | Website-Deployment |

### 🌐 Website-Dateien

| Datei | Zweck |
|-------|-------|
| docs/index.html | TechGear Store Hauptseite |
| docs/automation-dashboard.html | Live Workflow Dashboard |
| docs/script.js | Frontend-Logik |
| docs/styles.css | Styling & Animationen |

### ⚙️ Konfigurationsdateien

| Datei | Zweck |
|-------|-------|
| .github/CODEOWNERS | Automatische Reviewer-Zuweisung |
| .github/dependabot.yml | Automatische Dependency-Updates |
| .editorconfig | Editor-Code-Style-Einstellungen |
| .gitattributes | Git Line-Ending-Handling |
| package.json | NPM-Projekt-Informationen |

### 📝 Templates

| Template | Für |
|----------|-----|
| .github/ISSUE_TEMPLATE/bug_report.md | Bug-Berichte |
| .github/ISSUE_TEMPLATE/feature_request.md | Feature-Anfragen |
| .github/ISSUE_TEMPLATE/documentation.md | Dokumentations-Issues |
| .github/ISSUE_TEMPLATE/automation.md | Automation-Probleme |
| .github/PULL_REQUEST_TEMPLATE.md | Pull Requests |

### 🧪 Test-Scripts

| Script | Testet |
|--------|--------|
| automations/discord-notifications/test-webhook.ps1 | Discord Webhook |
| automations/slack-notifications/test-slack-webhook.ps1 | Slack Webhook |
| automations/teams-email-integration/test-teams-webhook.ps1 | Teams Webhook |
| automations/label-triage-bot/create-labels.ps1 | Label-Erstellung |

---

## 🎯 Schnell-Navigation

### Du möchtest...

**...das Projekt starten?**
→ `start-demo.ps1` oder `QUICK-START.md`

**...die Website sehen?**
→ `docs/index.html` oder GitHub Pages URL

**...Webhooks konfigurieren?**
→ `SECRETS.md` oder `SECRETS-QUICKREF.md`

**...eine Präsentation vorbereiten?**
→ `LIVE-DEMO-GUIDE.md` oder `PRESENTATION-GUIDE.md`

**...zum Projekt beitragen?**
→ `CONTRIBUTING.md`

**...ein Problem melden?**
→ `.github/ISSUE_TEMPLATE/`

**...Workflows verstehen?**
→ `.github/workflows/` und `automations/*/README.md`

**...das komplette Setup machen?**
→ `SETUP-CHECKLIST.md`

---

## 📈 Datei-Statistiken

### Nach Kategorie
- 📖 **Dokumentation**: 15+ Markdown-Dateien
- 🤖 **Workflows**: 9 GitHub Actions
- 🌐 **Website**: 5 Dateien (HTML, CSS, JS)
- 🧪 **Test-Scripts**: 6 PowerShell Scripts
- ⚙️ **Konfiguration**: 8 Config-Dateien
- 📝 **Templates**: 5 Issue/PR Templates

### Gesamt
- **~50+ Dateien** im Repository
- **~10,000+ Zeilen Code** (inkl. Dokumentation)
- **9 Workflows** mit **20+ Jobs**
- **4 Integrationen** (Discord, Slack, Teams, GitHub)

---

## 🔗 Wichtige Links

- 🌐 **Live Website**: https://dinesnimalthas.github.io/Demo-Gruppe-12/
- 📊 **Dashboard**: https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html
- 🤖 **Workflows**: https://github.com/dinesnimalthas/Demo-Gruppe-12/actions
- 📝 **Issues**: https://github.com/dinesnimalthas/Demo-Gruppe-12/issues
- 🔀 **Pull Requests**: https://github.com/dinesnimalthas/Demo-Gruppe-12/pulls

---

## ℹ️ Legende

- 📄 = Einzelne Datei
- 📁 = Verzeichnis
- ⭐ = Sehr wichtig
- 🎯 = Start hier
- 🔐 = Secrets/Sicherheit
- 🤖 = Automation
- 🌐 = Website
- 📖 = Dokumentation

---

**Letzte Aktualisierung**: November 2025  
**Maintainer**: @dinesnimalthas
