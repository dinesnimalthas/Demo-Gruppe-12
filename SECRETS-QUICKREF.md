# 🎯 SECRETS SCHNELLÜBERSICHT

Für die **vollständige Dokumentation** siehe [SECRETS.md](SECRETS.md)

## 🔐 Erforderliche Repository Secrets

Gehe zu: **Settings → Secrets and variables → Actions → New repository secret**

### 1. Discord Integration (Optional)

**Secret Name**: `DISCORD_WEBHOOK_URL`  
**Format**: `https://discord.com/api/webhooks/1234567890/AbCdEfGhIjKlMnOpQrStUvWxYz`

**Wie bekomme ich das?**
1. Discord → Server Settings → Integrations → Webhooks
2. "New Webhook" → Wähle Channel (z.B. `#github-notifications`)
3. Kopiere URL → Füge als Secret hinzu

**Test**: `.\automations\discord-notifications\test-webhook.ps1`

---

### 2. Slack Integration (Optional)

**Secret Name**: `SLACK_WEBHOOK_URL`  
**Format**: `https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXX`

**Wie bekomme ich das?**
1. [api.slack.com/apps](https://api.slack.com/apps) → "Create New App"
2. "Incoming Webhooks" → Aktivieren → "Add New Webhook to Workspace"
3. Wähle Channel (z.B. `#github`) → Kopiere URL → Füge als Secret hinzu

**Test**: `.\automations\slack-notifications\test-slack-webhook.ps1`

---

### 3. Microsoft Teams Integration (Optional)

**Secret Name**: `TEAMS_WEBHOOK_URL`  
**Format**: `https://[tenant].webhook.office.com/webhookb2/...`

**Wie bekomme ich das?**
1. Teams → Channel → "..." → "Workflows"
2. "Post to a channel when a webhook request is received" → "Add workflow"
3. Kopiere URL → Füge als Secret hinzu

**Test**: `.\automations\teams-email-integration\test-teams-webhook.ps1`

---

### 4. GitHub Token (Automatisch)

**Secret Name**: `GITHUB_TOKEN`  
**Status**: ✅ Wird automatisch von GitHub bereitgestellt - keine Aktion erforderlich!

---

## ⚡ Wichtig zu wissen

### ✅ Demo funktioniert OHNE Secrets!
Alle Workflows haben "Graceful Degradation":
- Workflows laufen erfolgreich
- Labels werden zugewiesen
- Benachrichtigungen werden nur gesendet, wenn Webhooks konfiguriert sind

### 🎬 Perfekt für Demos
Du kannst das gesamte Projekt präsentieren, ohne Webhooks konfigurieren zu müssen!

### 🔒 Sicherheit
- **NIEMALS** Webhooks im Code committen
- **NIEMALS** Secrets in Issues posten
- Immer GitHub Secrets verwenden

---

## 📊 Secrets Status-Übersicht

| Secret | Status | Benötigt für | Erforderlich |
|--------|--------|--------------|--------------|
| `DISCORD_WEBHOOK_URL` | 🔴 Setup | Discord Notifications | Nein* |
| `SLACK_WEBHOOK_URL` | 🔴 Setup | Slack Notifications | Nein* |
| `TEAMS_WEBHOOK_URL` | 🔴 Setup | Teams Notifications | Nein* |
| `GITHUB_TOKEN` | ✅ Auto | Alle Workflows | Automatisch |

\* Optional - nur wenn du die Integration nutzen möchtest

---

## 🆘 Quick-Troubleshooting

### Workflow läuft, aber keine Benachrichtigung?
1. Prüfe Secret-Name (exakte Schreibweise!)
2. Teste Webhook manuell mit PowerShell-Script
3. Prüfe Workflow-Logs: "⚠️ webhook not configured"

### Webhook funktioniert nicht?
1. Prüfe ob Webhook-URL korrekt ist
2. Teste mit `curl` oder Postman
3. Prüfe ob Webhook nicht abgelaufen ist

---

## 📚 Weitere Infos

**Vollständige Dokumentation**: [SECRETS.md](SECRETS.md)  
**Setup-Checklist**: [SETUP-CHECKLIST.md](SETUP-CHECKLIST.md)  
**Hauptdokumentation**: [README.md](README.md)

---

**Need Help?** Öffne ein Issue mit der "Automation Issue" Vorlage!
