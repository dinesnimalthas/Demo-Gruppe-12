# Discord Notifications 🎮

Real-Time Discord Notifications für alle GitHub Events mit Rich Embeds!

## 🎯 Features

### ✅ Was wird notified:

#### Pull Requests:
- 🆕 **PR Opened** - Mit Size, Author, Changes
- 🔴 **Large PR Warning** - Alert bei PRs > 500 Zeilen
- ✅ **PR Merged** - Celebration Message
- 🔄 **PR Updated** - Size änderungen

#### Issues:
- 📋 **New Issue** - Mit Type Detection (Bug, Feature, Question)
- 🚨 **Security Alert** - @everyone Ping bei kritischen Issues
- ⚡ **High Priority** - Sofortige Benachrichtigung
- 🏷️ **Label Changes** - Updates bei wichtigen Labels

### 🎨 Rich Embeds mit:
- **Farb-Kodierung** (Grün = Good, Gelb = OK, Rot = Warning)
- **Direct Links** zu PR/Issue
- **User Mentions** mit Avataren
- **Statistiken** (Lines, Files, etc.)
- **Timestamps** (Wann erstellt)
- **Footer** mit Repo-Info

## 🚀 Setup

### Schritt 1: Discord Webhook erstellen

1. Öffne deinen Discord Server
2. Gehe zu **Server Settings** → **Integrations**
3. Klicke auf **Webhooks** → **New Webhook**
4. Gib einen Namen: `GitHub Bot` oder `PR Notifications`
5. Wähle den Channel aus (z.B. `#github` oder `#pull-requests`)
6. **Kopiere die Webhook URL**
   - Format: `https://discord.com/api/webhooks/123456789/abcdefgh...`

### Schritt 2: GitHub Secret hinzufügen

1. Gehe zu deinem GitHub Repository
2. **Settings** → **Secrets and variables** → **Actions**
3. Klicke **New repository secret**
4. Name: `DISCORD_WEBHOOK_URL`
5. Value: [Deine Webhook URL einfügen]
6. **Add secret**

### Schritt 3: Workflow aktivieren

```bash
# Merge den discord-notifications Branch in main
git checkout main
git merge feature/discord-notifications
git push origin main
```

### Schritt 4: Testen! 🧪

```bash
# Erstelle einen Test-PR
git checkout -b test-discord
echo "test" > test.txt
git add . && git commit -m "Test Discord notifications"
git push origin test-discord
# → Erstelle PR auf GitHub
# → Discord Message erscheint! 🎉
```

## 📊 Notification Types

### 1. PR Opened (Grün/Gelb/Orange/Rot)
```
🟢 New Pull Request: Add feature X
📏 Size: Small
📊 Changes: 45 lines in 3 files
👤 Author: @username
🔀 Branch: feature/x → main
```

### 2. Large PR Warning (Rot) 🚨
```
🚨 Large PR Alert!
PR #42 is too large and should be split!
🏷️ Label Added: size: XL
💡 Recommendation: Split into smaller PRs
```

### 3. New Issue (Blau/Rot/Grün/Lila)
```
🐛 Bug Report: Calculator crashes
👤 Author: @username
#️⃣ Issue Number: #15
[Beschreibung...]
```

### 4. Security Alert (Rot mit @everyone) ⚠️
```
@everyone 🚨 CRITICAL ALERT 🚨
⚠️ Critical Issue: SQL Injection Vulnerability
🏷️ Label: security
⚡ Action Required: Immediate attention!
```

### 5. PR Merged (Grün) ✅
```
✅ Pull Request Merged!
Add new feature has been merged into main
👤 Author: @username
🎉 Merged by: @maintainer
#️⃣ PR Number: #42
```

## 🎨 Farb-Kodierung

| Event | Farbe | Hex | Bedeutung |
|-------|-------|-----|-----------|
| Small PR | 🟢 Green | #2ecc71 | Perfect size |
| Medium PR | 🟡 Yellow | #ffff00 | OK size |
| Large PR | 🟠 Orange | #ffa500 | Warning |
| XL PR / Security | 🔴 Red | #e74c3c | Alert! |
| Issue | 🔵 Blue | #7289da | Info |
| Feature | 🟢 Green | #2ecc71 | Enhancement |
| Question | 🟣 Purple | #9b59b6 | Help needed |
| Merged | 🟢 Dark Green | #57f287 | Success |

## 🎬 Für die Präsentation

### Demo-Flow:

1. **Zeige Discord Channel** (leer oder mit alten Messages)
2. **Erstelle einen PR** live auf GitHub
3. **Warte 5 Sekunden** ⏱️
4. **Boom! Discord Message erscheint!** 🎉
5. **Zeige Rich Embed** mit allen Details
6. **Erstelle großen PR** (500+ Zeilen)
7. **Discord Alert erscheint** 🚨 mit Warnung
8. **WOW-Effekt garantiert!** ⭐

### Präsentations-Tipps:
- Discord auf zweitem Monitor/Fenster öffnen
- **Split-Screen**: GitHub links, Discord rechts
- Bei PR-Creation auf Discord warten
- Reaktion der Klasse = unbezahlbar! 😄

## 🔧 Anpassungen

### Custom Notifications hinzufügen:

```yaml
- name: Custom Event
  if: [deine Bedingung]
  uses: actions/github-script@v7
  env:
    DISCORD_WEBHOOK: ${{ secrets.DISCORD_WEBHOOK_URL }}
  with:
    script: |
      const payload = {
        embeds: [{
          title: 'Dein Titel',
          description: 'Deine Beschreibung',
          color: 3066993,
          // ... mehr Felder
        }]
      };
      await fetch(process.env.DISCORD_WEBHOOK, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
```

### Farben ändern:
```javascript
// Decimal Farb-Codes:
3066993   // Grün
16776960  // Gelb
16753920  // Orange
15158332  // Rot
7506394   // Blau
10181046  // Lila
```

### @everyone Pings:
```javascript
const payload = {
  content: '@everyone Wichtige Nachricht!',
  embeds: [...]
};
```

## 📋 Event Liste

| Event | Trigger | Notification |
|-------|---------|--------------|
| `pull_request.opened` | PR erstellt | ✅ PR Info mit Size |
| `pull_request.labeled` | Label hinzugefügt | ✅ Bei XL/needs split |
| `pull_request.closed` | PR merged | ✅ Merged Celebration |
| `issues.opened` | Issue erstellt | ✅ Issue Info |
| `issues.labeled` | Label hinzugefügt | ✅ Bei security/high |
| `pull_request_review.submitted` | Review | 🔄 Optional |

## 🐛 Troubleshooting

**Notifications kommen nicht an:**
- ✅ Webhook URL korrekt in Secrets?
- ✅ Workflow in main branch gemerged?
- ✅ Discord Channel richtig?
- ✅ Check Actions Log in GitHub

**Test Webhook:**
```bash
curl -X POST "DEINE_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d '{"content":"Test from terminal!"}'
```

**Webhook URL ändern:**
1. Discord: Webhook löschen und neu erstellen
2. GitHub: Secret aktualisieren
3. Workflows neu triggern

## 🔒 Sicherheit

⚠️ **WICHTIG:**
- ✅ Webhook URL NIEMALS im Code committen
- ✅ Immer GitHub Secrets verwenden
- ✅ Webhook URL nicht teilen
- ✅ Bei Leak: Webhook löschen und neu erstellen

## 📚 Weitere Ideen

Erweitere die Notifications:
- [ ] Review Requests an spezifische User
- [ ] Daily Summary Messages
- [ ] Code Coverage Reports
- [ ] Deployment Notifications
- [ ] Build Status Updates
- [ ] Contributor Statistics

## 🎓 Lernziele

Dieser Bot demonstriert:
- ✅ Webhook Integration
- ✅ Real-Time Event Handling
- ✅ Rich Message Formatting
- ✅ API Integration (Discord + GitHub)
- ✅ Secrets Management
- ✅ Event-Driven Architecture

---

**Perfect für die Präsentation! Die Klasse wird begeistert sein! 🚀**

*Live Discord Notifications = Maximum WOW-Effekt! 🎉*
