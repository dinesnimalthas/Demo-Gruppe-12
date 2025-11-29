# 🎯 Live-Demo Guide für Präsentation

## Agenda-Übersicht

### 1️⃣ Workflow Automatisation
- **Theorie**: Was sind GitHub Actions, Workflows, Triggers
- **Live-Demo**: Support-Formular absenden → Issue wird erstellt

### 2️⃣ Notification System  
- **Theorie**: Teams, Discord, Slack Integration
- **Live-Demo**: Issue erstellen → Teams/Discord Benachrichtigung

### 3️⃣ Ecosystem Integration
- **Theorie**: Verschiedene Plattformen verbinden
- **Live-Demo**: PR erstellen → Automatisches Labeling → Notifications

### 4️⃣ Projektmanagement
- **Theorie**: Lens & Fazit
- **Live-Demo**: Dashboard zeigen, Metriken erklären

---

## 📋 Detaillierte Demo-Schritte

### Demo 1: Workflow Automatisation (5-7 Min)

#### Vorbereitung:
1. Website `index.html` im Browser öffnen
2. GitHub Repository in separatem Tab öffnen (Issues-Seite)
3. Automation Dashboard bereit haben

#### Demo-Ablauf:

**Schritt 1: Theorie (2 Min)**
- "Wir haben GitHub Actions implementiert"
- "Workflows automatisieren repetitive Tasks"
- Zeige `.github/workflows/` Ordner im VS Code

**Schritt 2: Live-Demo (3-5 Min)**
```
1. Scrolle auf Website zu Support-Formular
2. Fülle Formular aus:
   - Name: "Demo User"
   - Email: "demo@test.ch"
   - Problem: "Bug" auswählen
   - Beschreibung: "Dies ist eine Demo-Anfrage für die Präsentation"
   - [x] Dringend markieren
   
3. Klicke "Anfrage senden"
4. Zeige Success-Message mit Ticket-Nummer

5. Wechsle zu GitHub → Issues
6. Zeige das neu erstellte Issue:
   - Automatische Labels (bug, critical, priority:high)
   - Formatierter Issue-Body
   - Timestamp
   
7. Erkläre: "Alles automatisch in 2 Sekunden"
```

**Wichtig:**
- GitHub PAT muss vorher in `script.js` konfiguriert sein
- Teste vorher einmal, dass es funktioniert!

---

### Demo 2: Notification System (5-7 Min)

#### Vorbereitung:
1. Teams Desktop-App öffnen (oder Browser-Tab)
2. Discord Desktop-App öffnen (falls vorhanden)
3. Test-Webhook-Scripts bereit haben

#### Demo-Ablauf:

**Schritt 1: Theorie (2 Min)**
- "Notifications gehen automatisch an verschiedene Plattformen"
- Zeige Workflow-Datei `label-triage-bot.yml`
- Erkläre Webhooks

**Schritt 2: Live-Demo - Teams (2-3 Min)**
```
1. Öffne PowerShell/Terminal
2. Navigiere zu: automations/teams-email-integration/
3. Führe aus: ./test-teams-webhook.ps1
4. Wechsle zu Teams
5. Zeige empfangene Nachricht im Channel
6. Erkläre: "So werden echte Issues gemeldet"
```

**Schritt 3: Live-Demo - Discord (2 Min)**
```
1. Navigiere zu: automations/discord-notifications/
2. Führe aus: ./test-webhook.ps1
3. Wechsle zu Discord
4. Zeige Nachricht mit Embed-Format
5. Erkläre: "Verschiedene Teams können verschiedene Plattformen nutzen"
```

**Alternative (falls Webhooks nicht funktionieren):**
- Zeige Screenshots von erfolgreichen Notifications
- Öffne die Workflow-Logs auf GitHub
- Erkläre anhand der Logs, was passiert

---

### Demo 3: Ecosystem Integration (5-7 Min)

#### Vorbereitung:
1. Erstelle vorher einen Branch: `demo/test-pr`
2. Mache kleine Änderung (z.B. README anpassen)
3. Halte alles bereit für schnellen PR

#### Demo-Ablauf:

**Schritt 1: Theorie (2 Min)**
- "Verschiedene Automationen arbeiten zusammen"
- Zeige Diagramm/Flowchart der Integration
- Erkläre PR Size Labeler

**Schritt 2: Live-Demo - PR Size Labeler (3-5 Min)**
```
1. Öffne VS Code
2. Mache schnelle Änderung in demo-files/tiny-change.js
   (z.B. Kommentar hinzufügen: "// Demo change")
   
3. Git:
   git checkout -b demo/tiny-change
   git add .
   git commit -m "demo: tiny change"
   git push origin demo/tiny-change
   
4. Öffne GitHub → Pull Requests
5. Erstelle neuen PR
6. Warte 5-10 Sekunden
7. Zeige automatisches Label "size/xs"
8. Zeige PR-Kommentar mit Details

9. Erkläre: "Bei größeren PRs würde 'size/l' oder 'size/xl' erscheinen"
```

**Demo - Reusable Workflow (2 Min)**
```
1. Zeige .github/workflows/reusable-workflow.yml
2. Zeige example-usage.yml
3. Erkläre: "Workflows können wiederverwendet werden"
4. Zeige auf GitHub: Actions → Workflows
```

---

### Demo 4: Projektmanagement & Dashboard (5 Min)

#### Vorbereitung:
1. `automation-dashboard.html` im Browser öffnen
2. GitHub Insights/Analytics bereit haben

#### Demo-Ablauf:

**Schritt 1: Dashboard (3 Min)**
```
1. Öffne automation-dashboard.html
2. Zeige Live Stats:
   - Active Workflows: 4
   - Support Tickets: X (echte Zahl)
   - Response Time: 2.4h
   - Success Rate: 94%
   
3. Scrolle zu Workflow Cards
4. Erkläre jede Automation:
   - Label Triage Bot
   - Discord Notifications
   - PR Size Labeler
   - Reusable Workflow
   
5. Zeige Activity Timeline
6. Zeige Workflow Steps Visualization
```

**Schritt 2: GitHub Insights (2 Min)**
```
1. Gehe zu GitHub → Insights
2. Zeige Actions:
   - Workflow runs
   - Success/Failure Rate
   - Execution Times
   
3. Zeige Issues:
   - Labels Distribution
   - Response Times
   - Closed Issues
```

---

## 🎬 Präsentations-Tipps

### Vor der Präsentation:

**✅ Checkliste:**
```
[ ] GitHub PAT in script.js eingetragen (lokal!)
[ ] Website läuft: index.html im Browser öffnen
[ ] GitHub Repository geöffnet
[ ] Teams/Discord geöffnet
[ ] Terminal/PowerShell bereit
[ ] Dashboard geöffnet
[ ] Internet-Verbindung stabil
[ ] Alle Webhooks getestet
[ ] Backup-Screenshots vorbereitet
```

### Während der Präsentation:

**DO's:**
- ✅ Spreche klar und nicht zu schnell
- ✅ Zeige Browser und Code parallel
- ✅ Erkläre was du klickst, bevor du klickst
- ✅ Warte auf visuelle Bestätigung (Success-Messages)
- ✅ Habe Backup-Plan falls etwas nicht funktioniert

**DON'Ts:**
- ❌ Nicht zu viel hin- und herswitchen zwischen Apps
- ❌ Nicht zu lange auf Ladezeiten warten
- ❌ Nicht verzweifeln wenn etwas nicht klappt
- ❌ Nicht Token im Screen-Share zeigen!

---

## 🔧 Backup-Pläne

### Falls Support-Formular nicht funktioniert:
1. **Plan A**: Zeige vorher erstelltes Issue auf GitHub
2. **Plan B**: Zeige Code + erkläre Funktionsweise
3. **Plan C**: Zeige Screenshot von Success-Message

### Falls Webhooks nicht funktionieren:
1. **Plan A**: Zeige Workflow-Logs auf GitHub Actions
2. **Plan B**: Zeige Screenshots von erfolgreichen Notifications
3. **Plan C**: Erkläre anhand des Codes wie es funktionieren würde

### Falls Internet-Problem:
1. **Plan A**: Nutze lokale HTML-Dateien
2. **Plan B**: Zeige Code-Walkthrough
3. **Plan C**: Nutze Backup-Präsentation mit Screenshots

---

## ⏱️ Zeitplan (Total: 20-25 Min)

```
00:00 - 02:00  Einleitung & Überblick
02:00 - 08:00  Demo 1: Workflow Automatisation
08:00 - 14:00  Demo 2: Notification System
14:00 - 20:00  Demo 3: Ecosystem Integration
20:00 - 25:00  Demo 4: Dashboard & Fazit
```

---

## 🎯 Key Messages

Für jede Demo solltest du diese Messages betonen:

### Workflow Automatisation:
> "Innerhalb von 2 Sekunden wird aus einer Website-Anfrage ein getrackt GitHub Issue mit automatischen Labels und Benachrichtigungen."

### Notification System:
> "Das Team wird sofort informiert - egal ob sie Teams, Discord oder Slack nutzen. Keine Anfrage geht verloren."

### Ecosystem Integration:
> "Alle Automationen arbeiten zusammen. Ein PR wird automatisch analysiert, gelabelt und das Team wird informiert."

### Dashboard:
> "Alles ist transparent und messbar. Wir sehen Live-Metriken und können die Performance kontinuierlich verbessern."

---

## 📝 Vorbereitungs-Checklist (1 Tag vorher)

```
[ ] GitHub PAT erstellen und lokal speichern
[ ] Alle Webhooks testen:
    [ ] Teams-Webhook funktioniert
    [ ] Discord-Webhook funktioniert
    [ ] Slack-Webhook getestet (optional)
    
[ ] Test-Durchlauf machen:
    [ ] Support-Formular abschicken
    [ ] Issue wird erstellt
    [ ] Labels werden gesetzt
    [ ] Notifications ankommen
    
[ ] Screenshots machen:
    [ ] Erfolgreiche Issue-Erstellung
    [ ] Teams-Notification
    [ ] Discord-Notification
    [ ] PR mit automatischen Labels
    [ ] Dashboard
    
[ ] Präsentation proben:
    [ ] Timing checken
    [ ] Smooth zwischen Apps wechseln üben
    [ ] Key Messages auswendig lernen
```

---

## 🚀 Last-Minute Checklist (30 Min vor Präsentation)

```
[ ] Laptop voll geladen
[ ] Browser-Tabs vorbereitet:
    [ ] index.html (localhost oder GitHub Pages)
    [ ] GitHub Repository - Issues
    [ ] GitHub Repository - Pull Requests  
    [ ] GitHub Repository - Actions
    [ ] automation-dashboard.html
    
[ ] Apps geöffnet:
    [ ] VS Code mit Projekt
    [ ] PowerShell/Terminal
    [ ] Teams Desktop App
    [ ] Discord Desktop App (falls vorhanden)
    
[ ] Einstellungen:
    [ ] Notifications stumm schalten
    [ ] "Nicht stören" Modus aktivieren
    [ ] Bildschirm-Helligkeit optimal
    [ ] Schrift-Größe im VS Code erhöhen (für Publikum)
    
[ ] Final Test:
    [ ] Internet funktioniert
    [ ] GitHub erreichbar
    [ ] Website lädt
    [ ] Token funktioniert
```

---

## 💡 Pro-Tipps

1. **Screen-Recording als Backup**: Nehme vorher Video auf von funktionierenden Demos
2. **Zwei Browser-Fenster**: Eins für Demo, eins für GitHub
3. **Auto-Refresh**: Für GitHub Issues-Seite (F5 nach Form-Submit)
4. **Zoom-Level**: Erhöhe Browser-Zoom auf 125-150% für bessere Sichtbarkeit
5. **Dark Mode**: Nutze Dark Mode für bessere Kontraste bei Präsentation

---

## 🎤 Moderations-Script

### Einleitung (30 Sekunden):
> "Heute zeige ich euch, wie wir mit GitHub Actions einen vollautomatischen Support-Workflow aufgebaut haben. Von der Website-Anfrage bis zur Team-Benachrichtigung - alles passiert in Sekunden, ohne manuelle Eingriffe."

### Überleitung zu Demo 1:
> "Schauen wir uns das live an. Ich gehe auf unsere Website..."

### Überleitung zu Demo 2:
> "Das Issue ist erstellt - aber wie erfährt das Team davon? Genau, durch unser Notification System..."

### Überleitung zu Demo 3:
> "Diese Automationen arbeiten nicht isoliert. Sie bilden ein komplettes Ecosystem..."

### Abschluss:
> "Wie ihr gesehen habt, können wir mit GitHub Actions komplexe Workflows automatisieren. Das spart Zeit, verhindert Fehler und macht Prozesse transparent."

---

Viel Erfolg bei der Präsentation! 🎉
