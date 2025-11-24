# GitHub Automations

Dieses Repository enthält verschiedene GitHub Automations und Bots.

## 📁 Verfügbare Automationen

### 🏷️ [Label & Triage Bot](label-triage-bot/)

Automatische Label-Vergabe und Triage für Issues und Pull Requests.

**Features:**
- Automatisches Labeling basierend auf Keywords
- Willkommens-Nachrichten für neue Contributors
- Prüfung auf fehlende Informationen
- Issue Templates für strukturierte Reports

**Status:** ✅ Aktiv

[→ Zur Dokumentation](label-triage-bot/README.md)

---

### 📏 [PR Size Labeler](pr-size-labeler/)

Automatische Größen-Bewertung von Pull Requests mit visuellen Labels.

**Features:**
- Automatische Größen-Labels (XS, S, M, L, XL)
- Detaillierte Statistiken in PR-Kommentaren
- Warnungen bei sehr großen PRs
- Smart Updates bei Änderungen
- Empfehlungen für bessere PRs

**Status:** ✅ Aktiv

**Perfect für:** 🎬 Präsentationen und Live-Demos!

[→ Zur Dokumentation](pr-size-labeler/README.md)

---

### 🎮 [Discord Notifications](discord-notifications/) 🔥

Real-Time Discord Notifications für alle GitHub Events mit Rich Embeds!

**Features:**
- Real-Time Notifications (< 5 Sekunden)
- Rich Embeds mit Farb-Kodierung
- Large PR Alerts 🚨
- Security Issue @everyone Pings
- PR Merged Celebrations
- Direct Links zu GitHub

**Status:** ✅ Aktiv

**WOW-Factor:** ⭐⭐⭐⭐⭐ **Maximum für Präsentationen!**

[→ Zur Dokumentation](discord-notifications/README.md)  
[→ Live Demo Guide](discord-notifications/LIVE-DEMO-GUIDE.md)

---

## 📚 Weitere Automationen

Weitere Automationen werden in eigenen Unterordnern organisiert:

```
automations/
├── label-triage-bot/      # Label & Triage Automation
├── pr-size-labeler/       # PR Size Analysis
├── discord-notifications/ # 🔥 Real-Time Discord Alerts
├── [weitere-automation]/  # Zukünftige Automationen
└── ...
```

## 🚀 Allgemeine Hinweise

### Workflow-Aktivierung

Alle GitHub Actions Workflows müssen im **main branch** sein, um zu funktionieren:

1. Branch mit Workflows erstellen
2. Pull Request zum main branch
3. PR mergen
4. Workflows werden automatisch aktiv

### Permissions

Stelle sicher, dass die Repository-Settings korrekt sind:
- **Settings → Actions → General → Workflow permissions**
- Setze auf: **"Read and write permissions"**

### Testing

Jede Automation hat eigene Test-Anweisungen in der jeweiligen README.

## 📖 Struktur

Jede Automation sollte folgende Struktur haben:

```
automation-name/
├── README.md              # Hauptdokumentation
├── SETUP.md               # Setup-Anleitung (optional)
├── example-code/          # Beispiel-Code (falls relevant)
└── scripts/               # Hilfs-Skripte (falls relevant)
```

Die eigentlichen Workflows befinden sich in `.github/workflows/`.

## 🤝 Beitragen

Um eine neue Automation hinzuzufügen:

1. Erstelle einen neuen Unterordner in `automations/`
2. Füge eine README.md mit Dokumentation hinzu
3. Erstelle die Workflow-Dateien in `.github/workflows/`
4. Teste auf einem Feature-Branch
5. Erstelle einen PR zum main branch

## 📝 Lizenz

Siehe Haupt-Repository LICENSE.
