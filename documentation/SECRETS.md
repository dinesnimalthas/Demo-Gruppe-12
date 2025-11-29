# 🔐 Repository Secrets Konfiguration

Diese Datei dokumentiert alle erforderlichen GitHub Repository Secrets für die volle Funktionalität aller Automationen.

## 📋 Übersicht

Dieses Repository verwendet verschiedene Webhook-basierte Integrationen. Folgende Secrets müssen in den Repository Settings konfiguriert werden.

## 🚀 Secrets konfigurieren

Gehe zu: **Repository Settings → Secrets and variables → Actions → New repository secret**

---

## 1️⃣ Discord Integration

### `DISCORD_WEBHOOK_URL`
**Zweck**: Sendet Benachrichtigungen zu Pull Requests, Issues und Reviews an Discord

**Verwendet in**: 
- `.github/workflows/discord-notifications.yml`

**Wie bekomme ich den Webhook?**
1. Öffne deinen Discord Server
2. Gehe zu Server Settings → Integrations
3. Klicke auf "Webhooks" → "New Webhook"
4. Wähle den Channel (z.B. `#github-notifications`)
5. Kopiere die Webhook URL
6. Füge sie als Secret `DISCORD_WEBHOOK_URL` hinzu

**Format**: `https://discord.com/api/webhooks/1234567890/AbCdEfGhIjKlMnOpQrStUvWxYz`

**Test**:
```powershell
.\automations\discord-notifications\test-webhook.ps1
```

**Status**: 🔴 Erforderlich für Discord Notifications

---

## 2️⃣ Slack Integration

### `SLACK_WEBHOOK_URL`
**Zweck**: Sendet Benachrichtigungen zu Issues, PRs, Pushes und Releases an Slack

**Verwendet in**:
- `.github/workflows/slack-notifications.yml`

**Wie bekomme ich den Webhook?**
1. Gehe zu [api.slack.com/apps](https://api.slack.com/apps)
2. Klicke "Create New App" → "From scratch"
3. Gib einen App-Namen ein (z.B. "GitHub Notifications")
4. Wähle deinen Workspace
5. Gehe zu "Incoming Webhooks"
6. Aktiviere "Incoming Webhooks"
7. Klicke "Add New Webhook to Workspace"
8. Wähle den Channel (z.B. `#github`)
9. Kopiere die Webhook URL
10. Füge sie als Secret `SLACK_WEBHOOK_URL` hinzu

**Format**: `https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXX`

**Test**:
```powershell
.\automations\slack-notifications\test-slack-webhook.ps1
```

**Status**: 🔴 Erforderlich für Slack Notifications

---

## 3️⃣ Microsoft Teams Integration

### `TEAMS_WEBHOOK_URL`
**Zweck**: Sendet kritische Benachrichtigungen zu Issues und PRs an Microsoft Teams

**Verwendet in**:
- `.github/workflows/teams-email-notifications.yml`

**Wie bekomme ich den Webhook?**
1. Öffne Microsoft Teams
2. Gehe zu deinem Team/Channel
3. Klicke auf "..." (Mehr Optionen) → "Workflows"
4. Suche nach "Post to a channel when a webhook request is received"
5. Klicke "Add workflow"
6. Wähle den Channel
7. Kopiere die generierte Webhook URL
8. Füge sie als Secret `TEAMS_WEBHOOK_URL` hinzu

**Alternativ (Power Automate)**:
1. Gehe zu [flow.microsoft.com](https://flow.microsoft.com)
2. Erstelle einen neuen Flow mit "When a HTTP request is received"
3. Verbinde mit "Post message in a chat or channel"
4. Kopiere die HTTP POST URL
5. Füge sie als Secret hinzu

**Format**: `https://[tenant].webhook.office.com/webhookb2/...`

**Test**:
```powershell
.\automations\teams-email-integration\test-teams-webhook.ps1
```

**Status**: 🟡 Optional (für Teams Benachrichtigungen)

---

## 4️⃣ GitHub Token (Standard)

### `GITHUB_TOKEN`
**Zweck**: Standard GitHub Actions Token für API-Zugriff

**Verwendet in**: Fast alle Workflows

**Konfiguration**: ✅ Automatisch von GitHub bereitgestellt - keine Aktion erforderlich!

**Permissions**: Wird automatisch mit den in den Workflows definierten Permissions versehen

**Status**: ✅ Automatisch verfügbar

---

## 📊 Secrets Übersicht

| Secret Name | Status | Verwendet in | Erforderlich |
|-------------|--------|--------------|--------------|
| `DISCORD_WEBHOOK_URL` | 🔴 Setup erforderlich | Discord Notifications | Ja* |
| `SLACK_WEBHOOK_URL` | 🔴 Setup erforderlich | Slack Notifications | Ja* |
| `TEAMS_WEBHOOK_URL` | 🟡 Optional | Teams & Email Notifications | Nein** |
| `GITHUB_TOKEN` | ✅ Automatisch | Alle Workflows | Automatisch |

\* Erforderlich, wenn du die entsprechende Integration nutzen möchtest  
** Optional - nur für kritische Benachrichtigungen

---

## 🧪 Demo-Modus

**Wichtig**: Die Workflows prüfen, ob die Secrets konfiguriert sind:

```javascript
if (!webhook) {
  console.log('⚠️ Webhook not configured - skipping notification');
  return;
}
```

Das bedeutet:
- ✅ Workflows schlagen nicht fehl, wenn Secrets fehlen
- ⚠️ Benachrichtigungen werden nur gesendet, wenn Secrets konfiguriert sind
- 🎬 Perfekt für Live-Demos ohne tatsächliche Webhooks

---

## 🔒 Sicherheits-Best-Practices

### ✅ DO's
- Verwende GitHub Secrets für alle sensiblen Daten
- Rotiere Webhooks regelmäßig
- Beschränke Webhook-Berechtigungen auf das Minimum
- Teste Webhooks in einer Entwicklungsumgebung zuerst

### ❌ DON'Ts
- NIEMALS Webhooks im Code committen
- NIEMALS Secrets in Issues/Comments posten
- NIEMALS Secrets in Logs ausgeben
- NIEMALS Webhooks öffentlich teilen

---

## 🔧 Troubleshooting

### Workflow läuft, aber keine Benachrichtigung?

1. **Prüfe Secret-Name**
   ```powershell
   # Settings → Secrets → Actions
   # Stelle sicher, dass der Name EXAKT übereinstimmt:
   # DISCORD_WEBHOOK_URL (nicht discord_webhook_url)
   ```

2. **Teste Webhook manuell**
   ```powershell
   # Discord
   .\automations\discord-notifications\test-webhook.ps1
   
   # Slack
   .\automations\slack-notifications\test-slack-webhook.ps1
   
   # Teams
   .\automations\teams-email-integration\test-teams-webhook.ps1
   ```

3. **Prüfe Workflow Logs**
   - Gehe zu Actions Tab
   - Klicke auf den Workflow Run
   - Prüfe die Step-Logs
   - Suche nach "⚠️ webhook not configured"

4. **Prüfe Webhook-Gültigkeit**
   - Teste den Webhook direkt mit `curl` oder Postman
   - Stelle sicher, dass er nicht abgelaufen ist

### Workflow schlägt komplett fehl?

- Prüfe die Workflow-Syntax in `.github/workflows/`
- Stelle sicher, dass alle erforderlichen Permissions gesetzt sind
- Prüfe die GitHub Actions Logs für detaillierte Fehlermeldungen

---

## 📞 Support

Bei Problemen:
1. Prüfe zuerst die Troubleshooting-Schritte oben
2. Öffne ein Issue mit der "Automation Issue" Vorlage
3. Füge relevante Logs bei (OHNE Secrets!)

---

## 📚 Weiterführende Dokumentation

- [Discord Webhooks Guide](https://discord.com/developers/docs/resources/webhook)
- [Slack Incoming Webhooks](https://api.slack.com/messaging/webhooks)
- [Teams Webhooks Guide](https://learn.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-incoming-webhook)
- [GitHub Secrets Docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets)

---

**Letzte Aktualisierung**: November 2025  
**Maintainer**: @dinesnimalthas
