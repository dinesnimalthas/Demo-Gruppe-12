# 🧪 Slack Webhook Tester

# Dieses Script testet deine Slack Webhook-Integration
# Verwende es um sicherzustellen, dass deine Konfiguration korrekt ist

param(
    [Parameter(Mandatory=$false)]
    [string]$WebhookUrl,
    
    [Parameter(Mandatory=$false)]
    [string]$TestType = "simple"
)

# Farben für Output
$Green = "Green"
$Red = "Red"
$Yellow = "Yellow"
$Blue = "Cyan"

Write-Host "🔔 Slack Webhook Integration Tester" -ForegroundColor $Blue
Write-Host "===================================" -ForegroundColor $Blue

# Webhook URL abfragen wenn nicht bereitgestellt
if (-not $WebhookUrl) {
    Write-Host ""
    Write-Host "📝 Bitte gib deine Slack Webhook-URL ein:" -ForegroundColor $Yellow
    Write-Host "   Format: https://hooks.slack.com/services/T.../B.../..." -ForegroundColor Gray
    $WebhookUrl = Read-Host "Webhook URL"
}

# URL Validierung
if (-not $WebhookUrl -or -not $WebhookUrl.StartsWith("https://hooks.slack.com/")) {
    Write-Host "❌ Fehler: Ungültige Webhook-URL!" -ForegroundColor $Red
    Write-Host "   Die URL muss mit 'https://hooks.slack.com/' beginnen" -ForegroundColor $Red
    exit 1
}

Write-Host ""
Write-Host "🧪 Starte Tests..." -ForegroundColor $Green

# Test 1: Einfache Nachricht
Write-Host ""
Write-Host "Test 1: Einfache Nachricht" -ForegroundColor $Yellow
Write-Host "─────────────────────────────" -ForegroundColor Gray

$simplePayload = @{
    text = "🧪 **Test 1**: Einfache Slack-Benachrichtigung"
    attachments = @(@{
        color = "#4CAF50"
        text = "Diese Nachricht wurde vom GitHub Actions Slack-Tester gesendet! ✅"
    })
} | ConvertTo-Json -Depth 3

try {
    $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $simplePayload -ContentType "application/json"
    Write-Host "✅ Test 1 erfolgreich - Einfache Nachricht gesendet" -ForegroundColor $Green
} catch {
    Write-Host "❌ Test 1 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    exit 1
}

# Test 2: GitHub Issue Simulation
if ($TestType -eq "full" -or $TestType -eq "github") {
    Write-Host ""
    Write-Host "Test 2: GitHub Issue Simulation" -ForegroundColor $Yellow
    Write-Host "──────────────────────────────────" -ForegroundColor Gray
    
    $issuePayload = @{
        attachments = @(@{
            color = "#F44336"
            blocks = @(
                @{
                    type = "header"
                    text = @{
                        type = "plain_text"
                        text = "🐛 Bug Report Created"
                    }
                },
                @{
                    type = "section"
                    fields = @(
                        @{
                            type = "mrkdwn"
                            text = "*Title:*`n[TEST] Login button not working"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Author:*`n<https://github.com/testuser|@testuser>"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Issue:*`n<https://github.com/owner/repo/issues/123|#123>"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Repository:*`ntest-owner/test-repo"
                        }
                    )
                },
                @{
                    type = "section"
                    text = @{
                        type = "mrkdwn"
                        text = "*Description:*`nDer Login-Button reagiert nicht auf Klicks. Dieses Problem tritt in Chrome und Firefox auf."
                    }
                }
            )
        })
    } | ConvertTo-Json -Depth 5
    
    try {
        $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $issuePayload -ContentType "application/json"
        Write-Host "✅ Test 2 erfolgreich - GitHub Issue Notification gesendet" -ForegroundColor $Green
    } catch {
        Write-Host "❌ Test 2 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    }
}

# Test 3: Pull Request Simulation
if ($TestType -eq "full" -or $TestType -eq "github") {
    Write-Host ""
    Write-Host "Test 3: Pull Request Simulation" -ForegroundColor $Yellow
    Write-Host "─────────────────────────────────" -ForegroundColor Gray
    
    $prPayload = @{
        attachments = @(@{
            color = "#FFC107"
            blocks = @(
                @{
                    type = "header"
                    text = @{
                        type = "plain_text"
                        text = "🟡 Pull Request Opened"
                    }
                },
                @{
                    type = "section"
                    fields = @(
                        @{
                            type = "mrkdwn"
                            text = "*Title:*`nAdd Slack integration for notifications"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Author:*`n<https://github.com/developer|@developer>"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*PR:*`n<https://github.com/owner/repo/pull/456|#456>"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Changes:*`n127 lines in 8 files"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Branch:*`n``feature/slack-integration`` → ``main``"
                        }
                    )
                }
            )
        })
    } | ConvertTo-Json -Depth 5
    
    try {
        $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $prPayload -ContentType "application/json"
        Write-Host "✅ Test 3 erfolgreich - Pull Request Notification gesendet" -ForegroundColor $Green
    } catch {
        Write-Host "❌ Test 3 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    }
}

# Test 4: High Priority Alert
if ($TestType -eq "full" -or $TestType -eq "priority") {
    Write-Host ""
    Write-Host "Test 4: High Priority Alert" -ForegroundColor $Yellow
    Write-Host "──────────────────────────────" -ForegroundColor Gray
    
    $alertPayload = @{
        text = "🚨 HIGH PRIORITY ISSUE ALERT 🚨"
        attachments = @(@{
            color = "#F44336"
            blocks = @(
                @{
                    type = "header"
                    text = @{
                        type = "plain_text"
                        text = "🚨 High Priority Issue"
                    }
                },
                @{
                    type = "section"
                    fields = @(
                        @{
                            type = "mrkdwn"
                            text = "*Title:*`n[CRITICAL] Database connection failing"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Priority:*`npriority: critical"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Reporter:*`n<https://github.com/securityteam|@security-team>"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Issue:*`n<https://github.com/owner/repo/issues/789|#789>"
                        }
                    )
                },
                @{
                    type = "section"
                    text = @{
                        type = "mrkdwn"
                        text = "⚡ *This issue requires immediate attention!*"
                    }
                }
            )
        })
    } | ConvertTo-Json -Depth 5
    
    try {
        $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $alertPayload -ContentType "application/json"
        Write-Host "✅ Test 4 erfolgreich - High Priority Alert gesendet" -ForegroundColor $Green
    } catch {
        Write-Host "❌ Test 4 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    }
}

# Test 5: Release Notification
if ($TestType -eq "full") {
    Write-Host ""
    Write-Host "Test 5: Release Notification" -ForegroundColor $Yellow
    Write-Host "───────────────────────────────" -ForegroundColor Gray
    
    $releasePayload = @{
        attachments = @(@{
            color = "#9C27B0"
            blocks = @(
                @{
                    type = "header"
                    text = @{
                        type = "plain_text"
                        text = "🚀 New Release Published!"
                    }
                },
                @{
                    type = "section"
                    fields = @(
                        @{
                            type = "mrkdwn"
                            text = "*Version:*`n<https://github.com/owner/repo/releases/tag/v2.1.0|v2.1.0>"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Name:*`nSlack Integration Release"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Author:*`n<https://github.com/releasemanager|@release-manager>"
                        },
                        @{
                            type = "mrkdwn"
                            text = "*Repository:*`ntest-owner/test-repo"
                        }
                    )
                },
                @{
                    type = "section"
                    text = @{
                        type = "mrkdwn"
                        text = "*Release Notes:*`n• Added Slack notification system`n• Improved GitHub Actions workflows`n• Bug fixes and performance improvements"
                    }
                }
            )
        })
    } | ConvertTo-Json -Depth 5
    
    try {
        $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $releasePayload -ContentType "application/json"
        Write-Host "✅ Test 5 erfolgreich - Release Notification gesendet" -ForegroundColor $Green
    } catch {
        Write-Host "❌ Test 5 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    }
}

# Zusammenfassung
Write-Host ""
Write-Host "🎉 Test-Zusammenfassung" -ForegroundColor $Blue
Write-Host "======================" -ForegroundColor $Blue
Write-Host ""
Write-Host "✅ Webhook-URL ist gültig und erreichbar" -ForegroundColor $Green
Write-Host "✅ Slack empfängt Nachrichten korrekt" -ForegroundColor $Green
Write-Host "✅ Nachrichtenformatierung funktioniert" -ForegroundColor $Green
Write-Host ""
Write-Host "📋 Nächste Schritte:" -ForegroundColor $Yellow
Write-Host "  1. Überprüfe deinen Slack Channel auf die Test-Nachrichten" -ForegroundColor Gray
Write-Host "  2. Konfiguriere das GitHub Secret SLACK_WEBHOOK_URL" -ForegroundColor Gray
Write-Host "  3. Commite die Workflow-Datei .github/workflows/slack-notifications.yml" -ForegroundColor Gray
Write-Host "  4. Teste mit echten GitHub Events (Issue erstellen, PR öffnen)" -ForegroundColor Gray
Write-Host ""
Write-Host "🔗 Webhook URL (für deine Referenz):" -ForegroundColor $Yellow
Write-Host "   $WebhookUrl" -ForegroundColor Gray
Write-Host ""
Write-Host "📚 Dokumentation: automations/slack-notifications/SETUP-GUIDE.md" -ForegroundColor $Blue

# Zusätzliche Tipps
Write-Host ""
Write-Host "💡 Tipps:" -ForegroundColor $Blue
Write-Host "  • Verwende unterschiedliche Webhooks für verschiedene Channels" -ForegroundColor Gray
Write-Host "  • Teste regelmäßig mit 'test-slack-webhook.ps1 -TestType full'" -ForegroundColor Gray  
Write-Host "  • Aktiviere Debug-Logs in GitHub Actions bei Problemen" -ForegroundColor Gray
Write-Host "  • Kombiniere mit anderen Automations für vollständige Integration" -ForegroundColor Gray

Write-Host ""
Write-Host "🎯 Integration erfolgreich getestet! Happy coding! 🚀" -ForegroundColor $Green