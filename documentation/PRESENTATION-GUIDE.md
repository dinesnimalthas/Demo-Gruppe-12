# 🎯 Präsentations-Guide

**TechGear Store - Automatisierte Support-Workflows**

---

## 📋 Präsentations-Ablauf (15 Minuten)

### 1️⃣ Intro (2 Min)
**Was zeigen wir?**
- E-Commerce Store mit vollautomatisiertem Support
- 6 GitHub Actions Workflows in Produktion
- Multi-Channel Benachrichtigungen (Teams, Discord, Slack)

**Problem Statement:**
> "Wie kann ein kleines E-Commerce-Team hunderte Support-Anfragen effizient bearbeiten?"

### 2️⃣ Website Demo (3 Min)
🌐 **Live-Demo**: https://hslu-exercise.github.io/Demo-Gruppe-12/

**Zeigen:**
1. **Hero Section** - Professionelles Design
2. **Bestsellers** - Premium Produktkarten mit Ratings
3. **Support Form** ⭐ - Hier passiert die Magie!

**Durchführen:**
```
Name: Max Mustermann
Email: max@test.com
Kategorie: technical
Problem: "Login funktioniert nicht nach Update"
☑️ Dringend
```

### 3️⃣ Automation in Action (5 Min)
📊 **Dashboard**: https://hslu-exercise.github.io/Demo-Gruppe-12/automation-dashboard.html

**Was passiert nach Submit?**

```
1. 🎫 GitHub Issue wird erstellt (#457)
   └─ Title: [TECHNICAL] Support-Anfrage von Max Mustermann
   └─ Labels: technical, critical, priority:high

2. 🤖 Label Triage Bot startet
   └─ Analysiert Keywords: "Login", "nicht"
   └─ Fügt hinzu: authentication, priority:high
   └─ 91.3% Success Rate

3. 📢 Teams Notification gesendet
   └─ Team erhält Alert in < 2 Minuten
   └─ Direkter Link zum Issue
   └─ SLA-Timer startet

4. 💬 Discord Community Update
   └─ Transparent: "Neues Issue #457 - wird bearbeitet"
   └─ 234 Community Members informiert

5. 👤 Expert Assignment
   └─ Automatische Zuweisung an @auth-expert
   └─ Basierend auf Labels & Verfügbarkeit
```

### 4️⃣ Workflows Erklärung (3 Min)

#### 🏷️ Label Triage Bot
```yaml
Trigger: issues.opened, issues.labeled
Process:
  1. Keywords analysieren
  2. Passende Labels zuweisen
  3. Priorität erkennen
  4. Expert zuweisen

Stats: 23 Issues processed | 91.3% Success Rate
```

#### 📢 Teams/Discord/Slack Notifications
```yaml
Trigger: issues.opened, critical labels
Process:
  1. Issue-Details formatieren
  2. Webhook Request senden
  3. Team sofort informiert

Stats: 147 Notifications | < 2min Response Time
```

#### 📏 PR Size Labeler
```yaml
Trigger: pull_request.opened
Process:
  1. Changed Lines zählen
  2. Label vergeben (XS-XL)
  3. Review-Empfehlung

Stats: 45 PRs | Durchschnitt: Medium
```

### 5️⃣ Code Walkthrough (2 Min)

**GitHub Workflow Beispiel:**
```yaml
name: Label Triage Bot
on:
  issues:
    types: [opened, labeled]

jobs:
  auto-label:
    runs-on: ubuntu-latest
    steps:
      - name: Check Keywords
        uses: actions/github-script@v7
        with:
          script: |
            const body = context.payload.issue.body;
            const labels = [];
            
            if (body.includes('login') || body.includes('authentifizierung')) {
              labels.push('authentication');
            }
            
            if (labels.length > 0) {
              await github.rest.issues.addLabels({
                owner: context.repo.owner,
                repo: context.repo.repo,
                issue_number: context.issue.number,
                labels: labels
              });
            }
```

---

## 🎬 Demo-Szenario

### Live-Demonstration

**Setup:**
1. Browser mit Website offen
2. GitHub Repository in 2. Tab
3. Teams/Discord offen (wenn möglich)
4. Dashboard in 3. Tab

**Ablauf:**
```
[Website] → Support-Form ausfüllen
           ↓
[Submit]  → "Wird verarbeitet..." Animation
           ↓
[GitHub]  → Issue #457 erscheint (refresh)
           ↓
[Teams]   → Notification popup
           ↓
[Dashboard] → Stats update live
```

---

## 💡 Key Messages

### Warum ist das cool?
✅ **Zeitersparnis**: 80% weniger manuelle Arbeit
✅ **Schnelligkeit**: < 2 Min Response Time
✅ **Skalierbarkeit**: Hunderte Tickets ohne zusätzliches Personal
✅ **Transparenz**: Community sieht alles in Discord
✅ **Professionell**: Kein Ticket geht verloren

### Business Value
> "Ein 3-Personen-Team kann damit 500+ Support-Anfragen/Monat effizient bearbeiten - das entspricht dem Output eines 10-Personen-Teams ohne Automation!"

---

## 🎯 Technische Highlights

### 1. Multi-Channel Integration
- **Teams**: Business-Kommunikation
- **Discord**: Community-Transparenz
- **Slack**: Team-Koordination
- **Email**: Eskalationen

### 2. Intelligente Kategorisierung
```javascript
Keywords → Labels → Expert Assignment
"payment" → [payment, billing] → @finance-expert
"login" → [auth, security] → @security-expert
"bug" → [bug, needs-repro] → @dev-team
```

### 3. Reusable Workflows
```yaml
# Einmal schreiben, überall verwenden
uses: ./.github/workflows/reusable-pr-size-labeler.yml
with:
  repo-token: ${{ secrets.GITHUB_TOKEN }}
```

---

## 📊 Demo-Statistiken (zeigen)

```
📈 Performance Metrics:
├─ Active Workflows: 6
├─ Support Tickets: 23 (+5 heute)
├─ Response Time: < 2min
├─ Team Alerts: 147 (diese Woche)
├─ Success Rate: 91.3%
└─ Community Members: 234
```

---

## 🚀 Nächste Schritte (Ausblick)

1. **AI-Integration**: ChatGPT für automatische Antworten
2. **Sentiment Analysis**: Emotionale Analyse der Anfragen
3. **Predictive Analytics**: Issue-Trends vorhersagen
4. **Auto-Resolution**: Einfache Issues automatisch lösen

---

## ❓ Q&A Vorbereitung

### Häufige Fragen:

**Q: Ist das sicher mit dem PAT im Frontend?**
A: Nein! Nur Demo. Produktiv würde man ein Backend verwenden mit Server-Side API-Calls.

**Q: Kostet GitHub Actions etwas?**
A: 2000 Minuten/Monat gratis für Public Repos. Das reicht locker!

**Q: Kann man das auch für andere Projekte nutzen?**
A: Absolut! Die Workflows sind wiederverwendbar für jedes GitHub-Projekt.

**Q: Wie lang war die Entwicklungszeit?**
A: ~XX Stunden für Website + Workflows. Dokumentation ~XX Stunden.

**Q: Welche Skills braucht man?**
A: HTML/CSS, JavaScript, YAML, Git. Alles Basics - jeder kann das lernen!

---

## 🎓 Lessons Learned

### Was haben wir gelernt?
✅ GitHub Actions sind mächtiger als gedacht
✅ Automation spart ENORM viel Zeit
✅ Webhooks sind super einfach zu nutzen
✅ Dokumentation ist der Schlüssel
✅ Iteratives Vorgehen funktioniert am besten

### Challenges:
❌ YAML-Syntax ist anfangs verwirrend
❌ Debugging von Workflows ist tricky
❌ Webhook-URLs brauchen Secrets Management
❌ Testing von Live-Workflows schwierig

---

## 📝 Checkliste vor Präsentation

- [ ] Website funktioniert (LIVE testen!)
- [ ] Dashboard funktioniert
- [ ] GitHub PAT ist aktuell (nicht expired!)
- [ ] Webhook URLs sind konfiguriert
- [ ] Browser-Tabs vorbereitet
- [ ] Backup-Screenshots falls Demo fails
- [ ] Notizen/Spickzettel bereit
- [ ] Timer für 15 Min gestellt

---

**Viel Erfolg! 🚀 Break a leg! 🎭**
