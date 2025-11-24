# Discord Webhook Tester
# Testet ob deine Discord Webhook funktioniert

Write-Host "🎮 Discord Webhook Tester`n" -ForegroundColor Cyan

# Webhook URL eingeben
$webhookUrl = Read-Host "Gib deine Discord Webhook URL ein"

if ([string]::IsNullOrWhiteSpace($webhookUrl)) {
    Write-Host "❌ Keine URL eingegeben!" -ForegroundColor Red
    exit 1
}

Write-Host "`n📤 Sende Test-Nachricht...`n" -ForegroundColor Yellow

# Test Message 1: Simple Text
$payload1 = @{
    content = "✅ Test erfolgreich! Der Webhook funktioniert!"
} | ConvertTo-Json

try {
    Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $payload1 -ContentType "application/json"
    Write-Host "✅ Simple Message gesendet!" -ForegroundColor Green
    Start-Sleep -Seconds 2
}
catch {
    Write-Host "❌ Fehler: $_" -ForegroundColor Red
    exit 1
}

# Test Message 2: Rich Embed
$payload2 = @{
    embeds = @(
        @{
            title = "🎉 Discord Integration Test"
            description = "Wenn du diese Message siehst, funktioniert alles perfekt!"
            color = 3066993  # Grün
            fields = @(
                @{
                    name = "Status"
                    value = "✅ Erfolgreich"
                    inline = $true
                },
                @{
                    name = "Test-Type"
                    value = "Rich Embed"
                    inline = $true
                },
                @{
                    name = "Zeitstempel"
                    value = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
                    inline = $false
                }
            )
            footer = @{
                text = "GitHub Automation Test"
                icon_url = "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"
            }
            timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
        }
    )
} | ConvertTo-Json -Depth 10

try {
    Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $payload2 -ContentType "application/json"
    Write-Host "✅ Rich Embed gesendet!" -ForegroundColor Green
    Start-Sleep -Seconds 2
}
catch {
    Write-Host "❌ Fehler beim Rich Embed: $_" -ForegroundColor Red
    exit 1
}

# Test Message 3: Alert Style (wie bei Large PR)
$payload3 = @{
    embeds = @(
        @{
            title = "🚨 Alert Test"
            description = "Dies ist ein Test-Alert im Style der Large PR Warnings"
            color = 15158332  # Rot
            fields = @(
                @{
                    name = "⚠️ Warning Type"
                    value = "Large PR Detection"
                    inline = $true
                },
                @{
                    name = "📊 Simulated Size"
                    value = "500+ lines"
                    inline = $true
                },
                @{
                    name = "💡 Recommendation"
                    value = "Split into smaller PRs for better reviews"
                    inline = $false
                }
            )
            footer = @{
                text = "PR Size Labeler - Test Mode"
            }
            timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
        }
    )
} | ConvertTo-Json -Depth 10

try {
    Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $payload3 -ContentType "application/json"
    Write-Host "✅ Alert Test gesendet!" -ForegroundColor Green
}
catch {
    Write-Host "❌ Fehler beim Alert: $_" -ForegroundColor Red
    exit 1
}

Write-Host "`n" -NoNewline
Write-Host "🎉 Alle Tests erfolgreich!" -ForegroundColor Green
Write-Host "`n📱 Checke deinen Discord Channel!" -ForegroundColor Cyan
Write-Host "   Du solltest 3 Messages sehen:`n" -ForegroundColor Cyan
Write-Host "   1. ✅ Simple Text Message" -ForegroundColor White
Write-Host "   2. 🎉 Rich Embed mit Details" -ForegroundColor White
Write-Host "   3. 🚨 Red Alert Style Message" -ForegroundColor White
Write-Host "`n✅ Webhook ist ready für GitHub Actions!`n" -ForegroundColor Green
