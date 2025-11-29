# 🚀 TechGear Store - Quick Demo Starter

Write-Host "🎬 Starting TechGear Store Demo..." -ForegroundColor Cyan
Write-Host ""

# Prüfe, ob wir im richtigen Verzeichnis sind
if (-not (Test-Path "docs/index.html")) {
    Write-Host "❌ Error: docs/index.html nicht gefunden!" -ForegroundColor Red
    Write-Host "Bitte führe das Script im Repository-Root aus." -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Repository gefunden" -ForegroundColor Green
Write-Host ""

# Zeige Repository-Informationen
Write-Host "📋 Repository Informationen:" -ForegroundColor Cyan
Write-Host "  Name: Demo-Gruppe-12" -ForegroundColor White
Write-Host "  Owner: dinesnimalthas" -ForegroundColor White
Write-Host "  Branch: main" -ForegroundColor White
Write-Host ""

# Prüfe GitHub CLI
Write-Host "🔍 Prüfe GitHub CLI Installation..." -ForegroundColor Cyan
$ghInstalled = Get-Command gh -ErrorAction SilentlyContinue
if ($ghInstalled) {
    Write-Host "✅ GitHub CLI ist installiert" -ForegroundColor Green
    gh --version
} else {
    Write-Host "⚠️  GitHub CLI nicht gefunden (optional)" -ForegroundColor Yellow
    Write-Host "   Download: https://cli.github.com/" -ForegroundColor Gray
}
Write-Host ""

# Zeige verfügbare Demos
Write-Host "🎯 Verfügbare Demo-Optionen:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  [1] 🌐 Website öffnen (index.html)" -ForegroundColor White
Write-Host "  [2] 📖 Quick-Start Guide öffnen" -ForegroundColor White
Write-Host "  [3] 🎬 Live-Demo Guide öffnen" -ForegroundColor White
Write-Host "  [4] 📊 Automation Dashboard öffnen" -ForegroundColor White
Write-Host "  [5] 🧪 Webhooks testen" -ForegroundColor White
Write-Host "  [6] 📝 Alle Guides anzeigen" -ForegroundColor White
Write-Host "  [7] 🔐 Secrets Dokumentation" -ForegroundColor White
Write-Host "  [0] ❌ Beenden" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Wähle eine Option (0-7)"

switch ($choice) {
    "1" {
        Write-Host "🌐 Öffne Website..." -ForegroundColor Green
        Start-Process "docs/index.html"
    }
    "2" {
        Write-Host "📖 Öffne Quick-Start Guide..." -ForegroundColor Green
        Start-Process "documentation\QUICK-START.md"
    }
    "3" {
        Write-Host "🎬 Öffne Live-Demo Guide..." -ForegroundColor Green
        Start-Process "documentation\LIVE-DEMO-GUIDE.md"
    }
    "4" {
        Write-Host "📊 Öffne Automation Dashboard..." -ForegroundColor Green
        Start-Process "docs/automation-dashboard.html"
    }
    "5" {
        Write-Host "🧪 Webhook Tests..." -ForegroundColor Cyan
        Write-Host ""
        Write-Host "  [1] Test Discord Webhook" -ForegroundColor White
        Write-Host "  [2] Test Slack Webhook" -ForegroundColor White
        Write-Host "  [3] Test Teams Webhook" -ForegroundColor White
        Write-Host ""
        $webhookChoice = Read-Host "Wähle Webhook (1-3)"
        
        switch ($webhookChoice) {
            "1" {
                Write-Host "Testing Discord Webhook..." -ForegroundColor Green
                & "automations/discord-notifications/test-webhook.ps1"
            }
            "2" {
                Write-Host "Testing Slack Webhook..." -ForegroundColor Green
                & "automations/slack-notifications/test-slack-webhook.ps1"
            }
            "3" {
                Write-Host "Testing Teams Webhook..." -ForegroundColor Green
                & "automations/teams-email-integration/test-teams-webhook.ps1"
            }
            default {
                Write-Host "❌ Ungültige Auswahl" -ForegroundColor Red
            }
        }
    }
    "6" {
        Write-Host "📝 Öffne alle Dokumentations-Dateien..." -ForegroundColor Green
        Start-Process "README.md"
        Start-Sleep -Seconds 1
        Start-Process "documentation\QUICK-START.md"
        Start-Sleep -Seconds 1
        Start-Process "documentation\LIVE-DEMO-GUIDE.md"
        Start-Sleep -Seconds 1
        Start-Process "documentation\PRAESENTATION-STRUKTUR.md"
    }
    "7" {
        Write-Host "🔐 Öffne Secrets Dokumentation..." -ForegroundColor Green
        Start-Process "documentation\SECRETS.md"
    }
    "0" {
        Write-Host "👋 Auf Wiedersehen!" -ForegroundColor Cyan
        exit 0
    }
    default {
        Write-Host "❌ Ungültige Auswahl" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "✨ Demo gestartet!" -ForegroundColor Green
Write-Host ""
Write-Host "📚 Weitere Informationen:" -ForegroundColor Cyan
Write-Host "  README.md - Projekt-Übersicht" -ForegroundColor Gray
Write-Host "  documentation\QUICK-START.md - Schnellstart-Anleitung" -ForegroundColor Gray
Write-Host "  documentation\LIVE-DEMO-GUIDE.md - Präsentations-Guide" -ForegroundColor Gray
Write-Host "  documentation\SECRETS.md - Webhook-Konfiguration" -ForegroundColor Gray
Write-Host ""
Write-Host "🎉 Viel Erfolg mit deiner Demo!" -ForegroundColor Green
