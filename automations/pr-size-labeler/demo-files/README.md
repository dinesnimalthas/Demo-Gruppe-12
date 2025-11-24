# PR Size Labeler Demo Files

Diese Dateien helfen dir, verschiedene PR-Größen zu testen.

## 🧪 Quick Test Scripts

### Test 1: Tiny PR (XS) - 🟢
```bash
echo "// Tiny change" >> demo-files/tiny-change.js
git add demo-files/tiny-change.js
git commit -m "Test: Tiny PR"
git push
```
**Erwartetes Label:** `size: XS` 🟢

### Test 2: Small PR (S) - 🟢
```bash
# Füge 30 Zeilen hinzu
cat demo-files/small-feature.js >> demo-files/test.js
git add demo-files/test.js
git commit -m "Test: Small PR"
git push
```
**Erwartetes Label:** `size: S` 🟢

### Test 3: Medium PR (M) - 🟡
```bash
# Füge 150 Zeilen hinzu
cat demo-files/medium-feature.js >> demo-files/test.js
git add demo-files/test.js
git commit -m "Test: Medium PR"
git push
```
**Erwartetes Label:** `size: M` 🟡

### Test 4: Large PR (L) - 🟠
```bash
# Füge 400 Zeilen hinzu
cat demo-files/large-refactor.js >> demo-files/test.js
git add demo-files/test.js
git commit -m "Test: Large PR"
git push
```
**Erwartetes Label:** `size: L` 🟠

### Test 5: Extra Large PR (XL) - 🔴
```bash
# Füge 600 Zeilen hinzu
cat demo-files/huge-change.js >> demo-files/test.js
git add demo-files/test.js
git commit -m "Test: Huge PR"
git push
```
**Erwartetes Label:** `size: XL` 🔴 + `needs split`

## 📋 Präsentations-Demo

### Live Demo Script für die Klasse:

```bash
# 1. Zeige den Workflow
cat .github/workflows/pr-size-labeler.yml

# 2. Erstelle Test-Branch
git checkout -b demo-pr-size

# 3. Mache kleine Änderung
echo "console.log('Hello Class!');" > demo.js
git add demo.js
git commit -m "Demo: Small change for presentation"
git push origin demo-pr-size

# 4. Auf GitHub: Erstelle PR
# → Bot fügt Label "size: XS" hinzu! 🟢

# 5. Mache große Änderung
for i in {1..200}; do echo "console.log('Line $i');" >> big-demo.js; done
git add big-demo.js
git commit -m "Demo: Large change"
git push

# → Bot updated Label zu "size: XL" + Warnung! 🔴
```

## 🎬 Präsentations-Flow

### Schritt 1: Problem erklären
"Große Pull Requests sind schwer zu reviewen und führen zu mehr Bugs."

### Schritt 2: Lösung zeigen
"Unser Bot analysiert automatisch die PR-Größe und hilft Teams, bessere Entscheidungen zu treffen."

### Schritt 3: Live Demo
- Erstelle kleinen PR → Zeige Label 🟢
- Erstelle großen PR → Zeige Label 🔴 + Warnung
- Zeige Statistik-Kommentar

### Schritt 4: Nutzen erklären
- Schnellere Code Reviews
- Weniger Bugs
- Bessere Team-Zusammenarbeit
- Enforced Best Practices

## 💡 Demo-Tipps

1. **Vorbereitung:** Teste alles vorher!
2. **Backup:** Hab Screenshots falls live demo fehlschlägt
3. **Timing:** Kleine PRs dauern ~30 Sekunden bis Label erscheint
4. **Interaktion:** Lass Klassenkameraden Größen raten
5. **Wow-Effekt:** Zeige den automatischen Update bei neuen Commits

## 🎯 Lernziele zeigen

Erkläre was der Bot demonstriert:
- ✅ GitHub Actions (Automation)
- ✅ REST API Integration
- ✅ Best Practices (kleine PRs)
- ✅ Team Tools
- ✅ CI/CD Konzepte

## 📊 Statistiken für Präsentation

Bereite vor:
- "Studies zeigen: PRs < 200 Zeilen werden 3x schneller reviewed"
- "Große PRs haben 40% mehr Bugs"
- "Kleine PRs = bessere Code Quality"

(Quelle: Google's Engineering Practices, Microsoft DevOps Research)
