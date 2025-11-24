# Script um Labels zu erstellen mit GitHub CLI

# Stelle sicher dass du eingeloggt bist: gh auth login

$labels = @(
    @{name="bug"; color="d73a4a"; description="Etwas funktioniert nicht"},
    @{name="enhancement"; color="a2eeef"; description="Neue Funktion oder Verbesserung"},
    @{name="documentation"; color="0075ca"; description="Verbesserung der Dokumentation"},
    @{name="question"; color="d876e3"; description="Weitere Informationen werden benötigt"},
    @{name="priority: high"; color="b60205"; description="Hohe Priorität"},
    @{name="priority: medium"; color="fbca04"; description="Mittlere Priorität"},
    @{name="priority: low"; color="0e8a16"; description="Niedrige Priorität"},
    @{name="good first issue"; color="7057ff"; description="Gut für Anfänger"},
    @{name="needs triage"; color="fbca04"; description="Muss noch bearbeitet werden"},
    @{name="needs more info"; color="fef2c0"; description="Weitere Informationen erforderlich"},
    @{name="wontfix"; color="ffffff"; description="Wird nicht behoben"},
    @{name="duplicate"; color="cfd3d7"; description="Duplikat eines anderen Issues"},
    @{name="help wanted"; color="008672"; description="Hilfe von der Community erwünscht"},
    @{name="security"; color="ee0701"; description="Sicherheitsproblem"}
)

Write-Host "🏷️  Erstelle GitHub Labels...`n" -ForegroundColor Cyan

$created = 0
$errors = 0

foreach ($label in $labels) {
    try {
        gh label create "$($label.name)" --color $label.color --description "$($label.description)" --force
        Write-Host "✅ Label '$($label.name)' erstellt" -ForegroundColor Green
        $created++
    } catch {
        Write-Host "❌ Fehler bei '$($label.name)': $_" -ForegroundColor Red
        $errors++
    }
}

Write-Host "`n📊 Zusammenfassung:" -ForegroundColor Cyan
Write-Host "   Erstellt: $created" -ForegroundColor Green
Write-Host "   Fehler: $errors" -ForegroundColor Red
Write-Host "   Total: $($labels.Count)" -ForegroundColor White

if ($errors -eq 0) {
    Write-Host "`n🎉 Alle Labels wurden erfolgreich erstellt!" -ForegroundColor Green
} else {
    Write-Host "`n⚠️  Einige Labels konnten nicht erstellt werden." -ForegroundColor Yellow
    Write-Host "   Stelle sicher, dass GitHub CLI installiert und authentifiziert ist:" -ForegroundColor Yellow
    Write-Host "   - Installieren: https://cli.github.com/" -ForegroundColor Yellow
    Write-Host "   - Authentifizieren: gh auth login" -ForegroundColor Yellow
}
