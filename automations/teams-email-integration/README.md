# 📧 Teams & E-Mail Integration

Eine vollständige Flask-basierte API für Microsoft Teams und E-Mail Benachrichtigungen bei kritischen GitHub-Events.

## 🎯 Übersicht

Diese Integration erweitert deine GitHub Automation Suite um professionelle Kommunikationskanäle:
- **Microsoft Teams Webhooks** für sofortige Team-Benachrichtigungen
- **E-Mail Alerts** für kritische Issues und wichtige Events
- **Intelligente Filterung** nur für relevante Events
- **Rich Formatting** mit HTML-E-Mails und Teams Cards
- **Multi-Recipient Support** für Team-weite Kommunikation

## ✨ Features

### 🔔 Teams Integration
- **Adaptive Cards**: Moderne, interaktive Teams-Nachrichten
- **Farbcodierung**: Rot für kritische Issues, Blau für PRs, Grün für normale Updates
- **Action Buttons**: Direkte Links zu GitHub Issues/PRs
- **Rich Information**: Autor, Labels, Beschreibung und Kontext

### 📨 E-Mail Notifications
- **HTML Templates**: Professionell formatierte E-Mails
- **Multi-Recipient**: Mehrere Empfänger mit Komma getrennt
- **Priority Handling**: Unterschiedliche Formate für kritische vs. normale Events
- **SMTP Security**: Sichere Authentifizierung mit App-Passwörtern

### 🎛️ Event Processing
- **Issue Events**: Neue Issues, Labels, kritische Prioritäten
- **PR Events**: Neue PRs, Merges, Review-Status
- **Release Events**: Neue Versionen und Release Notes
- **Smart Filtering**: Nur relevante Events werden verarbeitet

## 🚀 Quick Start

### 1. Dependencies installieren
```bash
pip install -r requirements.txt
```

### 2. Umgebungsvariablen konfigurieren
```bash
# .env Datei erstellen (basierend auf .env.example)
cp .env.example .env

# Konfiguration anpassen
TEAMS_WEBHOOK_URL=https://outlook.office.com/webhook/DEIN-WEBHOOK
EMAIL_FROM=github-bot@deinefirma.com
EMAIL_TO=lead@deinefirma.com,team@deinefirma.com
SMTP_USER=github-bot@deinefirma.com
SMTP_PASS=dein-app-passwort
```

### 3. Flask API starten
```bash
python app.py
```

### 4. GitHub Webhook konfigurieren
```
Payload URL: http://deine-domain.com/webhook
Content type: application/json
Events: Issues, Pull requests, Releases
```

## 🔧 Konfiguration

### Teams Webhook Setup

1. **Teams Channel öffnen**
   - Gehe zu deinem gewünschten Teams Channel
   - Klicke auf "..." → Connectors

2. **Incoming Webhook konfigurieren**
   ```
   Apps → Incoming Webhook → Configure
   Name: GitHub Notifications
   Upload Image: GitHub Logo (optional)
   → Create
   ```

3. **Webhook URL kopieren**
   ```
   Die generierte URL in TEAMS_WEBHOOK_URL einsetzen
   Format: https://outlook.office.com/webhook/xxxxx/IncomingWebhook/xxxxx
   ```

### E-Mail Setup (Gmail)

1. **App-Passwort erstellen**
   ```
   Google Account → Security → 2-Step Verification
   → App passwords → Select app: Mail
   → Generate password
   ```

2. **SMTP Konfiguration**
   ```bash
   SMTP_SERVER=smtp.gmail.com
   SMTP_PORT=587
   SMTP_USER=dein-gmail@gmail.com
   SMTP_PASS=generiertes-app-passwort
   ```

### Andere E-Mail Provider

**Outlook/Hotmail:**
```bash
SMTP_SERVER=smtp.live.com
SMTP_PORT=587
```

**Yahoo:**
```bash
SMTP_SERVER=smtp.mail.yahoo.com
SMTP_PORT=587
```

**Custom SMTP:**
```bash
SMTP_SERVER=mail.deinefirma.com
SMTP_PORT=587  # oder 465 für SSL
```

## 🧪 Testing

### API Endpoints testen

**Health Check:**
```bash
curl http://localhost:5000/health
```

**Test Notification:**
```bash
curl -X POST http://localhost:5000/test
```

**GitHub Webhook simulieren:**
```bash
curl -X POST http://localhost:5000/webhook \
  -H "Content-Type: application/json" \
  -H "X-GitHub-Event: issues" \
  -d @sample_webhook.json
```

### PowerShell Test-Script

```powershell
# Teams Webhook testen
.\test-teams-webhook.ps1 -WebhookUrl "DEINE_TEAMS_URL"

# E-Mail Konfiguration testen  
.\test-email-config.ps1
```

## 📊 Event-Typen und Trigger

### Issue Events
```yaml
Trigger: issues.opened, issues.labeled
Bedingung: Label enthält "critical", "urgent", oder "priority: high"
Benachrichtigung: Teams + E-Mail
Format: Kritisches Issue Alert
```

### Pull Request Events  
```yaml
Trigger: pull_request.opened, pull_request.closed, pull_request.ready_for_review
Bedingung: Alle wichtigen PR-Status
Benachrichtigung: Teams  
Format: PR Status Update
```

### Release Events
```yaml
Trigger: release.published
Bedingung: Neue Version veröffentlicht
Benachrichtigung: Teams + E-Mail
Format: Release Announcement
```

## 🎨 Message Formats

### Teams Adaptive Card
```json
{
  "@type": "MessageCard",
  "themeColor": "FF0000",
  "summary": "🚨 Kritisches Issue: Login Bug",
  "sections": [{
    "activityTitle": "🚨 Kritisches Issue erkannt!",
    "activitySubtitle": "Issue #123 von @developer",
    "facts": [
      {"name": "Titel", "value": "Login Button funktioniert nicht"},
      {"name": "Labels", "value": "bug, critical, urgent"},
      {"name": "Reporter", "value": "user123"}
    ]
  }]
}
```

### E-Mail HTML Template
- **Header**: Farbcodiert nach Priorität (Rot/Grün)
- **Content**: Issue/PR Details mit Formatierung
- **Action Button**: Direkter Link zu GitHub
- **Footer**: Branding und zusätzliche Links

## ⚙️ Erweiterte Konfiguration

### Feature Flags
```bash
# Einzelne Features deaktivieren
ENABLE_TEAMS=false    # Teams Benachrichtigungen aus
ENABLE_EMAIL=false    # E-Mail Benachrichtigungen aus
```

### Multi-Channel Teams
```bash
# Verschiedene Webhooks für verschiedene Events
TEAMS_WEBHOOK_CRITICAL=https://...   # Für kritische Issues
TEAMS_WEBHOOK_GENERAL=https://...    # Für normale Updates
TEAMS_WEBHOOK_RELEASES=https://...   # Für Releases
```

### E-Mail Templates customizen
```python
# In app.py anpassen:
def create_email_html(data):
    # Eigene HTML-Templates
    # Firmen-Branding hinzufügen
    # Zusätzliche Informationen einbinden
```

### Webhook Security
```bash
# GitHub Webhook Secret für Verifizierung
WEBHOOK_SECRET=dein-geheimer-schluessel
```

## 🔍 Monitoring und Logs

### Logging Level
```python
# In app.py:
logging.basicConfig(level=logging.DEBUG)  # Für ausführliche Logs
```

### Health Monitoring
```bash
# Regelmäßige Health Checks
curl http://localhost:5000/health

# Response:
{
  "status": "healthy", 
  "timestamp": "2024-01-15T10:30:00",
  "features": {
    "teams_enabled": true,
    "email_enabled": true
  }
}
```

### Error Handling
- **Automatische Retry**: Bei temporären Netzwerkfehlern
- **Fallback**: E-Mail wenn Teams fehlschlägt
- **Comprehensive Logging**: Alle Fehler werden geloggt
- **Graceful Degradation**: App läuft weiter auch bei Konfigurationsfehlern

## 🚀 Deployment

### Local Development
```bash
python app.py
# Läuft auf http://localhost:5000
```

### Production (Heroku)
```bash
# Procfile erstellen
echo "web: python app.py" > Procfile

# Environment Variables in Heroku setzen
heroku config:set TEAMS_WEBHOOK_URL=https://...
heroku config:set EMAIL_FROM=bot@deinefirma.com
# ... weitere Vars

# Deploy
git push heroku main
```

### Docker
```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]
```

### Reverse Proxy (nginx)
```nginx
server {
    listen 80;
    server_name github-notifications.deinefirma.com;
    
    location / {
        proxy_pass http://localhost:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

## 🔒 Security Best Practices

### Secrets Management
- **Nie Secrets in Code committen**
- **Umgebungsvariablen verwenden**
- **App-Passwörter statt normale Passwörter**
- **Webhook Secrets für Verifikation**

### Network Security  
- **HTTPS für Webhooks**
- **IP Whitelisting** (GitHub IPs)
- **Rate Limiting** implementieren
- **Input Validation** für alle Payloads

### Access Control
- **Separate Service Accounts** für E-Mail
- **Minimale Berechtigungen** für Teams Apps
- **Regular Secret Rotation**
- **Audit Logs** aktivieren

## 🤝 Integration mit anderen Automations

Diese Teams/E-Mail Integration arbeitet nahtlos zusammen mit:

- **Label Bot**: Automatische Labels lösen Teams/E-Mail Alerts aus
- **Triage Bot**: Neue Contributor bekommen auch Teams Willkommensnachrichten  
- **Discord Notifications**: Parallel zu Teams für verschiedene Zielgruppen
- **Slack Integration**: Multi-Platform Kommunikation

## 📈 Metriken und Analytics

### Tracking wichtiger Metriken
- **Response Times**: Wie schnell werden kritische Issues bearbeitet?
- **Team Engagement**: Wer reagiert auf Teams Notifications?
- **Issue Resolution**: Verbesserung durch bessere Kommunikation?
- **Notification Effectiveness**: Führen Alerts zu schnelleren Fixes?

## 🛠️ Troubleshooting

### Häufige Probleme

**Teams Notifications kommen nicht an:**
```bash
# Webhook URL testen
curl -X POST "DEINE_TEAMS_URL" -H "Content-Type: application/json" -d '{"text":"Test"}'

# Teams App Permissions überprüfen
# Webhook URL auf Gültigkeit prüfen
```

**E-Mails werden nicht gesendet:**
```bash
# SMTP Konfiguration testen
python -c "
import smtplib
server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login('USER', 'PASS')
print('✅ SMTP Connection erfolgreich')
"
```

**Webhook Events kommen nicht an:**
```bash
# GitHub Webhook Logs überprüfen
# Repository Settings → Webhooks → Recent Deliveries

# Payload Format validieren
# ngrok für lokales Testing verwenden
```

---

**💡 Pro Tipp**: Kombiniere diese Integration mit den anderen Automations für ein vollständiges Repository-Management-System! Teams für sofortige Alerts, E-Mail für wichtige Dokumentation und Discord/Slack für Community-Kommunikation.