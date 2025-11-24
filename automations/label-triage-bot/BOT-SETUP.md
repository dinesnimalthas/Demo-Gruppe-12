# Bot Setup und Testing Guide

## 🤖 Was wurde erstellt?

### 1. Label Bot (`.github/workflows/label-bot.yml`)
Automatisches Labeling basierend auf Titel und Beschreibung von Issues und PRs.

**Erkannte Keywords:**
- `bug`, `error`, `fehler` → Label: `bug`
- `feature`, `enhancement`, `verbesserung` → Label: `enhancement`
- `doc`, `documentation` → Label: `documentation`
- `question`, `frage`, `help` → Label: `question`
- `urgent`, `critical` → Label: `priority: high`
- `easy`, `beginner` → Label: `good first issue`

### 2. Triage Bot (`.github/workflows/triage-bot.yml`)
Automatische Erstbearbeitung von neuen Issues und PRs.

**Features:**
- Fügt automatisch "needs triage" Label hinzu
- Begrüßt First-Time Contributors
- Prüft auf fehlende Informationen
- Fügt "needs more info" Label hinzu wenn Details fehlen

### 3. Issue Templates
- **Bug Report** (`.github/ISSUE_TEMPLATE/bug_report.yml`)
- **Feature Request** (`.github/ISSUE_TEMPLATE/feature_request.yml`)

### 4. Beispiel-Code mit Bugs
- `calculator.js` - Division durch Null, Type Coercion, Infinite Loops
- `database.js` - SQL Injection, Klartext-Passwörter, Memory Leaks
- `api-handler.js` - Keine Auth, CSRF, Path Traversal

## 📋 Labels einrichten

Bevor die Bots funktionieren, müssen die Labels im Repository erstellt werden:

```bash
# Gehe zu deinem GitHub Repository
# Settings → Labels → New label

# Erstelle folgende Labels:
```

**Erforderliche Labels:**
- `bug` (Farbe: #d73a4a)
- `enhancement` (Farbe: #a2eeef)
- `documentation` (Farbe: #0075ca)
- `question` (Farbe: #d876e3)
- `priority: high` (Farbe: #b60205)
- `good first issue` (Farbe: #7057ff)
- `needs triage` (Farbe: #fbca04)
- `needs more info` (Farbe: #fef2c0)

## 🧪 Testing

### Schritt 1: Push den Code zu GitHub
```bash
git add .
git commit -m "Add label and triage bots with buggy example code"
git push origin feature/label-triage-bots
```

### Schritt 2: Erstelle Test-Issues

**Test 1 - Bug Detection:**
```
Titel: Bug: Calculator crashed when dividing by zero
Body: The calculator doesn't handle division by zero properly.
```
Erwartetes Ergebnis: Labels `bug` und `needs triage`

**Test 2 - Feature Detection:**
```
Titel: Feature: Add exponential function
Body: Would be great to have exp() function for scientific calculations.
```
Erwartetes Ergebnis: Labels `enhancement` und `needs triage`

**Test 3 - Missing Info Detection:**
```
Titel: Error in code
Body: It doesn't work
```
Erwartetes Ergebnis: Labels `bug`, `needs triage`, `needs more info` + Kommentar

**Test 4 - Priority Detection:**
```
Titel: Critical bug: Security vulnerability in authentication
Body: Urgent fix needed for SQL injection vulnerability
```
Erwartetes Ergebnis: Labels `bug`, `priority: high`, `needs triage`

**Test 5 - Good First Issue:**
```
Titel: Easy fix: Typo in README
Body: Simple typo that beginners can fix
```
Erwartetes Ergebnis: Labels `documentation`, `good first issue`, `needs triage`

### Schritt 3: Erstelle einen Test-PR

```bash
# Erstelle einen neuen Branch
git checkout -b fix/division-by-zero

# Fixe einen Bug (z.B. in calculator.js)
# Dann:
git add .
git commit -m "Fix: Add zero division check"
git push origin fix/division-by-zero

# Erstelle PR mit Titel: "Fix: Prevent division by zero error"
```

Erwartetes Ergebnis: Labels `bug` und `needs triage`, Welcome-Kommentar

## 🔍 Überprüfen ob die Bots funktionieren

1. Gehe zu **Actions** Tab in GitHub
2. Du solltest die Workflows sehen:
   - "Label Bot"
   - "Triage Bot"
3. Klicke auf einen Workflow-Run um Details zu sehen
4. Prüfe die Logs für Fehler

## 🐛 Bekannte Bugs im Code

Die Beispieldateien enthalten folgende absichtliche Bugs:

**calculator.js:**
- Division durch Null nicht behandelt
- Keine Type-Validierung
- Infinite Loop bei negativem Multiplikator
- Memory Leak in History
- Unsichere eval() Verwendung

**database.js:**
- SQL Injection Vulnerability
- Passwörter im Klartext
- Race Conditions
- Memory Leak (setInterval ohne Cleanup)

**api-handler.js:**
- Keine Authentifizierung
- Keine CORS/Rate Limiting
- Path Traversal Vulnerability
- Unhandled Promise Rejections

## 💡 Nächste Schritte

1. **Labels erstellen** (siehe oben)
2. **Code pushen** zu GitHub
3. **Test-Issues erstellen** um Bots zu testen
4. **Workflows überprüfen** in Actions Tab
5. **Issues fixen** - erstelle PRs um die Bugs zu beheben!

## 🔧 Troubleshooting

**Bot läuft nicht:**
- Prüfe ob GitHub Actions aktiviert sind (Settings → Actions)
- Prüfe Workflow-Permissions (Settings → Actions → Workflow permissions)
- Muss auf "Read and write permissions" gesetzt sein

**Labels werden nicht hinzugefügt:**
- Prüfe ob die Labels im Repository existieren
- Prüfe die Workflow-Logs in Actions Tab

**Bot-Kommentare erscheinen nicht:**
- Prüfe Permissions in Workflow-Datei
- Stelle sicher dass `issues: write` Permission gesetzt ist

## 📚 Weitere Anpassungen

Du kannst die Bots anpassen in:
- `.github/workflows/label-bot.yml` - Füge mehr Keywords hinzu
- `.github/workflows/triage-bot.yml` - Ändere Welcome-Messages
- `.github/ISSUE_TEMPLATE/*.yml` - Passe Templates an
