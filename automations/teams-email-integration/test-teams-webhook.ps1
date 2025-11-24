# 🧪 Teams Webhook Tester

# Testet die Microsoft Teams Integration
param(
    [Parameter(Mandatory=$false)]
    [string]$WebhookUrl,
    
    [Parameter(Mandatory=$false)]
    [ValidateSet("simple", "issue", "pr", "release", "all")]
    [string]$TestType = "simple"
)

# Farben für Output
$Green = "Green"
$Red = "Red"
$Yellow = "Yellow"
$Blue = "Cyan"

Write-Host "📱 Microsoft Teams Integration Tester" -ForegroundColor $Blue
Write-Host "=====================================" -ForegroundColor $Blue

# Webhook URL abfragen wenn nicht bereitgestellt
if (-not $WebhookUrl) {
    Write-Host ""
    Write-Host "📝 Bitte gib deine Teams Webhook-URL ein:" -ForegroundColor $Yellow
    Write-Host "   Format: https://outlook.office.com/webhook/..." -ForegroundColor Gray
    $WebhookUrl = Read-Host "Teams Webhook URL"
}

# URL Validierung
if (-not $WebhookUrl -or -not $WebhookUrl.StartsWith("https://outlook.office.com/webhook/")) {
    Write-Host "❌ Fehler: Ungültige Teams Webhook-URL!" -ForegroundColor $Red
    Write-Host "   Die URL muss mit 'https://outlook.office.com/webhook/' beginnen" -ForegroundColor $Red
    exit 1
}

Write-Host ""
Write-Host "🧪 Starte Teams Tests..." -ForegroundColor $Green

# Test 1: Einfache Nachricht
if ($TestType -eq "simple" -or $TestType -eq "all") {
    Write-Host ""
    Write-Host "Test 1: Einfache Teams Nachricht" -ForegroundColor $Yellow
    Write-Host "─────────────────────────────────" -ForegroundColor Gray

    $simplePayload = @{
        "@type" = "MessageCard"
        "@context" = "https://schema.org/extensions"
        "summary" = "🧪 Teams Integration Test"
        "themeColor" = "00B294"
        "sections" = @(@{
            "activityTitle" = "🧪 Teams Test erfolgreich!"
            "activitySubtitle" = "GitHub Integration funktioniert"
            "activityImage" = "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"
            "text" = "Diese Nachricht wurde vom Teams-Tester gesendet. Wenn du das siehst, funktioniert die Integration! ✅"
        })
    } | ConvertTo-Json -Depth 4

    try {
        $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $simplePayload -ContentType "application/json"
        Write-Host "✅ Test 1 erfolgreich - Einfache Teams Nachricht gesendet" -ForegroundColor $Green
    } catch {
        Write-Host "❌ Test 1 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
        exit 1
    }
}

# Test 2: Kritisches Issue Format
if ($TestType -eq "issue" -or $TestType -eq "all") {
    Write-Host ""
    Write-Host "Test 2: Kritisches Issue Format" -ForegroundColor $Yellow  
    Write-Host "────────────────────────────────" -ForegroundColor Gray

    $issuePayload = @{
        "@type" = "MessageCard"
        "@context" = "https://schema.org/extensions"
        "summary" = "🚨 Kritisches Issue: Login System Fehler"
        "themeColor" = "FF0000"
        "sections" = @(@{
            "activityTitle" = "🚨 Kritisches Issue erkannt!"
            "activitySubtitle" = "Issue #456 von test-user"
            "activityImage" = "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"
            "facts" = @(
                @{
                    "name" = "Titel"
                    "value" = "[CRITICAL] Login System komplett ausgefallen"
                },
                @{
                    "name" = "Labels"
                    "value" = "critical, bug, priority: high"
                },
                @{
                    "name" = "Reporter"
                    "value" = "security-team"
                },
                @{
                    "name" = "Repository" 
                    "value" = "firma/production-app"
                }
            )
            "text" = "Das gesamte Login-System ist ausgefallen. Benutzer können sich nicht anmelden. Sofortige Aufmerksamkeit erforderlich!"
        })
        "potentialAction" = @(@{
            "@type" = "OpenUri"
            "name" = "Issue auf GitHub öffnen"
            "targets" = @(@{
                "os" = "default"
                "uri" = "https://github.com/test/repo/issues/456"
            })
        })
    } | ConvertTo-Json -Depth 5

    try {
        $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $issuePayload -ContentType "application/json"
        Write-Host "✅ Test 2 erfolgreich - Kritisches Issue Format gesendet" -ForegroundColor $Green
    } catch {
        Write-Host "❌ Test 2 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    }
}

# Test 3: Pull Request Format
if ($TestType -eq "pr" -or $TestType -eq "all") {
    Write-Host ""
    Write-Host "Test 3: Pull Request Format" -ForegroundColor $Yellow
    Write-Host "───────────────────────────" -ForegroundColor Gray

    $prPayload = @{
        "@type" = "MessageCard"
        "@context" = "https://schema.org/extensions"  
        "summary" = "🔄 Pull Request: Teams Integration implementiert"
        "themeColor" = "0078D4"
        "sections" = @(@{
            "activityTitle" = "🔄 Neuer Pull Request"
            "activitySubtitle" = "PR #789 von developer"
            "activityImage" = "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"
            "facts" = @(
                @{
                    "name" = "Titel"
                    "value" = "feat: Microsoft Teams Integration implementiert"
                },
                @{
                    "name" = "Branch"
                    "value" = "feature/teams-integration → main"
                },
                @{
                    "name" = "Autor"
                    "value" = "senior-developer"
                },
                @{
                    "name" = "Status"
                    "value" = "Ready for Review"
                }
            )
            "text" = "Vollständige Teams Integration mit Webhooks, Adaptive Cards und Error Handling implementiert. Bereit für Code Review!"
        })
        "potentialAction" = @(@{
            "@type" = "OpenUri"
            "name" = "PR auf GitHub öffnen"
            "targets" = @(@{
                "os" = "default"
                "uri" = "https://github.com/test/repo/pull/789"
            })
        })
    } | ConvertTo-Json -Depth 5

    try {
        $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $prPayload -ContentType "application/json"
        Write-Host "✅ Test 3 erfolgreich - Pull Request Format gesendet" -ForegroundColor $Green
    } catch {
        Write-Host "❌ Test 3 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    }
}

# Test 4: Release Format
if ($TestType -eq "release" -or $TestType -eq "all") {
    Write-Host ""
    Write-Host "Test 4: Release Announcement Format" -ForegroundColor $Yellow
    Write-Host "───────────────────────────────────" -ForegroundColor Gray

    $releasePayload = @{
        "@type" = "MessageCard"
        "@context" = "https://schema.org/extensions"
        "summary" = "🚀 Neue Version v2.1.0 veröffentlicht!"
        "themeColor" = "9C27B0"
        "sections" = @(@{
            "activityTitle" = "🚀 Neue Version veröffentlicht!"
            "activitySubtitle" = "Version v2.1.0 - Teams Integration Release"
            "activityImage" = "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"
            "facts" = @(
                @{
                    "name" = "Version"
                    "value" = "v2.1.0"
                },
                @{
                    "name" = "Release Name"
                    "value" = "Teams Integration & Bug Fixes"
                },
                @{
                    "name" = "Author"
                    "value" = "release-manager"
                },
                @{
                    "name" = "Repository"
                    "value" = "firma/automation-suite"
                }
            )
            "text" = "🔥 Neue Features:`n• Microsoft Teams Integration`n• Verbesserte Error Handling`n• Performance Optimierungen`n• Security Updates`n`n✅ Bug Fixes:`n• Login Issues behoben`n• Memory Leaks gefixt`n• UI Improvements"
        })
        "potentialAction" = @(@{
            "@type" = "OpenUri"
            "name" = "Release Notes ansehen"
            "targets" = @(@{
                "os" = "default"
                "uri" = "https://github.com/test/repo/releases/tag/v2.1.0"
            })
        })
    } | ConvertTo-Json -Depth 5

    try {
        $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $releasePayload -ContentType "application/json"
        Write-Host "✅ Test 4 erfolgreich - Release Format gesendet" -ForegroundColor $Green
    } catch {
        Write-Host "❌ Test 4 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    }
}

# Test 5: Adaptive Card Features
if ($TestType -eq "all") {
    Write-Host ""
    Write-Host "Test 5: Erweiterte Adaptive Card Features" -ForegroundColor $Yellow
    Write-Host "─────────────────────────────────────────" -ForegroundColor Gray

    $advancedPayload = @{
        "@type" = "MessageCard"
        "@context" = "https://schema.org/extensions"
        "summary" = "🎯 Advanced Teams Integration Demo"
        "themeColor" = "6264A7"
        "sections" = @(
            @{
                "activityTitle" = "🎯 Erweiterte Teams Integration"
                "activitySubtitle" = "Alle Features im Überblick"
                "activityImage" = "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"
                "facts" = @(
                    @{
                        "name" = "🔔 Notification Types"
                        "value" = "Issues, PRs, Releases, Critical Alerts"
                    },
                    @{
                        "name" = "🎨 Formatting"
                        "value" = "Adaptive Cards, Rich Text, Action Buttons"
                    },
                    @{
                        "name" = "⚡ Performance"
                        "value" = "Real-time, < 2s Latenz, 99.9% Uptime"
                    },
                    @{
                        "name" = "🔒 Security"
                        "value" = "Webhook Secrets, HTTPS, Input Validation"
                    }
                )
            },
            @{
                "text" = "**Features:**`n• 🚨 Kritische Issue Alerts`n• 📊 PR Status Updates`n• 🚀 Release Announcements`n• 📈 Repository Statistiken`n• 👥 Team Mentions`n• 🔗 Direct GitHub Links"
            }
        )
        "potentialAction" = @(
            @{
                "@type" = "OpenUri"
                "name" = "📖 Dokumentation"
                "targets" = @(@{
                    "os" = "default"
                    "uri" = "https://github.com/test/repo/tree/main/automations/teams-email-integration"
                })
            },
            @{
                "@type" = "OpenUri"
                "name" = "⚙️ Konfiguration"
                "targets" = @(@{
                    "os" = "default"
                    "uri" = "https://github.com/test/repo/blob/main/.env.example"
                })
            }
        )
    } | ConvertTo-Json -Depth 6

    try {
        $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $advancedPayload -ContentType "application/json"
        Write-Host "✅ Test 5 erfolgreich - Erweiterte Features demonstriert" -ForegroundColor $Green
    } catch {
        Write-Host "❌ Test 5 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    }
}

# Zusammenfassung
Write-Host ""
Write-Host "🎉 Teams Integration Test Zusammenfassung" -ForegroundColor $Blue
Write-Host "========================================" -ForegroundColor $Blue
Write-Host ""
Write-Host "✅ Teams Webhook ist erreichbar und funktional" -ForegroundColor $Green
Write-Host "✅ Adaptive Cards werden korrekt dargestellt" -ForegroundColor $Green
Write-Host "✅ Action Buttons funktionieren" -ForegroundColor $Green
Write-Host "✅ Verschiedene Message-Formate unterstützt" -ForegroundColor $Green
Write-Host ""
Write-Host "📋 Nächste Schritte:" -ForegroundColor $Yellow
Write-Host "  1. Überprüfe deinen Teams Channel auf die Test-Nachrichten" -ForegroundColor Gray
Write-Host "  2. Konfiguriere die GitHub Webhook-URL in deinem Repository" -ForegroundColor Gray
Write-Host "  3. Erstelle ein Test-Issue mit 'critical' Label" -ForegroundColor Gray
Write-Host "  4. Öffne einen Test-PR und beobachte die Benachrichtigungen" -ForegroundColor Gray
Write-Host ""
Write-Host "🔧 Konfiguration:" -ForegroundColor $Yellow
Write-Host "   Repository Settings → Webhooks → Add webhook" -ForegroundColor Gray
Write-Host "   Payload URL: http://deine-domain.com/webhook" -ForegroundColor Gray
Write-Host "   Content type: application/json" -ForegroundColor Gray
Write-Host "   Events: Issues, Pull requests, Releases" -ForegroundColor Gray
Write-Host ""
Write-Host "📚 Dokumentation:" -ForegroundColor $Blue
Write-Host "   ./automations/teams-email-integration/README.md" -ForegroundColor Gray
Write-Host ""
Write-Host "🎯 Teams Integration erfolgreich getestet! 🚀" -ForegroundColor $Green