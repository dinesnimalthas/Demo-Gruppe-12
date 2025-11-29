# 📋 Repository Setup - Komplette Checkliste

Diese Checkliste führt dich durch alle notwendigen Schritte, um das Repository vollständig einzurichten und professionell zu nutzen.

## ✅ Phase 1: Basis-Setup (Sofort verfügbar)

### 1.1 Repository geklont
- [x] Repository lokal geklont
- [x] Alle Dateien vorhanden
- [x] Git funktioniert

### 1.2 Dokumentation vorhanden
- [x] README.md - Hauptdokumentation
- [x] QUICK-START.md - Schnellstart
- [x] LIVE-DEMO-GUIDE.md - Präsentationsanleitung
- [x] SECRETS.md - Webhook-Konfiguration
- [x] CONTRIBUTING.md - Contribution Guidelines
- [x] SECURITY.md - Sicherheitsrichtlinien

### 1.3 Demo lauffähig
```powershell
# Test ob Demo startet:
.\start-demo.ps1
```
- [ ] Script läuft ohne Fehler
- [ ] Website öffnet sich
- [ ] Alle Links funktionieren

---

## ✅ Phase 2: GitHub Repository Settings

### 2.1 Repository Basics
**Pfad**: Settings → General

- [ ] **Repository Name**: `Demo-Gruppe-12`
- [ ] **Description**: 
  ```
  TechGear Store - GitHub Actions Automation Demo | HSLU IT Project Basics 2025 | Discord, Slack, Teams Integration
  ```
- [ ] **Topics/Keywords** hinzufügen:
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

### 2.2 Features aktivieren
**Pfad**: Settings → General → Features

- [ ] ✅ Issues
- [ ] ✅ Projects (optional)
- [ ] ✅ Wiki (optional)
- [ ] ✅ Discussions (empfohlen für Q&A)

**Pull Requests**:
- [ ] ✅ Allow merge commits
- [ ] ✅ Allow squash merging
- [ ] ✅ Allow rebase merging
- [ ] ✅ Always suggest updating pull request branches
- [ ] ✅ Allow auto-merge
- [ ] ✅ Automatically delete head branches

### 2.3 GitHub Pages aktivieren
**Pfad**: Settings → Pages

- [ ] **Source**: Deploy from a branch
- [ ] **Branch**: `main`
- [ ] **Folder**: `/docs`
- [ ] ✅ Enforce HTTPS
- [ ] **Save** klicken
- [ ] Warte 1-2 Minuten
- [ ] Öffne: `https://[username].github.io/Demo-Gruppe-12/`
- [ ] Teste: Website lädt korrekt

---

## ✅ Phase 3: Secrets & Webhooks (Optional aber empfohlen)

### 3.1 Discord Integration
**Pfad**: Settings → Secrets and variables → Actions → New repository secret

1. **Discord Webhook erstellen**:
   - Öffne Discord Server
   - Server Settings → Integrations → Webhooks
   - "New Webhook" → Wähle Channel (z.B. `#github-notifications`)
   - Kopiere Webhook URL

2. **Secret hinzufügen**:
   - Name: `DISCORD_WEBHOOK_URL`
   - Value: `https://discord.com/api/webhooks/...`
   - [ ] Secret hinzugefügt

3. **Testen**:
   ```powershell
   .\automations\discord-notifications\test-webhook.ps1
   ```
   - [ ] Nachricht erscheint in Discord

### 3.2 Slack Integration
1. **Slack Webhook erstellen**:
   - Gehe zu [api.slack.com/apps](https://api.slack.com/apps)
   - "Create New App" → "From scratch"
   - Name: "GitHub Notifications"
   - Wähle Workspace
   - "Incoming Webhooks" → Aktivieren
   - "Add New Webhook to Workspace"
   - Wähle Channel (z.B. `#github`)
   - Kopiere Webhook URL

2. **Secret hinzufügen**:
   - Name: `SLACK_WEBHOOK_URL`
   - Value: `https://hooks.slack.com/services/...`
   - [ ] Secret hinzugefügt

3. **Testen**:
   ```powershell
   .\automations\slack-notifications\test-slack-webhook.ps1
   ```
   - [ ] Nachricht erscheint in Slack

### 3.3 Microsoft Teams Integration (Optional)
1. **Teams Webhook erstellen**:
   - Öffne Microsoft Teams
   - Gehe zum Channel
   - "..." → "Workflows"
   - Suche: "Post to a channel when a webhook request is received"
   - "Add workflow"
   - Kopiere Webhook URL

2. **Secret hinzufügen**:
   - Name: `TEAMS_WEBHOOK_URL`
   - Value: `https://[tenant].webhook.office.com/...`
   - [ ] Secret hinzugefügt

3. **Testen**:
   ```powershell
   .\automations\teams-email-integration\test-teams-webhook.ps1
   ```
   - [ ] Nachricht erscheint in Teams

### 3.4 Secrets Übersicht
**Pfad**: Settings → Secrets and variables → Actions

Prüfe dass folgende Secrets existieren:
- [ ] `DISCORD_WEBHOOK_URL` (optional)
- [ ] `SLACK_WEBHOOK_URL` (optional)
- [ ] `TEAMS_WEBHOOK_URL` (optional)
- [x] `GITHUB_TOKEN` (automatisch vorhanden)

**Hinweis**: Workflows funktionieren auch OHNE diese Secrets (Graceful Degradation)!

---

## ✅ Phase 4: Branch Protection & CODEOWNERS

### 4.1 Branch Protection aktivieren
**Pfad**: Settings → Branches → Add rule

**Branch name pattern**: `main`

**Protect matching branches**:
- [ ] ✅ Require a pull request before merging
  - [ ] Required approvals: **1**
  - [ ] ✅ Dismiss stale pull request approvals when new commits are pushed
  - [ ] ✅ Require review from Code Owners

- [ ] ✅ Require status checks to pass before merging
  - [ ] ✅ Require branches to be up to date before merging
  - [ ] Status checks (füge hinzu wenn verfügbar):
    - `triage` (Triage Bot)
    - `pr-size-labeler` (PR Size Labeler)

- [ ] ✅ Require conversation resolution before merging
- [ ] ✅ Require signed commits (optional)
- [ ] ✅ Require linear history (optional)

- [ ] ❌ Do not allow bypassing the above settings
- [ ] ⚠️ Restrict who can push to matching branches
  - [ ] Nur Maintainer

- [ ] ✅ Allow force pushes: Specify who can force push (Maintainer only)
- [ ] ❌ Allow deletions

- [ ] **Create** klicken

### 4.2 CODEOWNERS verifizieren
**Datei**: `.github/CODEOWNERS`

- [x] Datei existiert
- [ ] Prüfe ob dein Username korrekt ist:
  ```
  * @dinesnimalthas
  ```
- [ ] Falls andere Contributors: Passe Datei an
- [ ] Committe Änderungen

**Test**:
1. Erstelle Test-PR
2. Prüfe ob Reviewer automatisch zugewiesen werden
3. [ ] Auto-Assignment funktioniert

---

## ✅ Phase 5: Labels erstellen

### 5.1 Automatische Labels (via Workflows)
Diese Labels werden automatisch erstellt:
- `needs triage` - Vom Triage Bot
- `size/XS`, `size/S`, `size/M`, `size/L`, `size/XL` - Vom PR Size Labeler

### 5.2 Manuelle Labels erstellen

**Option A: Via PowerShell**
```powershell
cd automations/label-triage-bot
.\create-labels.ps1
```

**Option B: Via Node.js**
```powershell
cd automations/label-triage-bot
node create-labels.js
```

**Option C: Manuell via GitHub UI**
**Pfad**: Issues → Labels → New label

Erstelle folgende Labels:

| Name | Color | Description |
|------|-------|-------------|
| `bug` | `#d73a4a` | Fehler im Code |
| `enhancement` | `#a2eeef` | Neue Features |
| `documentation` | `#0075ca` | Dokumentations-Verbesserungen |
| `automation` | `#7057ff` | GitHub Actions / Workflows |
| `good first issue` | `#7057ff` | Gut für Einsteiger |
| `help wanted` | `#008672` | Extra Aufmerksamkeit |
| `priority: high` | `#d73a4a` | Hohe Priorität |
| `priority: medium` | `#fbca04` | Mittlere Priorität |
| `priority: low` | `#e4e669` | Niedrige Priorität |
| `wontfix` | `#ffffff` | Wird nicht bearbeitet |
| `duplicate` | `#cfd3d7` | Duplikat |
| `invalid` | `#e4e669` | Ungültig |
| `question` | `#d876e3` | Frage |
| `needs review` | `#fbca04` | Benötigt Review |

- [ ] Alle Labels erstellt

---

## ✅ Phase 6: Dependabot aktivieren

### 6.1 Dependabot konfigurieren
**Datei**: `.github/dependabot.yml`

- [x] Datei existiert
- [ ] Prüfe Konfiguration

### 6.2 Dependabot in Settings aktivieren
**Pfad**: Settings → Code security and analysis

- [ ] ✅ Dependency graph (sollte schon aktiviert sein)
- [ ] ✅ Dependabot alerts
- [ ] ✅ Dependabot security updates

**Nach 1 Woche prüfen**:
- [ ] Dependabot hat PRs erstellt (falls Updates verfügbar)

---

## ✅ Phase 7: Testing & Validation

### 7.1 Workflows testen

#### Test 1: Triage Bot
```powershell
# Issue erstellen
gh issue create --title "Test Issue" --body "Test für Triage Bot" --label "bug"
```
- [ ] Issue erstellt
- [ ] Gehe zu Actions → "Triage Bot"
- [ ] Workflow läuft erfolgreich
- [ ] Label `needs triage` wurde hinzugefügt
- [ ] Welcome Comment vorhanden (bei First Contribution)

#### Test 2: PR Size Labeler
```powershell
# Kleine Änderung machen
echo "# Test" >> TEST.md
git add TEST.md
git commit -m "test: Add test file"
git push origin -u test-branch

# PR erstellen
gh pr create --title "Test PR" --body "Test für PR Size Labeler"
```
- [ ] PR erstellt
- [ ] Gehe zu Actions → "PR Size Labeler"
- [ ] Workflow läuft erfolgreich
- [ ] Size Label wurde hinzugefügt (wahrscheinlich `size/XS`)

#### Test 3: Discord Notifications (wenn konfiguriert)
- [ ] Erstelle neues Issue
- [ ] Prüfe Discord Channel
- [ ] Nachricht empfangen

#### Test 4: Slack Notifications (wenn konfiguriert)
- [ ] Erstelle neues Issue
- [ ] Prüfe Slack Channel
- [ ] Nachricht empfangen

#### Test 5: Teams Notifications (wenn konfiguriert)
- [ ] Erstelle kritisches Issue mit Label `priority: high`
- [ ] Prüfe Teams Channel
- [ ] Nachricht empfangen

### 7.2 Website testen
- [ ] Öffne `https://[username].github.io/Demo-Gruppe-12/`
- [ ] Alle Sektionen laden korrekt
- [ ] Bilder werden angezeigt
- [ ] Animations funktionieren
- [ ] Support-Formular öffnet sich
- [ ] Mobile Ansicht funktioniert

### 7.3 Dashboard testen
- [ ] Öffne Automation Dashboard
- [ ] Workflow-Statistiken werden angezeigt
- [ ] Links funktionieren

---

## ✅ Phase 8: Dokumentation finalisieren

### 8.1 Team-Informationen aktualisieren
**Datei**: `README.md` → Abschnitt "Team - Gruppe 12"

```markdown
## 👥 Team - Gruppe 12

- **Project Lead**: [Name] - @username
- **Development**: [Name] - @username
- **Design**: [Name] - @username
- **DevOps**: [Name] - @username
- **Documentation**: [Name] - @username
```
- [ ] Namen eingetragen

### 8.2 Präsentations-Details
**Datei**: `README.md` → Abschnitt "Hochschule Luzern"

```markdown
## 🎓 Hochschule Luzern - IT Project Basics

**Semester**: HS 2025  
**Modul**: IT Project Basics  
**Dozent**: [Dozent Name]  
**Abgabedatum**: [Datum]
```
- [ ] Informationen ausgefüllt

### 8.3 SECURITY.md anpassen
**Datei**: `SECURITY.md`

Ersetze Platzhalter:
```markdown
Stattdessen sende bitte eine E-Mail an: **[deine-email@example.com]**
```
- [ ] Email-Adresse eingetragen

### 8.4 Alle Dokumente durchlesen
- [ ] README.md
- [ ] QUICK-START.md
- [ ] LIVE-DEMO-GUIDE.md
- [ ] SECRETS.md
- [ ] CONTRIBUTING.md
- [ ] SECURITY.md

---

## ✅ Phase 9: Live-Demo vorbereiten

### 9.1 Demo-Checklist abarbeiten
**Datei**: `LIVE-DEMO-GUIDE.md`

- [ ] Alle Steps durchgegangen
- [ ] Screenshots/Videos vorbereitet (optional)
- [ ] Backup-Plan erstellt (falls Internet ausfällt)

### 9.2 Präsentation üben
- [ ] Mit Team durchgesprochen
- [ ] Timing geprüft (10-15 Minuten)
- [ ] Fragen & Antworten vorbereitet

### 9.3 Technisches Setup
- [ ] Laptop geladen
- [ ] Internet-Verbindung geprüft
- [ ] Browser-Tabs vorbereitet:
  - [ ] GitHub Repository
  - [ ] GitHub Actions
  - [ ] Website (GitHub Pages)
  - [ ] Automation Dashboard
  - [ ] Discord/Slack (falls konfiguriert)
- [ ] Screen-Sharing getestet

---

## 🎯 Final Check: Alles bereit?

### Basis-Funktionalität
- [ ] Repository ist öffentlich/privat wie gewünscht
- [ ] README ist vollständig und aktuell
- [ ] Alle Workflows laufen erfolgreich
- [ ] Website ist live und funktioniert
- [ ] Labels sind erstellt

### Optionale Features (wenn gewünscht)
- [ ] Discord Integration funktioniert
- [ ] Slack Integration funktioniert
- [ ] Teams Integration funktioniert
- [ ] CODEOWNERS mit Branch Protection
- [ ] Dependabot läuft

### Dokumentation
- [ ] Alle README-Dateien sind aktuell
- [ ] SECRETS.md ist vollständig
- [ ] Team-Informationen sind eingetragen
- [ ] Kontakt-Informationen sind korrekt

### Demo-Bereitschaft
- [ ] Live-Demo wurde geübt
- [ ] Alle Test-Szenarien funktionieren
- [ ] Backup-Plan existiert
- [ ] Präsentations-Material ist fertig

---

## 🚀 Los geht's!

Wenn alle Checkboxen ✅ sind, bist du bereit für:
1. ✨ Eine erfolgreiche Präsentation
2. 🎬 Eine beeindruckende Live-Demo
3. 🏆 Ein professionelles GitHub-Repository

**Viel Erfolg! 🎉**

---

## 📞 Support

Bei Problemen:
1. Prüfe [SECRETS.md](SECRETS.md) für Webhook-Konfiguration
2. Prüfe [TROUBLESHOOTING](SECRETS.md#-troubleshooting) Sektion
3. Öffne ein Issue mit der entsprechenden Vorlage
4. Kontaktiere @dinesnimalthas

---

**Erstellt**: November 2025  
**Maintainer**: @dinesnimalthas  
**Version**: 1.0
