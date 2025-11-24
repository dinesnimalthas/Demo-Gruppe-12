# 🔧 Slack Notifications Setup Guide

Schritt-für-Schritt Anleitung zur Einrichtung der Slack-Integration für dein GitHub Repository.

## 📋 Voraussetzungen

- Slack Workspace mit Admin-Berechtigung oder App-Installation-Rechten
- GitHub Repository mit Actions-Berechtigung
- Grundkenntnisse in GitHub Secrets Management

## 🚀 Schritt 1: Slack App / Webhook erstellen

### Option A: Incoming Webhooks (Empfohlen)

1. **Slack Workspace öffnen**
   - Gehe zu `https://your-workspace.slack.com/apps`
   - Oder klicke auf dein Workspace-Name → **Settings & administration** → **Manage apps**

2. **Incoming Webhooks installieren**
   ```
   Suche nach "Incoming Webhooks"
   → Klicke auf "Add to Slack"
   → Wähle den gewünschten Channel aus
   → Klicke auf "Add Incoming Webhooks integration"
   ```

3. **Webhook-URL kopieren**
   ```
   Du erhältst eine URL wie:
   https://hooks.slack.com/services/YOUR/WEBHOOK/URL
   
   ⚠️ WICHTIG: Diese URL geheim halten!
   ```

### Option B: Custom Slack App (Erweitert)

1. **Neue App erstellen**
   - Gehe zu `https://api.slack.com/apps`
   - Klicke auf **"Create New App"**
   - Wähle **"From scratch"**
   - App Name: `GitHub Notifications`
   - Workspace auswählen

2. **Incoming Webhooks aktivieren**
   ```
   Features → Incoming Webhooks
   → Toggle "Activate Incoming Webhooks" auf ON
   → Klicke "Add New Webhook to Workspace"
   → Channel auswählen → "Allow"
   ```

3. **Permissions konfigurieren (optional)**
   ```
   Features → OAuth & Permissions
   → Scopes hinzufügen:
     - chat:write
     - chat:write.public
     - channels:read
   ```

## 🔐 Schritt 2: GitHub Secret konfigurieren

1. **Repository Settings öffnen**
   ```
   Gehe zu deinem GitHub Repository
   → Settings (Tab oben rechts)
   → Secrets and variables (linke Sidebar)
   → Actions
   ```

2. **Neues Secret erstellen**
   ```
   Klicke auf "New repository secret"
   
   Name: SLACK_WEBHOOK_URL
   Secret: https://hooks.slack.com/services/YOUR/WEBHOOK/URL
   
   → Klicke "Add secret"
   ```

3. **Zusätzliche Secrets (optional)**
   ```
   Für erweiterte Konfiguration:
   
   SLACK_WEBHOOK_CRITICAL: Für kritische Alerts
   SLACK_WEBHOOK_RELEASES: Für Release-Benachrichtigungen
   SLACK_CHANNEL_GENERAL: #general
   SLACK_CHANNEL_DEVELOPMENT: #dev-team
   ```

## 📁 Schritt 3: Workflow-Datei installieren

1. **Workflow-Verzeichnis erstellen**
   ```bash
   # Falls noch nicht vorhanden
   mkdir -p .github/workflows
   ```

2. **Workflow-Datei kopieren**
   - Kopiere die Datei `slack-notifications.yml` nach `.github/workflows/`
   - Oder verwende den bereitgestellten Code aus diesem Repository

3. **Workflow anpassen (optional)**
   ```yaml
   # Zusätzliche Trigger hinzufügen
   on:
     issues:
       types: [opened, closed, labeled, assigned]
     pull_request:
       types: [opened, closed, labeled, ready_for_review, review_requested]
     # ... weitere Events
   ```

## 🧪 Schritt 4: Integration testen

### Test 1: Manueller Webhook-Test

```powershell
# PowerShell Test-Script
$webhookUrl = "DEINE_WEBHOOK_URL_HIER"

$testPayload = @{
    text = "🧪 Test: GitHub Actions → Slack Integration"
    attachments = @(@{
        color = "#4CAF50"
        blocks = @(@{
            type = "section"
            text = @{
                type = "mrkdwn"
                text = "*Setup erfolgreich!* ✅`nDie Slack-Integration funktioniert korrekt."
            }
        })
    })
} | ConvertTo-Json -Depth 4

try {
    $response = Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $testPayload -ContentType "application/json"
    Write-Host "✅ Test erfolgreich! Überprüfe deinen Slack Channel." -ForegroundColor Green
} catch {
    Write-Host "❌ Fehler beim Senden: $($_.Exception.Message)" -ForegroundColor Red
}
```

### Test 2: GitHub Event simulieren

1. **Issue erstellen**
   ```
   Gehe zu deinem Repository
   → Issues Tab
   → "New issue"
   → Titel: "[TEST] Slack Integration Test"
   → Erstellen
   ```

2. **Pull Request erstellen**
   ```
   Erstelle einen neuen Branch:
   git checkout -b test/slack-integration
   
   Mache eine kleine Änderung:
   echo "Test change" >> test-file.txt
   git add test-file.txt
   git commit -m "Test: Slack notification"
   git push origin test/slack-integration
   
   → Erstelle PR über GitHub UI
   ```

### Test 3: Release erstellen

```
Repository → Releases → "Create a new release"
Tag version: v1.0.0-test
Release title: "Test Release for Slack Integration"
→ "Publish release"
```

## 🎛️ Schritt 5: Konfiguration optimieren

### Channel-Routing einrichten

```yaml
# In slack-notifications.yml
- name: Route to different channels
  env:
    GENERAL_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_GENERAL }}
    CRITICAL_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_CRITICAL }}
  with:
    script: |
      const webhook = label.name.includes('critical') 
        ? process.env.CRITICAL_WEBHOOK 
        : process.env.GENERAL_WEBHOOK;
```

### Benachrichtigungs-Filter

```yaml
# Nur bestimmte Branches
on:
  push:
    branches: [main, develop, release/*]

# Nur bestimmte Dateien
on:
  pull_request:
    paths:
      - 'src/**'
      - '!docs/**'
```

### Zeitbasierte Filter

```yaml
# Nur während Arbeitszeiten (UTC)
- name: Check business hours
  run: |
    hour=$(date +%H)
    if [ $hour -lt 8 ] || [ $hour -gt 18 ]; then
      echo "Outside business hours, skipping notification"
      exit 0
    fi
```

## 🔍 Schritt 6: Monitoring und Troubleshooting

### GitHub Actions Logs überprüfen

```
Repository → Actions Tab → Workflow auswählen → Run details
```

### Häufige Probleme beheben

**Problem: "Secret not found"**
```
Lösung: Überprüfe Secret-Name und Repository-Permissions
- Exakter Name: SLACK_WEBHOOK_URL
- Repository muss Actions erlauben
- Secret muss für die richtige Environment gesetzt sein
```

**Problem: "Webhook URL invalid"**
```
Lösung: URL-Format überprüfen
- Muss mit https://hooks.slack.com/services/ beginnen
- Keine Leerzeichen oder zusätzliche Zeichen
- Test mit curl oder PowerShell
```

**Problem: "Permission denied"**
```
Lösung: Workflow-Permissions überprüfen
permissions:
  contents: read
  issues: read
  pull-requests: read
```

### Debug-Modus aktivieren

```yaml
# In workflow file
env:
  ACTIONS_STEP_DEBUG: true
  ACTIONS_RUNNER_DEBUG: true
```

## 📊 Schritt 7: Erweiterte Konfiguration

### Custom Message Templates

```javascript
// Eigene Nachrichtenformate definieren
const customTemplate = {
  blocks: [
    {
      type: "header",
      text: {
        type: "plain_text",
        text: `🏢 ${context.repo.owner}/${context.repo.repo}`
      }
    },
    {
      type: "section",
      fields: [
        {
          type: "mrkdwn",
          text: `*Event:* ${context.eventName}`
        },
        {
          type: "mrkdwn", 
          text: `*Time:* ${new Date().toLocaleString('de-DE')}`
        }
      ]
    }
  ]
};
```

### Conditional Notifications

```yaml
- name: Notify only for important changes
  if: |
    (github.event_name == 'pull_request' && github.event.pull_request.changed_files > 10) ||
    (github.event_name == 'issues' && contains(github.event.issue.labels.*.name, 'priority: high'))
```

### Multi-Workspace Support

```yaml
- name: Send to multiple workspaces
  env:
    WORKSPACE_1: ${{ secrets.SLACK_WEBHOOK_TEAM_A }}
    WORKSPACE_2: ${{ secrets.SLACK_WEBHOOK_TEAM_B }}
  with:
    script: |
      const webhooks = [
        process.env.WORKSPACE_1,
        process.env.WORKSPACE_2
      ].filter(Boolean);
      
      for (const webhook of webhooks) {
        await fetch(webhook, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload)
        });
      }
```

## ✅ Checkliste für Go-Live

- [ ] Slack App/Webhook erstellt und getestet
- [ ] GitHub Secret `SLACK_WEBHOOK_URL` konfiguriert
- [ ] Workflow-Datei in `.github/workflows/` abgelegt
- [ ] Manueller Webhook-Test erfolgreich
- [ ] Test-Issue erstellt und Benachrichtigung erhalten
- [ ] Test-PR erstellt und Benachrichtigung erhalten
- [ ] Channel-Permissions überprüft
- [ ] Team über neue Benachrichtigungen informiert
- [ ] Dokumentation an Team weitergegeben

## 🎯 Nächste Schritte

1. **Team Training**: Erkläre dem Team die neuen Benachrichtigungen
2. **Monitoring**: Überwache die ersten Tage auf Spam oder Probleme  
3. **Optimierung**: Passe Filter und Channels basierend auf Feedback an
4. **Integration**: Kombiniere mit anderen Automations (Label Bot, Triage Bot)
5. **Skalierung**: Erweitere auf weitere Repositories

---

**🆘 Support**: Bei Problemen erstelle ein Issue in diesem Repository oder kontaktiere das DevOps-Team.
