# Contributing zu TechGear Store Automation Demo

🎉 Vielen Dank für dein Interesse, zu diesem Projekt beizutragen! 

## 📋 Code of Conduct

Dieses Projekt folgt einem Code of Conduct. Durch die Teilnahme wird erwartet, dass du diesen Code einhältst. Bitte melde unangemessenes Verhalten.

## 🚀 Wie kann ich beitragen?

### 🐛 Bugs melden

- Verwende die Bug Report Issue-Vorlage
- Beschreibe das Problem klar und detailliert
- Füge Schritte zur Reproduktion hinzu
- Füge Screenshots bei, wenn möglich
- Prüfe, ob das Problem bereits gemeldet wurde

### ✨ Features vorschlagen

- Verwende die Feature Request Issue-Vorlage
- Erkläre klar, warum das Feature nützlich wäre
- Beschreibe mögliche Implementierungen
- Diskutiere im Issue, bevor du mit der Arbeit beginnst

### 📚 Dokumentation verbessern

- Verwende die Documentation Issue-Vorlage
- Korrigiere Tippfehler und grammatikalische Fehler
- Verbessere Erklärungen und Beispiele
- Füge fehlende Dokumentation hinzu

## 🔧 Entwicklungsumgebung einrichten

### Voraussetzungen

- Git
- Node.js (für einige Automationen)
- PowerShell 7+ (für Scripts)
- Einen Code-Editor (VS Code empfohlen)

### Setup

```powershell
# Repository klonen
git clone https://github.com/dinesnimalthas/Demo-Gruppe-12.git
cd Demo-Gruppe-12

# Branch erstellen
git checkout -b feature/mein-feature
```

## 📝 Pull Request Prozess

### 1. Vorbereitung

- Fork das Repository
- Erstelle einen Feature-Branch
- Halte deine Änderungen fokussiert und klein
- Ein PR = Eine Änderung

### 2. Code-Standards

#### JavaScript/Node.js
```javascript
// ✅ Gut
const userName = "Max";
function getUserName() {
  return userName;
}

// ❌ Schlecht
var user_name = "Max";
function get_user_name() { return user_name; }
```

#### PowerShell
```powershell
# ✅ Gut
$UserName = "Max"
function Get-UserName {
    return $UserName
}

# ❌ Schlecht
$user_name = "Max"
function getUserName { return $user_name }
```

#### YAML (GitHub Actions)
```yaml
# ✅ Gut - Einrückung von 2 Spaces
name: My Workflow
on:
  push:
    branches: [main]

# ❌ Schlecht - Inkonsistente Einrückung
name: My Workflow
on:
 push:
   branches: [main]
```

### 3. Commit-Messages

Verwende aussagekräftige Commit-Messages:

```
✅ Gut:
feat: Add Discord notification for PR reviews
fix: Correct label assignment in triage bot
docs: Update QUICK-START guide with new setup steps

❌ Schlecht:
update
fix bug
changes
```

**Format**:
```
<type>: <kurze Beschreibung>

<optionaler Body mit Details>

<optional footer>
```

**Types**:
- `feat`: Neues Feature
- `fix`: Bug Fix
- `docs`: Dokumentation
- `style`: Formatierung, fehlende Semikolons, etc.
- `refactor`: Code-Umstrukturierung ohne Feature-Änderung
- `test`: Tests hinzufügen
- `chore`: Maintenance Tasks

### 4. PR Checkliste

Bevor du einen PR öffnest:

- [ ] Code folgt den Projektstandards
- [ ] Selbst-Review durchgeführt
- [ ] Kommentare hinzugefügt (wo nötig)
- [ ] Dokumentation aktualisiert
- [ ] Keine neuen Warnungen
- [ ] Tests hinzugefügt/aktualisiert
- [ ] Alle Tests bestehen
- [ ] PR-Beschreibung ist vollständig

### 5. PR Template verwenden

Fülle das PR-Template vollständig aus:
- Beschreibung der Änderungen
- Zugehöriges Issue verlinken
- Art der Änderung angeben
- Checkliste abhaken
- Screenshots hinzufügen (bei UI-Änderungen)

### 6. Review-Prozess

- Ein Maintainer wird deinen PR reviewen
- Adressiere Feedback konstruktiv
- Pushe zusätzliche Commits bei Bedarf
- Halte die Diskussion respektvoll

## 🏷️ Labeling Konventionen

### Automatische Labels
- `size/XS`, `size/S`, `size/M`, `size/L`, `size/XL` - PR-Größe
- `needs triage` - Neue Issues/PRs

### Manuelle Labels
- `bug` - Fehlerbehebung
- `enhancement` - Neue Features
- `documentation` - Dokumentationsänderungen
- `automation` - Workflow/Automation-Änderungen
- `good first issue` - Gut für Einsteiger
- `help wanted` - Extra Aufmerksamkeit benötigt
- `priority: high` - Hohe Priorität
- `priority: low` - Niedrige Priorität
- `wontfix` - Wird nicht bearbeitet

## 🧪 Testing

### Workflows testen

```powershell
# Workflow-Syntax validieren
act --list

# Workflow lokal testen (mit act)
act push

# Webhook testen
.\automations\discord-notifications\test-webhook.ps1
.\automations\slack-notifications\test-slack-webhook.ps1
```

### Website testen

```powershell
# Öffne index.html im Browser
cd docs
Start-Process index.html

# Teste Support-Formular
# 1. Fülle Formular aus
# 2. Prüfe, ob Issue erstellt wird
```

## 📁 Projekt-Struktur

```
Demo-Gruppe-12/
├── .github/
│   ├── CODEOWNERS              # Auto-Reviewer-Zuweisung
│   ├── ISSUE_TEMPLATE/         # Issue-Vorlagen
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/              # GitHub Actions
├── automations/                # Alle Automationen
│   ├── discord-notifications/
│   ├── slack-notifications/
│   ├── teams-email-integration/
│   ├── label-triage-bot/
│   ├── pr-size-labeler/
│   └── reusable-workflow/
├── docs/                       # Website-Dateien
│   ├── index.html
│   ├── script.js
│   └── styles.css
└── README.md
```

## 🎯 Coding-Best-Practices

### 1. DRY (Don't Repeat Yourself)
```javascript
// ✅ Gut
function sendNotification(webhook, message) {
  // Wiederverwendbare Funktion
}

// ❌ Schlecht
// Gleicher Code mehrfach kopiert
```

### 2. Klare Variablennamen
```javascript
// ✅ Gut
const userEmail = "user@example.com";
const totalPrice = 99.99;

// ❌ Schlecht
const e = "user@example.com";
const tp = 99.99;
```

### 3. Kommentare für komplexe Logik
```javascript
// ✅ Gut
// Berechne Rabatt basierend auf Kundenstufe
const discount = calculateDiscount(customerTier);

// ❌ Schlecht - Offensichtliches kommentieren
// Erstelle Variable
const x = 5;
```

### 4. Error Handling
```javascript
// ✅ Gut
try {
  await sendWebhook(url, data);
} catch (error) {
  console.error('Webhook failed:', error.message);
  // Graceful degradation
}

// ❌ Schlecht
await sendWebhook(url, data); // Keine Error-Behandlung
```

## 🔐 Sicherheit

### Secrets niemals committen!

```javascript
// ❌ NIEMALS!
const DISCORD_WEBHOOK = "https://discord.com/api/webhooks/...";

// ✅ Immer Secrets verwenden
const DISCORD_WEBHOOK = process.env.DISCORD_WEBHOOK_URL;
```

### Pre-commit Check

```powershell
# Prüfe auf Secrets vor Commit
git diff --cached | Select-String -Pattern "webhook|token|secret|password"
```

## 📞 Hilfe bekommen

- 🐛 **Bugs**: Öffne ein Issue mit der Bug-Vorlage
- 💡 **Features**: Öffne ein Issue mit der Feature-Vorlage
- 💬 **Fragen**: Starte eine Discussion
- 📧 **Privat**: Kontaktiere @dinesnimalthas

## 🙏 Anerkennung

Contributors werden im README aufgeführt und wir sind dankbar für jeden Beitrag!

## 📜 Lizenz

Durch das Beitragen zu diesem Projekt stimmst du zu, dass deine Beiträge unter der gleichen [MIT Lizenz](LICENSE) lizenziert werden, die das Projekt verwendet.

---

**Danke, dass du TechGear Store besser machst! 🚀**
