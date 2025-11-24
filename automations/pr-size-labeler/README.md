# PR Size Labeler 🚀

Automatische Größen-Bewertung von Pull Requests mit visuellen Labels und hilfreichen Statistiken.

## 🎯 Was macht dieser Bot?

Der PR Size Labeler analysiert automatisch jeden Pull Request und:
- 🏷️ Fügt ein **Größen-Label** hinzu (XS, S, M, L, XL)
- 📊 Erstellt einen **Statistik-Kommentar** mit Details
- ⚠️ **Warnt** bei sehr großen PRs
- 💡 Gibt **Empfehlungen** für bessere PRs
- 🔄 **Aktualisiert** sich automatisch bei Änderungen

## 🎨 Size Categories

| Label | Changes | Emoji | Review Time | Status |
|-------|---------|-------|-------------|--------|
| `size: XS` | < 10 | 🟢 | ~5 min | Ideal |
| `size: S` | < 50 | 🟢 | ~15 min | Good |
| `size: M` | < 200 | 🟡 | ~30 min | OK |
| `size: L` | < 500 | 🟠 | ~1 hour | Large |
| `size: XL` | 500+ | 🔴 | 2+ hours | Too Large |

## ✨ Features

### 1. Automatische Labels
```
PR mit 25 Zeilen → Label: size: S 🟢
PR mit 150 Zeilen → Label: size: M 🟡
PR mit 600 Zeilen → Label: size: XL 🔴 + "needs split"
```

### 2. Detaillierter Kommentar
Jeder PR bekommt einen Kommentar mit:
- Gesamtanzahl der Änderungen
- Hinzugefügte und gelöschte Zeilen
- Anzahl geänderter Dateien
- Größen-Kategorie
- Spezifische Empfehlung
- Größen-Richtlinien

### 3. Smart Updates
- Kommentar wird bei neuen Commits **automatisch aktualisiert**
- Alte Labels werden **automatisch entfernt**
- "needs split" Label wird hinzugefügt/entfernt basierend auf Größe

## 🚀 Installation

### Schritt 1: Labels erstellen

Führe das Skript aus:

**PowerShell:**
```powershell
cd automations/pr-size-labeler
.\create-labels.ps1
```

**Node.js:**
```bash
cd automations/pr-size-labeler
node create-labels.js
```

### Schritt 2: Workflow aktivieren

Der Workflow in `.github/workflows/pr-size-labeler.yml` muss in den **main branch** gemerged werden.

```bash
# Branch pushen
git push origin feature/pr-size-labeler

# PR erstellen und mergen auf GitHub
```

### Schritt 3: Repository Permissions prüfen

Gehe zu: **Settings → Actions → General → Workflow permissions**

Stelle sicher: ✅ **"Read and write permissions"**

## 🧪 Testing

### Test 1: Kleiner PR (XS)
```bash
# Erstelle kleinen PR
echo "// Small change" >> test.js
git add test.js
git commit -m "Small update"
git push origin test-branch

# Erwartetes Ergebnis: Label "size: XS" 🟢
```

### Test 2: Großer PR (XL)
```bash
# Erstelle großen PR
for i in {1..100}; do echo "console.log('line $i');" >> large-file.js; done
git add large-file.js
git commit -m "Large change"
git push origin test-branch

# Erwartetes Ergebnis: Labels "size: XL" 🔴 + "needs split"
```

## 📊 Live Demo Flow (für Präsentation)

### 1. Zeige den Workflow
```bash
cat .github/workflows/pr-size-labeler.yml
# Erkläre: Läuft bei jedem PR, zählt Zeilen, fügt Labels hinzu
```

### 2. Erstelle Test-PR live
```bash
# Kleiner PR
echo "console.log('demo');" > demo.js
git checkout -b demo-small-pr
git add demo.js
git commit -m "Demo: Small PR"
git push origin demo-small-pr
# Erstelle PR auf GitHub → Zeige Label "size: S" 🟢
```

### 3. Zeige großen PR
```bash
# Großer PR
for i in {1..200}; do echo "Line $i" >> big-file.txt; done
git checkout -b demo-large-pr
git add big-file.txt
git commit -m "Demo: Large PR"
git push origin demo-large-pr
# Erstelle PR → Zeige Label "size: XL" 🔴 + Warnung
```

### 4. Erkläre den Nutzen
- "Hilft Teams, PRs klein zu halten"
- "Schnellere Code Reviews"
- "Weniger Bugs durch fokussierte Reviews"
- "Bessere Code-Qualität"

## 💡 Best Practices

### ✅ DO:
- Halte PRs unter 200 Zeilen
- Ein Feature = Ein PR
- Refactoring separat von Features
- Tests in separaten PRs (wenn sehr groß)

### ❌ DON'T:
- Mehrere Features in einem PR
- Große Refactorings mit Features mischen
- Generated Code ohne Überprüfung
- 1000+ Zeilen PRs erstellen

## 🔧 Konfiguration

### Größen anpassen

In `.github/workflows/pr-size-labeler.yml` kannst du die Schwellenwerte ändern:

```javascript
if (totalChanges < 10) {        // XS: Ändere auf gewünschte Zahl
  sizeLabel = 'size: XS';
} else if (totalChanges < 50) { // S: Ändere auf gewünschte Zahl
  sizeLabel = 'size: S';
}
// etc...
```

### Labels anpassen

Bearbeite `create-labels.ps1` oder `create-labels.js` um Label-Farben oder -Namen zu ändern.

## 📈 Statistiken

Der Bot tracked:
- ✅ Additions (hinzugefügte Zeilen)
- ❌ Deletions (gelöschte Zeilen)
- 📁 Files changed (geänderte Dateien)
- 📏 Total changes (Gesamtänderungen)

## 🎬 Präsentations-Tipps

### Wow-Effekte für die Klasse:
1. **Live Demo**: Erstelle PR während der Präsentation
2. **Vorher/Nachher**: Zeige PR ohne und mit Bot
3. **Praktischer Nutzen**: Erkläre reale Vorteile
4. **Interaktiv**: Lass Klassenkameraden PRs testen

### Präsentations-Struktur:
```
1. Problem: "Große PRs sind schwer zu reviewen"
2. Lösung: "Automatische Größen-Bewertung"
3. Demo: Live PR erstellen
4. Ergebnis: Labels und Kommentar zeigen
5. Nutzen: Bessere Code-Quality, schnellere Reviews
```

## 🐛 Troubleshooting

**Bot läuft nicht:**
- ✅ Workflow im main branch?
- ✅ Permissions gesetzt?
- ✅ Labels erstellt?

**Labels werden nicht hinzugefügt:**
- Prüfe Actions-Log in GitHub
- Prüfe ob Labels existieren
- Prüfe Permissions

**Kommentar erscheint nicht:**
- Prüfe `pull-requests: write` Permission
- Prüfe Actions-Log für Fehler

## 📚 Weiterführende Ideen

Erweitere den Bot:
- [ ] Integration mit Slack/Discord Notifications
- [ ] Automatisches Review-Assignment basierend auf Größe
- [ ] Metriken-Dashboard für Team-PRs
- [ ] Automatisches PR-Splitting bei sehr großen Changes

## 🎓 Lernziele (für IT Project Basics)

Dieser Bot demonstriert:
- ✅ GitHub Actions Workflows
- ✅ API-Integration (GitHub REST API)
- ✅ Automatisierung im Dev-Workflow
- ✅ Best Practices (kleine PRs)
- ✅ Team-Collaboration Tools
- ✅ CI/CD Basics

---

**Erstellt für:** IT Project Basics, HSLU  
**Gruppe:** 12  
**Perfect für:** Präsentationen und praktische Demos! 🎉
