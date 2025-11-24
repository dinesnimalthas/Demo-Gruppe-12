# Label & Triage Bot

Automatische Label-Vergabe und Triage für GitHub Issues und Pull Requests.

## 📁 Struktur

```
automations/label-triage-bot/
├── BOT-SETUP.md          # Vollständige Setup-Anleitung
├── LABELS.md             # Übersicht der Labels und Keywords
├── create-labels.js      # Node.js Skript zum Erstellen der Labels
├── create-labels.ps1     # PowerShell Skript zum Erstellen der Labels
└── example-code/         # Beispiel-Code mit absichtlichen Bugs
    ├── calculator.js     # Division durch Null, Type Coercion, etc.
    ├── database.js       # SQL Injection, Memory Leaks, etc.
    ├── api-handler.js    # Keine Auth, CSRF, Path Traversal, etc.
    └── package.json      # Projekt-Konfiguration
```

## 🚀 Quick Start

### 1. Labels erstellen

Mit GitHub CLI:
```bash
gh auth login
./create-labels.ps1  # oder: node create-labels.js
```

### 2. Workflows aktivieren

Die Workflows in `.github/workflows/` müssen in den **main branch** gemerged werden:
```bash
# Pull Request erstellen und mergen
git push origin feature/label-triage-bots
# Dann PR auf GitHub mergen
```

### 3. Testen

Erstelle ein Issue mit Titel wie:
- "Bug: Calculator crashed when dividing by zero"
- "Feature: Add exponential function"
- "Question: How to use the API?"

Der Bot fügt automatisch die passenden Labels hinzu! 🎉

## 📖 Features

### Label Bot
- Erkennt Keywords in Titel und Beschreibung
- Fügt automatisch passende Labels hinzu
- Unterstützt Bug, Feature, Documentation, Question, Priority, etc.

### Triage Bot
- Begrüßt First-Time Contributors
- Fügt "needs triage" Label hinzu
- Prüft auf fehlende Informationen
- Fügt "needs more info" Label bei unvollständigen Issues

## 📚 Dokumentation

- **[BOT-SETUP.md](BOT-SETUP.md)** - Vollständige Anleitung
- **[LABELS.md](LABELS.md)** - Übersicht aller Labels und Keywords

## 🐛 Beispiel-Code

Der `example-code/` Ordner enthält absichtlich fehlerhaften Code zum Testen der Bots:

- **calculator.js** - Division durch Null, Infinite Loops, Memory Leaks
- **database.js** - SQL Injection, Klartext-Passwörter, Race Conditions
- **api-handler.js** - Keine Authentifizierung, CSRF, Path Traversal

Nutze diese Beispiele um Test-Issues zu erstellen!

## 🔧 Konfiguration

Die Workflows befinden sich in:
- `.github/workflows/label-bot.yml`
- `.github/workflows/triage-bot.yml`

Issue Templates:
- `.github/ISSUE_TEMPLATE/bug_report.yml`
- `.github/ISSUE_TEMPLATE/feature_request.yml`

## ⚙️ Permissions

Die Bots benötigen folgende Permissions (bereits konfiguriert):
```yaml
permissions:
  issues: write
  pull-requests: write
  contents: read
```

Stelle sicher, dass in den Repository Settings:
**Settings → Actions → General → Workflow permissions**
auf **"Read and write permissions"** gesetzt ist.
