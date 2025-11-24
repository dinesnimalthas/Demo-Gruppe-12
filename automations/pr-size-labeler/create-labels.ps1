# PR Size Labeler - Label Creator
# Erstellt alle benötigten Labels für den PR Size Labeler Bot
#
# Verwendung:
# 1. Installiere GitHub CLI: https://cli.github.com/
# 2. Authentifiziere: gh auth login
# 3. Führe aus: .\create-labels.ps1

$labels = @(
    # Size labels with color gradient
    @{
        name = "size: XS"
        color = "0e8a16"
        description = "< 10 lines changed - Perfect size for quick review"
    },
    @{
        name = "size: S"
        color = "5ec93f"
        description = "< 50 lines changed - Good size for review"
    },
    @{
        name = "size: M"
        color = "fbca04"
        description = "< 200 lines changed - Moderate review needed"
    },
    @{
        name = "size: L"
        color = "ff9800"
        description = "< 500 lines changed - Large PR, consider splitting"
    },
    @{
        name = "size: XL"
        color = "d93f0b"
        description = "500+ lines changed - Very large, should be split"
    },
    # Additional labels
    @{
        name = "needs split"
        color = "d73a4a"
        description = "PR is too large and should be split into smaller PRs"
    }
)

Write-Host "🏷️  Creating PR Size Labeler Labels...`n" -ForegroundColor Cyan

$created = 0
$errors = 0

foreach ($label in $labels) {
    try {
        gh label create "$($label.name)" --color $label.color --description "$($label.description)" --force
        Write-Host "✅ Label '$($label.name)' created" -ForegroundColor Green
        $created++
    } catch {
        Write-Host "❌ Error creating '$($label.name)': $_" -ForegroundColor Red
        $errors++
    }
}

Write-Host "`n📊 Summary:" -ForegroundColor Cyan
Write-Host "   Created: $created" -ForegroundColor Green
Write-Host "   Errors: $errors" -ForegroundColor $(if ($errors -gt 0) { "Red" } else { "Green" })
Write-Host "   Total: $($labels.Count)" -ForegroundColor White

if ($errors -eq 0) {
    Write-Host "`n🎉 All labels created successfully!" -ForegroundColor Green
    Write-Host "`n📝 Next steps:" -ForegroundColor Cyan
    Write-Host "   1. Merge the workflow to main branch" -ForegroundColor White
    Write-Host "   2. Create a test PR" -ForegroundColor White
    Write-Host "   3. Watch the bot add size labels automatically!" -ForegroundColor White
} else {
    Write-Host "`n⚠️  Some labels could not be created." -ForegroundColor Yellow
    Write-Host "   Make sure GitHub CLI is installed and authenticated:" -ForegroundColor Yellow
    Write-Host "   - Install: https://cli.github.com/" -ForegroundColor Yellow
    Write-Host "   - Authenticate: gh auth login" -ForegroundColor Yellow
}

Write-Host "`n🎨 Label Color Guide:" -ForegroundColor Cyan
Write-Host "   🟢 size: XS/S - Green (good)" -ForegroundColor Green
Write-Host "   🟡 size: M - Yellow (moderate)" -ForegroundColor Yellow
Write-Host "   🟠 size: L - Orange (large)" -ForegroundColor DarkYellow
Write-Host "   🔴 size: XL - Red (too large)" -ForegroundColor Red
