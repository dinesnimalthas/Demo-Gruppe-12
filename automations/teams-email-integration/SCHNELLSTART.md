# 🚀 Teams Integration Schnellstart

## ✅ Du hast bereits gemacht:
- ✅ Teams Webhook über Connections erstellt
- ✅ Secret `TEAMS_WEBHOOK_URL` in GitHub hinzugefügt

## 🎯 Was jetzt noch zu tun ist:

### Schritt 1: Email-Secret hinzufügen (Optional)
Da der Workflow auch `ENABLE_EMAIL` prüft, solltest du das Secret hinzufügen:

1. Gehe zu: **Settings → Secrets and variables → Actions**
2. Klicke auf **"New repository secret"**
3. Name: `ENABLE_EMAIL`
4. Value: `false` (da du erstmal nur Teams nutzt)
5. Klicke auf **"Add secret"**

### Schritt 2: Webhook lokal testen

```powershell
# Teste dein Teams Webhook (ersetze URL mit deiner):
.\automations\teams-email-integration\test-teams-webhook.ps1 -WebhookUrl "https://outlook.office.com/webhook/DEINE-URL"
```

Das sendet eine Test-Nachricht an deinen Teams Channel.

### Schritt 3: GitHub Workflow testen

Der Workflow läuft automatisch bei:
- ✅ Neuen Issues (mit bestimmten Labels)
- ✅ Pull Requests
- ✅ Releases

**So testest du es:**

#### Test A: Kritisches Issue erstellen
1. Gehe zu deinem Repository auf GitHub
2. Klicke auf **"Issues" → "New issue"**
3. Erstelle ein Issue mit Titel: `[TEST] Kritisches Problem`
4. Füge das Label `critical` oder `urgent` hinzu
5. ✅ **Du solltest jetzt eine Teams-Benachrichtigung erhalten!**

#### Test B: Pull Request erstellen
1. Erstelle einen neuen Branch:
   ```powershell
   git checkout -b test/teams-notification
   ```
2. Mache eine kleine Änderung (z.B. in README.md)
3. Commit und push:
   ```powershell
   git add .
   git commit -m "test: Teams notification"
   git push -u origin test/teams-notification
   ```
4. Erstelle einen Pull Request auf GitHub
5. ✅ **Du solltest eine Teams-Benachrichtigung erhalten!**

### Schritt 4: Workflow-Logs überprüfen

Wenn keine Benachrichtigung kommt:

1. Gehe zu **Actions** Tab in deinem Repository
2. Klicke auf den neuesten Workflow-Run
3. Klicke auf den Job "Send Teams & Email Notifications"
4. Überprüfe die Logs auf Fehlermeldungen

## 🔍 Troubleshooting

### ❌ "Keine Benachrichtigung erhalten"

**Check 1: Secret korrekt gespeichert?**
- Settings → Secrets and variables → Actions
- `TEAMS_WEBHOOK_URL` muss dort erscheinen
- ⚠️ Der Wert wird aus Sicherheitsgründen nicht angezeigt

**Check 2: Webhook URL korrekt?**
```powershell
# Teste die URL direkt:
$webhook = "DEINE_TEAMS_URL"
$body = @{
    "text" = "🧪 Test von PowerShell"
} | ConvertTo-Json

Invoke-RestMethod -Uri $webhook -Method Post -Body $body -ContentType "application/json"
```

**Check 3: Issue hat kritisches Label?**
Der Workflow sendet nur bei diesen Labels:
- `critical`
- `urgent`
- `priority: high`

**Check 4: Workflow-Logs überprüfen**
- GitHub → Actions → Workflow Run auswählen
- Nach Fehlern suchen

### ❌ "Teams Notification fehlgeschlagen"

Mögliche Ursachen:
1. **Webhook deaktiviert**: Überprüfe in Teams, ob der Webhook noch aktiv ist
2. **Falsche URL**: Die URL muss mit `https://outlook.office.com/webhook/` beginnen
3. **Teams Kanal gelöscht**: Erstelle einen neuen Webhook

### ✅ "Workflow läuft, aber kein Output"

Das ist normal, wenn:
- Issue kein kritisches Label hat
- PR nicht in den Trigger-Status kommt
- Der Workflow prüft zuerst die Bedingungen

## 📊 Was der Workflow macht:

### Bei Issues:
```
1. Prüft ob Issue neu ist oder gelabelt wurde
2. Sucht nach Labels: "critical", "urgent", "priority: high"
3. Wenn gefunden → Sendet Teams Notification mit:
   - Issue Titel & Nummer
   - Reporter
   - Labels
   - Link zum Issue
```

### Bei Pull Requests:
```
1. Prüft ob PR geöffnet, geschlossen oder ready for review
2. Sendet Teams Notification mit:
   - PR Titel & Nummer
   - Branch Namen
   - Autor
   - Status (geöffnet/gemerged/geschlossen)
   - Link zum PR
```

### Bei Releases:
```
1. Prüft ob neues Release veröffentlicht wurde
2. Sendet Teams Notification mit:
   - Version Tag
   - Release Name
   - Release Notes (gekürzt)
   - Link zum Release
```

## 🎨 Notification Farben:

- 🔴 **Rot (FF0000)**: Kritische Issues
- 🔵 **Blau (0078D4)**: Pull Requests geöffnet
- 🟢 **Grün (28a745)**: PR gemerged
- 🔴 **Rot (dc3545)**: PR geschlossen ohne Merge
- 🟡 **Gelb (ffc107)**: PR ready for review
- 🟣 **Lila (9C27B0)**: Neue Releases

## 💡 Tipps:

1. **Teste zuerst lokal** mit dem PowerShell-Script
2. **Erstelle Labels** bevor du Issues testest:
   ```powershell
   # Labels erstellen (falls noch nicht vorhanden)
   gh label create "critical" --color FF0000 --description "Kritisches Problem"
   gh label create "urgent" --color FF6B6B --description "Dringend"
   ```
3. **Überprüfe immer die Workflow-Logs** bei Problemen
4. **Nutze Test-Issues** mit dem Präfix `[TEST]`

## 📞 Support:

Wenn nichts funktioniert:
1. Überprüfe alle Secrets noch einmal
2. Teste die Webhook-URL manuell
3. Schaue in die Workflow-Logs
4. Erstelle ein Issue mit den Fehlermeldungen

---

**🎯 Viel Erfolg! Wenn alles funktioniert, solltest du jetzt Teams-Benachrichtigungen für wichtige Repository-Events erhalten.**
