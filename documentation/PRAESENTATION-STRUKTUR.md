# 🎤 Präsentationsstruktur - Demo-Gruppe-12

**IT Project Basics - HSLU 2025**  
**Gruppe 12**

**Format**: Theorie (Team) + Live-Demo (Dines)  
**Deine Rolle**: Live-Demonstration aller Features

---

## 📋 Präsentations-Ablauf

### 1️⃣ **Workflow Automatisation** (12-15 Minuten)

#### A) Theorie (Team - 5-7 Min)
*Team erklärt:*
- Was sind GitHub Actions?
- Event-Trigger Konzept
- YAML-Workflow-Struktur
- Unser modularer Ansatz

#### B) 🎬 DEINE LIVE-DEMO (7-8 Min)

**Setup**: Browser-Tabs bereit (GitHub Repo, Issues, Actions, Discord/Slack)

**Demo 1: Issue Triage Bot**
```
1. Öffne GitHub Issues
2. Klicke "New Issue"
3. → TEMPLATES erscheinen! Zeige sie kurz:
   - 🔧 Automation Issue
   - 🐛 Bug Report
   - 📚 Documentation
   - ✨ Feature Request
   - 💬 Diskussion / Frage
   - 📖 Dokumentation
   - 🎬 Live Demo Guide
4. Wähle "Bug Report" (oder "Automation Issue" für ImmoFlow-Demo)
5. Template öffnet sich mit vorausgefüllten Feldern
6. Fülle aus (schnell):
   Title: "Besichtigungstermin Villa Luzern"
   Beschreibung: "Ich möchte die 5-Zimmer Villa besichtigen"
7. Submit Issue
8. → Wechsel zu Actions Tab (Workflows laufen!)
9. → Zurück zu Issue: Labels automatisch gesetzt (viewing, bug/support, needs triage)
10. → Zeige Welcome-Kommentar vom Bot
11. Sage: "Templates + Auto-Labeling + Bot-Kommentar - alles automatisch"
```

**Demo 2: PR Size Labeler**
```
1. Öffne VS Code (schon vorbereitet)
2. Zeige Branch "demo-feature" 
3. Terminal: git push origin demo-feature
4. GitHub: Erstelle PR mit CLI
   gh pr create --title "Update Hero Section" --body "Demo PR"
5. → Wechsel zu PR: Labels erscheinen (size: S, frontend)
6. → Zeige Bot-Kommentar: "📊 Total Changes: 15 lines"
7. → Actions Tab: pr-size-labeler läuft
8. Sage: "3 Workflows arbeiten parallel"
```

**Timing**: Nicht auf langsame Workflows warten → parallel zeigen

---

### 2️⃣ **Notification System** (12-15 Minuten)

#### A) Theorie (Team - 5-7 Min)
*Team erklärt:*
- Multi-Channel Konzept
- Webhook-Integration
- Event-Routing (Discord/Slack/Teams)
- Graceful Degradation

#### B) 🎬 DEINE LIVE-DEMO (7-8 Min)

**Setup**: Discord/Slack/Teams Channels offen

**Demo 3: Multi-Channel Notifications**
```
1. Wechsel zu Discord/Slack (schon offen)
2. GitHub: Öffne existierendes Issue
3. Füge Label hinzu: "priority: high"
4. → Warte 5 Sekunden
5. → Wechsel zu Discord: 🚨 Alert erscheint (rot)
6. → Wechsel zu Slack: Strukturierte Message
7. → Wechsel zu Teams: Adaptive Card
8. Sage: "Verschiedene Channels für verschiedene Teams"
```

**Falls KEINE Webhooks**:
```
1. Öffne Workflow-Log in Actions
2. Zeige: "⚠️ Discord webhook not configured - skipping"
3. Sage: "Graceful Degradation - funktioniert auch ohne"
4. Terminal: cd automations/discord-notifications
5. Führe aus: .\test-webhook.ps1
6. Sage: "Lokales Testing möglich"
```

---

### 3️⃣ **Ecosystem Integration** (15-18 Minuten)

#### A) Theorie (Team - 7-8 Min)
*Team erklärt:*
- CODEOWNERS → Auto-Review
- Dependabot → Security Updates
- GitHub Pages → CI/CD
- Issue/PR Templates
- Kompletter Flow-Überblick

#### B) 🎬 DEINE LIVE-DEMO (8-10 Min)

**Demo 4: Website → Issue Creation (End-to-End)**
```
1. Öffne: https://dinesnimalthas.github.io/Demo-Gruppe-12/
2. Scrolle zu Support-Formular
3. Fülle live aus:
   Name: Max Mustermann
   Email: max@demo.com
   Kategorie: Besichtigungstermin
   Betreff: Villa am See
   Nachricht: Interessiert an der 5-Zimmer Villa
4. Klicke "Ticket senden" → Toast erscheint!
5. → Wechsel zu GitHub Issues: Neues Issue da!
6. → Wechsel zu Actions: 3 Workflows laufen parallel
   - label-bot: "🏡 Detected: Viewing request"
   - triage-bot: "👋 First contribution detected"
   - notifications: Läuft
7. → Zurück zu Issue: Alles automatisch gelabelt
8. → Discord/Slack: Notifications da
9. Sage: "Von Website zu Team-Notification in 15 Sekunden"
```

**Demo 5: GitHub Pages Auto-Deploy**
```
1. VS Code: Öffne docs/index.html
2. Ändere Zeile 5: <title>ImmoFlow - Live Demo 2025</title>
3. Terminal:
   git add docs/index.html
   git commit -m "chore: Update title for demo"
   git push origin main
4. → GitHub Actions: deploy-pages.yml läuft
5. → Öffne Workflow: Zeige Logs
   "🔧 Injecting GitHub Token..."
   "✅ Token successfully injected"
6. → Warte ~30 Sekunden (parallel Code zeigen)
7. → Refresh Website: Änderung ist live!
8. Sage: "Von Commit zu Live-Website in unter 60 Sekunden"
```

**Demo 6: Automation Dashboard**
```
1. Öffne: https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html
2. Scrolle durch Stats (9 Workflows)
3. Zeige Recent Runs (grüne Checkmarks)
4. Zeige Activity Feed (auto-refresh)
5. Klicke auf Workflow → Springt zu GitHub Actions
6. Sage: "Live-Monitoring aller Automationen"
```

---

### 4️⃣ **Code Deep-Dive** (Optional - 5 Min wenn Zeit)

#### A) Theorie (Team - 2 Min)
*Team erklärt:*
- Technische Architektur
- Best Practices

#### B) 🎬 DEINE LIVE-DEMO (3 Min)

**Demo 7: Code-Walkthrough**
```
1. VS Code: Öffne .github/workflows/label-bot.yml
2. Zeige (schnell durchscrollen):
   on: issues: [opened] → Event-Trigger
   script: if (titleAndBody.match(/besichtigung/)) → Keyword-Detection
3. Öffne deploy-pages.yml
4. Zeige:
   sed -i "s/PLACEHOLDER_TOKEN/..." → Token-Injection
5. Öffne docs/immoflow.js
6. Zeige: PLACEHOLDER_TOKEN im Code
7. Sage: "Secret wird beim Deploy injiziert, nie im Git"
```

---

### 5️⃣ **Fazit & Reflexion** (5-7 Minuten)

#### Team präsentiert:
- Achievements-Übersicht
- Herausforderungen & Lösungen
- Learnings (Projektmanagement + Technisch)
- Q&A

---

## 🎯 Zeitplan

| Abschnitt | Theorie (Team) | Demo (Dines) | Gesamt |
|-----------|----------------|--------------|--------|
| 1. Workflow Automatisation | 5-7 min | 7-8 min | 12-15 min |
| 2. Notification System | 5-7 min | 7-8 min | 12-15 min |
| 3. Ecosystem Integration | 7-8 min | 8-10 min | 15-18 min |
| 4. Code Deep-Dive (Optional) | 2 min | 3 min | 5 min |
| 5. Fazit & Reflexion | 5-7 min | - | 5-7 min |
| **Gesamt** | **24-31 min** | **25-29 min** | **49-60 min** |

**Buffer für Fragen**: 10-15 Minuten

---

## 📝 DEINE Demo-Checkliste

### 2️⃣ **Website → Issue Creation Flow** (8 Minuten)
**End-to-End Demo vom Formular bis zur Notification**

---

## 📝 DEINE Demo-Checkliste

### VOR der Präsentation (30 Min vorher):

#### Browser vorbereiten (9 Tabs IN REIHENFOLGE):
1. ✅ GitHub Repository (Main)
2. ✅ GitHub Issues (leer)
3. ✅ GitHub Actions (Overview)
4. ✅ Website: https://dinesnimalthas.github.io/Demo-Gruppe-12/
5. ✅ Dashboard: https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html
6. ✅ Discord Channel (falls Webhooks)
7. ✅ Slack Channel (falls Webhooks)
8. ✅ Teams Channel (falls Webhooks)
9. ✅ VS Code Web (für schnellen Code-Blick)

#### VS Code vorbereiten:
- ✅ Projekt geöffnet
- ✅ Terminal in Projekt-Root
- ✅ Git konfiguriert
- ✅ Wichtige Files in Tabs:
  - `.github/workflows/label-bot.yml`
  - `.github/workflows/deploy-pages.yml`
  - `docs/index.html`
  - `docs/immoflow.js`

#### Git vorbereiten:
```powershell
# Demo-Branch erstellen (VORHER!)
git checkout -b demo-feature
# Kleine Änderung in docs/index.html (Zeile 5 markieren)
# NICHT committen - das machst du live!
git checkout main
```

#### Formular-Text bereit (Copy-Paste):
```
# Falls du "Blank issue" verwendest:
Title: Besichtigungstermin Villa am See
Body: Ich interessiere mich für die 5-Zimmer Villa mit Seeblick in Luzern. 
Wann wäre ein Besichtigungstermin möglich?

# Falls du Template verwendest:
Einfach die vorausgefüllten Felder anpassen
Bug Report → Ändere zu: "Problem mit Besichtigungstermin-Buchung"
Oder: Automation Issue → Perfekt für ImmoFlow-Demo!
```

#### Test VORHER (1 Stunde vor Präsentation):
- ✅ Issue erstellen (dann löschen)
- ✅ Website-Formular funktioniert
- ✅ Dashboard lädt
- ✅ Git push funktioniert
- ✅ Webhooks funktionieren (oder wissen dass sie fehlen)

### WÄHREND deiner Demo:

#### Dein Mantra:
> **"Show, don't tell. Schnell wechseln. Parallel zeigen."**

#### Timing-Tricks:
- ⏱️ Workflows brauchen 5-20 Sek → Währenddessen nächsten Tab öffnen
- ⏱️ Deploy dauert ~60 Sek → Code-Walkthrough währenddessen
- ⏱️ Wenn Team Theorie macht → Prüfe ob alle Tabs bereit sind

#### Wenn etwas schief geht:

**Workflow läuft nicht**:
- Zeige Actions-Log: "Hier würde man sehen..."
- Gehe weiter zur nächsten Demo

**Webhook fehlt**:
- Zeige Log: "⚠️ webhook not configured - skipping"
- Sage: "Graceful Degradation - ein Feature!"
- Zeige Test-Script als Backup

**GitHub langsam**:
- Sage: "Während GitHub lädt..."
- Wechsel zu VS Code, zeige Code
- Komm später zurück

**Vergessen wo du bist**:
- Blick auf diese Checkliste (ausgedruckt!)
- Atmen, lächeln, weitermachen

---

## 🎬 PowerShell Quick Commands (für dich)

```powershell
# Projektverzeichnis
cd "C:\Users\dines\OneDrive - Hochschule Luzern\Dokumente\SJ_01\Semester 1\IT Project Basics\Code\Demo-Gruppe-12"

# Demo 2: PR erstellen
git checkout demo-feature
# [VS Code: Zeige Änderung]
git add .
git commit -m "feat: Update hero section for demo"
git push origin demo-feature
gh pr create --title "✨ Update Hero Section" --body "Live Demo PR"

# Demo 5: Deploy
git checkout main
# [VS Code: Ändere docs/index.html Zeile 5]
git add docs/index.html
git commit -m "chore: Update title for live demo"
git push origin main

# Falls Webhook-Test nötig
cd automations/discord-notifications
.\test-webhook.ps1

# Schnell zu GitHub springen
gh repo view --web
Start-Process "https://github.com/dinesnimalthas/Demo-Gruppe-12/actions"
```

---

## 💡 Deine Demo-Tipps

### DO's ✅:
- **Sei enthusiastisch!** Energie überträgt sich
- **Parallel arbeiten**: Während etwas lädt → nächsten Tab vorbereiten
- **Zeige Erfolge sofort**: Grüne Checkmarks, Labels, Notifications
- **Emojis betonen**: 🏷️ ✅ 🚨 - macht Logs lebendig
- **Kurze Kommentare**: "Automatisch in 10 Sekunden", "Alles parallel"

### DON'Ts ❌:
- **Nicht warten**: Workflow braucht 30 Sek? Zeige was anderes
- **Nicht entschuldigen**: Fehlt ein Webhook? Ist ein Feature (Graceful Degradation)!
- **Nicht jede Zeile lesen**: Code nur antippen, nicht erklären
- **Nicht Panik**: Geht was schief? Lächeln, weitermachen

### Übergänge (was du sagst):
- Nach Issue-Demo: *"Das war Issue-Automation. Jetzt Pull Requests..."*
- Nach Notifications: *"Multi-Channel läuft. Jetzt End-to-End..."*
- Nach Deploy: *"Website ist live. Schauen wir das Dashboard..."*
- Vor Code: *"Und wie funktioniert das? Kurzer Code-Blick..."*

---

## 🎤 Deine Sprechnotizen

### Wenn du anfängst (nach Team-Theorie):
> *"Okay, schauen wir das live an..."* [Öffne ersten Tab]

### Bei jeder Demo:
1. **Ansage** (5 Sek): "Ich erstelle jetzt ein Issue..."
2. **Aktion** (zeigen, tippen, klicken)
3. **Ergebnis zeigen** (15 Sek): "Labels automatisch, Kommentar da!"
4. **Quick Summary** (5 Sek): "Alles in 10 Sekunden"

### Wenn Team wieder übernimmt:
> *"Das war's von meiner Seite zu [Thema]. Zurück an euch..."*

---

## 🔥 Notfall-Backup

### Plan B (falls Internet/GitHub ausfällt):

1. **Screenshots vorbereitet** (in `documentation/screenshots/`):
   - Issue mit Labels
   - PR mit Size-Label
   - Discord Notification
   - Dashboard
   - Workflow-Logs

2. **Screen Recording** (~2 Min):
   - Kompletter End-to-End Flow
   - Auf Desktop bereit zum Abspielen

3. **Ansage**:
   > *"GitHub ist gerade langsam, ich zeige euch die aufgezeichnete Version..."*

---

## ✅ Last-Minute Checkliste (5 Min vor Präsentation)

- [ ] Alle Browser-Tabs offen und geordnet
- [ ] VS Code offen mit richtigen Files
- [ ] Terminal in richtigem Verzeichnis
- [ ] Git Status clean (`git status`)
- [ ] Demo-Branch existiert
- [ ] Formular-Text kopiert (im Clipboard)
- [ ] Handy auf lautlos
- [ ] Notifications auf PC aus
- [ ] Diese Checkliste ausgedruckt oder auf 2. Bildschirm
- [ ] Tief durchatmen 😊

---

## 🎯 Dein Erfolgsrezept

1. **Vorbereitung ist alles** → 30 Min vorher Setup fertig
2. **Show, don't tell** → Wenig reden, viel zeigen
3. **Energie & Tempo** → Schnell zwischen Tabs, enthusiastisch
4. **Fehler sind OK** → Lächeln, weitermachen
5. **Hab Spaß!** → Das Projekt ist geil, zeig es! 🚀

---

**DEINE DEMO-DAUER**: 25-29 Minuten (7 Demos)  
**TEAM-THEORIE**: 24-31 Minuten  
**GESAMT**: ~50-60 Minuten + Q&A

**Du schaffst das! 🎉**

### 8️⃣ **Projekt-Reflexion & Fazit** (5 Minuten)
**Was haben wir erreicht?**

#### Zeige im Browser (Quick Clicks):

1. **GitHub Repository Overview**:
   - README scrollen → Zeige Badges, Flow-Diagram
   - Zeige: 9 Workflows, 50+ Files, Vollständige Dokumentation

2. **Achievements-Übersicht** (Tab durch Features):
   ```
   ✅ 9 GitHub Actions Workflows → Vollautomatisiert
   ✅ 4 Notification-Channels → Multi-Platform
   ✅ ImmoFlow-spezifische Labels → viewing, financing, contract, support
   ✅ CODEOWNERS Integration → Auto-Review
   ✅ GitHub Pages CI/CD → Auto-Deploy
   ✅ Graceful Degradation → Funktioniert auch ohne Secrets
   ✅ Dependabot → Automatische Security-Updates
   ✅ Live Dashboard → Real-time Monitoring
   ✅ Test-Scripts → Lokales Testing
   ```

3. **Dokumentation zeigen** (Quick Scroll):
   - `README.md` → Demo-Flow-Diagram
   - `QUICK-START.md` → 2-Minuten Setup
   - `SECRETS.md` → Webhook-Konfiguration
   - Automations-Folder → Jedes Feature dokumentiert

4. **Herausforderungen & Lösungen**:
   - ❌ Problem: Webhooks für Demo nicht verfügbar
   - ✅ Lösung: Graceful Degradation in allen Workflows
   - ❌ Problem: Token-Management für Website
   - ✅ Lösung: Deployment-Time Injection via sed
   - ❌ Problem: Testing ohne Production-Webhooks
   - ✅ Lösung: PowerShell Test-Scripts

5. **Learnings** (Quick Mentions):
   - GitHub Actions sind mächtig aber komplex
   - Modularer Ansatz = bessere Wartbarkeit
   - Dokumentation von Tag 1 spart Zeit
   - Fail-Safe Design wichtig (Graceful Degradation)
   - Testing-Strategie essentiell

#### Schlusswort:
> *"Von der ersten Kundenanfrage bis zum automatischen Deployment – alles automatisiert, dokumentiert und Open Source. Das ist moderne DevOps-Praxis in einem studentischen Projekt."*

**Live-Links zeigen**:
- 🌐 Repo: https://github.com/dinesnimalthas/Demo-Gruppe-12
- 📊 Dashboard: https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html
- 📖 Docs: Siehe README.md

**Abschluss**: *"Danke für eure Aufmerksamkeit! Fragen?"*

---

## 🎯 Zeitplan (Optimiert für reine Demo)

| Abschnitt | Dauer | Gesamt |
|-----------|-------|--------|
| 1. Intro & Projekt-Übersicht | 2 min | 0:02 |
| 2. Website → Issue Creation Flow | 8 min | 0:10 |
| 3. Pull Request Automation | 7 min | 0:17 |
| 4. Multi-Channel Notifications | 6 min | 0:23 |
| 5. GitHub Pages Auto-Deploy | 4 min | 0:27 |
| 6. Automation Dashboard | 3 min | 0:30 |
| 7. Code Deep-Dive | 5 min | 0:35 |
| 8. Projekt-Reflexion & Fazit | 5 min | 0:40 |
| **Gesamt** | **40 min** | **~40 min** |

**Buffer für Fragen**: 10-20 Minuten  
**Perfekt für 1-Stunden-Slot!**

---

## 📝 Demo-Checkliste

### VOR der Präsentation:

#### Browser-Tabs (IN DIESER REIHENFOLGE):
1. ✅ GitHub Repository (Main Page)
2. ✅ GitHub Issues (leer, bereit für neue)
3. ✅ GitHub Actions (Overview)
4. ✅ Website: https://dinesnimalthas.github.io/Demo-Gruppe-12/
5. ✅ Dashboard: https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html
6. ✅ Discord/Slack/Teams (falls Webhooks aktiv)

#### Software offen:
- ✅ VS Code mit Projekt geöffnet
- ✅ PowerShell Terminal (in Projekt-Root)
- ✅ Git konfiguriert und bereit

#### Vorbereitet:
- ✅ Test-Branch bereit für PR-Demo
- ✅ Formular-Daten zum Copy-Paste:
  ```
  Name: Max Mustermann
  Email: max@demo.com
  Kategorie: Besichtigungstermin
  Betreff: Villa am See Luzern
  Nachricht: Ich interessiere mich für die 5-Zimmer Villa
  ```

#### Backup:
- ✅ Screenshots von erfolgreichen Workflows (falls GitHub langsam)
- ✅ Screen Recording der wichtigsten Flows (falls Demo fehlschlägt)

---

## 🎬 PowerShell Quick Commands

```powershell
# Projekt-Root öffnen
cd "c:\Users\dines\OneDrive - Hochschule Luzern\Dokumente\SJ_01\Semester 1\IT Project Basics\Code\Demo-Gruppe-12"

# Demo-Branch für PR
git checkout -b demo-feature
# [Änderung in VS Code]
git add .
git commit -m "feat: Demo feature"
git push origin demo-feature

# PR erstellen (GitHub CLI)
gh pr create --title "✨ Demo Feature" --body "Live Demo PR"

# Webhook testen (falls Zeit)
cd automations/discord-notifications
.\test-webhook.ps1

# Repository im Browser öffnen
gh repo view --web

# Actions direkt öffnen
Start-Process "https://github.com/dinesnimalthas/Demo-Gruppe-12/actions"

# Website öffnen
Start-Process "https://dinesnimalthas.github.io/Demo-Gruppe-12/"
```

---

## 💡 Demo-Tipps

### Während der Demo:

**DO's** ✅:
- Zeigen, nicht erklären
- Parallel arbeiten (Tabs schnell wechseln)
- Workflows in Echtzeit verfolgen
- Logs mit Emojis hervorheben 🏷️ ✅ 🚨
- Erfolge sofort zeigen (Grüne Checkmarks!)
- Code nur kurz antippen (nicht lesen)

**DON'Ts** ❌:
- Keine langen Theorie-Erklärungen
- Nicht auf langsame Workflows warten (weiter zur nächsten Demo)
- Nicht jede Code-Zeile erklären
- Nicht bei Fehlern stecken bleiben (Backup nutzen)

### Wenn etwas schief geht:

1. **Workflow läuft nicht**: 
   - *"Das ist der Workflow-Log - hier sieht man normalerweise..."*
   - Zeige Screenshot/Recording

2. **Webhook fehlt**:
   - *"Graceful Degradation - siehe Log: 'webhook not configured - skipping'"*
   - Ist ein Feature, kein Bug!

3. **GitHub langsam**:
   - *"Während GitHub lädt, zeige ich den Code..."*
   - Wechsel zu VS Code

### Timing-Tricks:

- ⏱️ Workflows brauchen 5-20 Sekunden → In der Zeit nächsten Tab vorbereiten
- ⏱️ Deploy dauert ~60 Sekunden → Code-Deep-Dive währenddessen
- ⏱️ Issue-Creation instant → Direkt Actions Tab zeigen

---

## 🎤 Sprechnotizen (Kurz & Knackig)

### Opening (30 Sekunden):
> "Herzlich willkommen! Ich zeige euch heute unser Automation-System - 9 Workflows, die von der Kundenanfrage bis zum Deployment alles automatisieren. Keine Theorie - nur Live-Demo. Los geht's!"

### Transitions (Jeweils 5 Sekunden):
- Nach Website-Demo: *"Issue erstellt - schauen wir uns Pull Requests an..."*
- Nach PR-Demo: *"Jetzt die Notifications..."*
- Nach Notifications: *"Deployment..."*
- Vor Fazit: *"Und zum Abschluss..."*

### Closing (30 Sekunden):
> "40 Minuten, 8 Live-Demos, 9 Workflows in Aktion. Von Website bis Deployment - alles automatisch. Code und Docs sind Open Source auf GitHub. Fragen?"

---

## 🔗 Quick Links (Desktop-Shortcuts empfohlen)

- Repo: https://github.com/dinesnimalthas/Demo-Gruppe-12
- Actions: https://github.com/dinesnimalthas/Demo-Gruppe-12/actions
- Website: https://dinesnimalthas.github.io/Demo-Gruppe-12/
- Dashboard: https://dinesnimalthas.github.io/Demo-Gruppe-12/automation-dashboard.html

---

**Format**: Reine Demonstration, kein Theorie-Input  
**Dauer**: 40 Minuten + Q&A  
**Style**: Show, don't tell!  

**🎉 Viel Erfolg mit der Live-Demo!**
