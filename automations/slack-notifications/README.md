# 🔔 Slack Notifications Automation

Ein umfassendes GitHub Actions Workflow-System für automatische Slack-Benachrichtigungen bei verschiedenen Repository-Ereignissen.

## 📋 Übersicht

Dieses Automation-System sendet automatisch formatierte Slack-Benachrichtigungen für:
- **Issue-Ereignisse**: Neue Issues, geschlossene Issues, Prioritätslabels
- **Pull Request-Ereignisse**: Neue PRs, gemergete PRs, Code-Reviews
- **Release-Ereignisse**: Neue Releases und Versionsveröffentlichungen
- **Hochpriorisierte Alerts**: Kritische Issues mit sofortiger Benachrichtigung

## ✨ Features

### 🎯 Issue-Benachrichtigungen
- **Neue Issues**: Automatische Erkennung von Bug Reports vs. Feature Requests
- **Farbcodierung**: Unterschiedliche Farben basierend auf Issue-Typ
- **Detaillierte Informationen**: Autor, Titel, Beschreibung und direkter Link
- **Prioritäts-Alerts**: Sofortige Benachrichtigung bei High/Critical Labels

### 📊 Pull Request-Tracking
- **Größenanalyse**: Automatische Berechnung der Code-Änderungen
- **Visueller Status**: Farbcodierte Größenindikatoren (🟢🟡🟠🔴)
- **Merge-Bestätigungen**: Erfolgreiche Merge-Benachrichtigungen
- **Branch-Informationen**: Quelle und Ziel-Branch Details

### 🚀 Release-Notifications
- **Version-Tracking**: Automatische Benachrichtigung neuer Releases
- **Release Notes**: Auszug der wichtigsten Änderungen
- **Autor-Informationen**: Wer hat die Release erstellt

### 🚨 High-Priority Alerts
- **Kritische Issues**: Sofortige Alerts bei `priority: high` oder `priority: critical`
- **Hervorgehobene Formatierung**: Auffällige rote Benachrichtigungen
- **Dringlichkeits-Hinweise**: Klare Kennzeichnung für sofortige Aufmerksamkeit

## 🛠️ Setup und Konfiguration

### 1. Slack Webhook erstellen

1. Gehe zu deinem Slack Workspace
2. Navigiere zu **Apps** → **Incoming Webhooks**
3. Erstelle einen neuen Webhook für deinen gewünschten Channel
4. Kopiere die Webhook-URL

### 2. GitHub Secret konfigurieren

1. Gehe zu deinem Repository → **Settings** → **Secrets and variables** → **Actions**
2. Erstelle ein neues Secret:
   - **Name**: `SLACK_WEBHOOK_URL`
   - **Value**: Deine Slack Webhook-URL

### 3. Workflow aktivieren

Der Workflow wird automatisch aktiviert, sobald die Datei `.github/workflows/slack-notifications.yml` in deinem Repository vorhanden ist.

## 🎨 Nachrichtenformate

### Issue-Benachrichtigung
```
📋 New Issue Created
┌─────────────────────────────────────┐
│ Title: Fix login button not working │
│ Author: @username                   │
│ Issue: #123                         │
│ Repository: owner/repo              │
│ Description: The login button...    │
└─────────────────────────────────────┘
```

### Pull Request-Benachrichtigung
```
🟡 Pull Request Opened
┌─────────────────────────────────────┐
│ Title: Add new authentication       │
│ Author: @developer                  │
│ PR: #456                           │
│ Changes: 127 lines in 8 files      │
│ Branch: feature/auth → main         │
└─────────────────────────────────────┘
```

### High-Priority Alert
```
🚨 HIGH PRIORITY ISSUE ALERT 🚨
┌─────────────────────────────────────┐
│ Title: Critical security flaw       │
│ Priority: priority: critical        │
│ Reporter: @security-team           │
│ Issue: #789                        │
│ ⚡ This issue requires immediate    │
│    attention!                       │
└─────────────────────────────────────┘
```

## 📈 Metriken und Insights

Das System trackt automatisch:
- **Issue-Typen**: Bug Reports vs. Feature Requests
- **PR-Größen**: Kleine, mittlere, große und sehr große Changes
- **Response-Zeit**: Wie schnell Issues und PRs bearbeitet werden
- **Team-Aktivität**: Wer am aktivsten contributed

## 🔧 Anpassungen

### Farb-Customization
```javascript
// Issue-Typen
const colors = {
  bug: '#F44336',      // Rot
  feature: '#4CAF50',  // Grün  
  default: '#2196F3'   // Blau
};

// PR-Größen
const sizeColors = {
  small: '#4CAF50',    // Grün (< 50 Zeilen)
  medium: '#FFC107',   // Gelb (50-200 Zeilen)
  large: '#FF9800',    // Orange (200-500 Zeilen)  
  xlarge: '#F44336'    // Rot (> 500 Zeilen)
};
```

### Channel-Routing
Für verschiedene Channels kannst du mehrere Webhooks konfigurieren:
- `SLACK_WEBHOOK_GENERAL` - Allgemeine Updates
- `SLACK_WEBHOOK_CRITICAL` - Nur kritische Issues
- `SLACK_WEBHOOK_RELEASES` - Nur Release-Benachrichtigungen

## 🧪 Testing

Teste deine Slack-Integration mit dem bereitgestellten Script:

```powershell
.\test-slack-webhook.ps1
```

Oder verwende das manuelle Test-Script:

```powershell
# Test Issue Notification
$webhook = "YOUR_WEBHOOK_URL"
$payload = @{
    text = "🧪 Test Message from GitHub Actions"
    attachments = @(@{
        color = "#4CAF50"
        text = "Slack integration is working correctly!"
    })
} | ConvertTo-Json -Depth 3

Invoke-RestMethod -Uri $webhook -Method Post -Body $payload -ContentType "application/json"
```

## 🔍 Troubleshooting

### Häufige Probleme

**Keine Nachrichten erhalten?**
- Überprüfe, ob `SLACK_WEBHOOK_URL` Secret korrekt gesetzt ist
- Teste den Webhook mit dem Test-Script
- Überprüfe die Workflow-Logs in GitHub Actions

**Formatierung falsch?**
- Slack Block Kit hat strenge Formatierungs-Regeln
- Teste Nachrichten-Payloads mit dem Slack Block Kit Builder
- Überprüfe die JSON-Struktur auf Syntaxfehler

**Workflow läuft nicht?**
- Überprüfe die Workflow-Trigger in `.github/workflows/slack-notifications.yml`
- Stelle sicher, dass die notwendigen Permissions gesetzt sind
- Überprüfe GitHub Actions Logs auf Fehler

### Debug-Modus
Aktiviere Debug-Logging durch Hinzufügen von:
```yaml
env:
  ACTIONS_STEP_DEBUG: true
```

## 🤝 Beitragen

1. Fork das Repository
2. Erstelle einen Feature Branch (`git checkout -b feature/slack-enhancement`)
3. Committe deine Änderungen (`git commit -m 'Add slack enhancement'`)
4. Push zum Branch (`git push origin feature/slack-enhancement`)
5. Erstelle einen Pull Request

## 📄 Lizenz

Dieses Projekt steht unter der MIT Lizenz. Siehe `LICENSE` für weitere Details.

## 🙏 Danksagungen

- Slack Block Kit für die reichhaltigen Nachrichtenformate
- GitHub Actions für die robuste Automation-Platform
- Die Open Source Community für Inspiration und Best Practices

---

**💡 Tipp**: Kombiniere diese Slack-Integration mit den anderen Automations (Label Bot, Triage Bot, Discord Notifications) für ein vollständiges Repository-Management-System!