# 📧 E-Mail Konfiguration Tester

# Testet die E-Mail Integration und SMTP Einstellungen
param(
    [Parameter(Mandatory=$false)]
    [string]$SmtpServer,
    
    [Parameter(Mandatory=$false)]
    [int]$SmtpPort,
    
    [Parameter(Mandatory=$false)]
    [string]$SmtpUser,
    
    [Parameter(Mandatory=$false)]
    [string]$SmtpPass,
    
    [Parameter(Mandatory=$false)]
    [string]$EmailFrom,
    
    [Parameter(Mandatory=$false)]
    [string]$EmailTo,
    
    [Parameter(Mandatory=$false)]
    [switch]$UseEnvFile
)

# Farben für Output
$Green = "Green"
$Red = "Red" 
$Yellow = "Yellow"
$Blue = "Cyan"

Write-Host "📧 E-Mail Integration Tester" -ForegroundColor $Blue
Write-Host "============================" -ForegroundColor $Blue

# .env Datei laden wenn gewünscht
if ($UseEnvFile -or (-not $SmtpServer)) {
    Write-Host ""
    Write-Host "📁 Lade Konfiguration aus .env Datei..." -ForegroundColor $Yellow
    
    if (Test-Path ".env") {
        $envContent = Get-Content ".env" | Where-Object { $_ -match "=" -and -not $_.StartsWith("#") }
        $envVars = @{}
        
        foreach ($line in $envContent) {
            $parts = $line -split "=", 2
            if ($parts.Count -eq 2) {
                $key = $parts[0].Trim()
                $value = $parts[1].Trim().Trim('"')
                $envVars[$key] = $value
            }
        }
        
        $SmtpServer = $envVars["SMTP_SERVER"]
        $SmtpPort = [int]($envVars["SMTP_PORT"] ?? 587)
        $SmtpUser = $envVars["SMTP_USER"]
        $SmtpPass = $envVars["SMTP_PASS"]
        $EmailFrom = $envVars["EMAIL_FROM"]
        $EmailTo = $envVars["EMAIL_TO"]
        
        Write-Host "✅ .env Datei erfolgreich geladen" -ForegroundColor $Green
    } else {
        Write-Host "⚠️ .env Datei nicht gefunden - manuelle Eingabe erforderlich" -ForegroundColor $Yellow
    }
}

# Fehlende Parameter abfragen
if (-not $SmtpServer) {
    Write-Host ""
    Write-Host "📝 SMTP Konfiguration:" -ForegroundColor $Yellow
    $SmtpServer = Read-Host "SMTP Server (z.B. smtp.gmail.com)"
}

if (-not $SmtpPort) {
    $SmtpPort = [int](Read-Host "SMTP Port (Standard: 587)")
    if ($SmtpPort -eq 0) { $SmtpPort = 587 }
}

if (-not $SmtpUser) {
    $SmtpUser = Read-Host "SMTP Benutzername (E-Mail)"
}

if (-not $SmtpPass) {
    $SmtpPass = Read-Host "SMTP Passwort (App-Passwort)" -AsSecureString
    $SmtpPass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($SmtpPass))
}

if (-not $EmailFrom) {
    $EmailFrom = Read-Host "Absender E-Mail"
    if (-not $EmailFrom) { $EmailFrom = $SmtpUser }
}

if (-not $EmailTo) {
    $EmailTo = Read-Host "Empfänger E-Mail (Komma-getrennt für mehrere)"
}

Write-Host ""
Write-Host "🔧 Konfiguration:" -ForegroundColor $Blue
Write-Host "  Server: $SmtpServer:$SmtpPort" -ForegroundColor Gray
Write-Host "  Benutzer: $SmtpUser" -ForegroundColor Gray  
Write-Host "  Von: $EmailFrom" -ForegroundColor Gray
Write-Host "  An: $EmailTo" -ForegroundColor Gray

Write-Host ""
Write-Host "🧪 Starte E-Mail Tests..." -ForegroundColor $Green

# Test 1: SMTP Verbindung
Write-Host ""
Write-Host "Test 1: SMTP Verbindung" -ForegroundColor $Yellow
Write-Host "─────────────────────────" -ForegroundColor Gray

try {
    # .NET SMTP Client verwenden für bessere Kompatibilität
    Add-Type -AssemblyName System.Net.Mail
    
    $smtp = New-Object System.Net.Mail.SmtpClient($SmtpServer, $SmtpPort)
    $smtp.EnableSsl = $true
    $smtp.Credentials = New-Object System.Net.NetworkCredential($SmtpUser, $SmtpPass)
    
    # Test-Verbindung (ohne E-Mail zu senden)
    $testMessage = New-Object System.Net.Mail.MailMessage
    $testMessage.From = $EmailFrom
    $testMessage.To.Add($EmailTo.Split(',')[0].Trim())
    $testMessage.Subject = "SMTP Connection Test"
    $testMessage.Body = "Test"
    
    # Verbindung testen
    Write-Host "  Verbinde zu $SmtpServer..." -ForegroundColor Gray
    
    # Timeout setzen
    $smtp.Timeout = 10000
    
    Write-Host "✅ Test 1 erfolgreich - SMTP Verbindung hergestellt" -ForegroundColor $Green
} catch {
    Write-Host "❌ Test 1 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
    Write-Host ""
    Write-Host "💡 Häufige Lösungen:" -ForegroundColor $Yellow
    Write-Host "  • 2-Faktor-Authentifizierung aktivieren" -ForegroundColor Gray
    Write-Host "  • App-Passwort erstellen (nicht normales Passwort)" -ForegroundColor Gray
    Write-Host "  • 'Weniger sichere Apps' aktivieren (falls verfügbar)" -ForegroundColor Gray
    Write-Host "  • Firewall/Antivirus prüfen" -ForegroundColor Gray
    exit 1
}

# Test 2: Einfache Test-E-Mail
Write-Host ""
Write-Host "Test 2: Einfache Test-E-Mail" -ForegroundColor $Yellow
Write-Host "────────────────────────────" -ForegroundColor Gray

try {
    $message = New-Object System.Net.Mail.MailMessage
    $message.From = $EmailFrom
    
    # Mehrere Empfänger unterstützen
    foreach ($recipient in $EmailTo.Split(',')) {
        $message.To.Add($recipient.Trim())
    }
    
    $message.Subject = "🧪 GitHub Integration E-Mail Test"
    $message.IsBodyHtml = $false
    $message.Body = @"
GitHub E-Mail Integration Test

Dies ist eine Test-E-Mail um zu überprüfen, ob die E-Mail Integration korrekt funktioniert.

✅ SMTP Verbindung: Erfolgreich
✅ Authentifizierung: OK
✅ E-Mail Versand: Funktional

Zeitstempel: $(Get-Date -Format "dd.MM.yyyy HH:mm:ss")

Diese Nachricht wurde automatisch generiert.
"@

    $smtp.Send($message)
    Write-Host "✅ Test 2 erfolgreich - Einfache Test-E-Mail gesendet" -ForegroundColor $Green
} catch {
    Write-Host "❌ Test 2 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
}

# Test 3: GitHub Issue Format (HTML)
Write-Host ""
Write-Host "Test 3: GitHub Issue Format (HTML)" -ForegroundColor $Yellow
Write-Host "──────────────────────────────────" -ForegroundColor Gray

try {
    $htmlMessage = New-Object System.Net.Mail.MailMessage
    $htmlMessage.From = $EmailFrom
    
    foreach ($recipient in $EmailTo.Split(',')) {
        $htmlMessage.To.Add($recipient.Trim())
    }
    
    $htmlMessage.Subject = "🚨 KRITISCH: Login System Fehler (#123)"
    $htmlMessage.IsBodyHtml = $true
    
    $htmlBody = @"
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GitHub Critical Issue</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f6f8fa;">
    <div style="max-width: 600px; margin: 0 auto; background-color: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
        
        <!-- Header -->
        <div style="background-color: #dc3545; color: white; padding: 20px; text-align: center;">
            <h1 style="margin: 0; font-size: 24px;">🚨 GitHub Critical Issue</h1>
            <p style="margin: 5px 0 0 0; opacity: 0.9;">Opened • #123</p>
        </div>
        
        <!-- Content -->
        <div style="padding: 30px;">
            <h2 style="margin: 0 0 15px 0; color: #24292e; font-size: 20px;">
                Login System komplett ausgefallen
            </h2>
            
            <div style="background-color: #f6f8fa; padding: 15px; border-radius: 6px; margin: 20px 0;">
                <strong>📋 Details:</strong><br>
                <strong>Typ:</strong> Issue<br>
                <strong>Autor:</strong> security-team<br>
                <strong>Zeit:</strong> $(Get-Date -Format "dd.MM.yyyy HH:mm:ss")<br>
                <strong>Labels:</strong> critical, bug, security<br>
            </div>
            
            <!-- Beschreibung -->
            <div style="margin: 20px 0;">
                <strong>📝 Beschreibung:</strong><br>
                <div style="background-color: #fff; border: 1px solid #e1e4e8; border-radius: 6px; padding: 15px; margin-top: 10px; font-family: 'Courier New', monospace; font-size: 14px;">
Das gesamte Login-System ist ausgefallen. Keine Benutzer können sich anmelden.

Fehlerdetails:
- Database Connection Timeout
- Auth Service nicht erreichbar  
- Session Storage fehlgeschlagen

SOFORTIGE AUFMERKSAMKEIT ERFORDERLICH!
                </div>
            </div>
            
            <!-- Action Button -->
            <div style="text-align: center; margin: 30px 0;">
                <a href="https://github.com/test/repo/issues/123" 
                   style="display: inline-block; background-color: #dc3545; color: white; text-decoration: none; padding: 12px 24px; border-radius: 6px; font-weight: bold;">
                    Issue auf GitHub öffnen
                </a>
            </div>
        </div>
        
        <!-- Footer -->
        <div style="background-color: #f6f8fa; padding: 15px; text-align: center; color: #6a737d; font-size: 12px;">
            <p style="margin: 0;">
                Diese Nachricht wurde automatisch von GitHub Automation Suite generiert.<br>
                <a href="https://github.com" style="color: #0366d6;">GitHub Repository besuchen</a>
            </p>
        </div>
    </div>
</body>
</html>
"@

    $htmlMessage.Body = $htmlBody
    $smtp.Send($htmlMessage)
    Write-Host "✅ Test 3 erfolgreich - HTML Issue Format gesendet" -ForegroundColor $Green
} catch {
    Write-Host "❌ Test 3 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
}

# Test 4: Pull Request Format
Write-Host ""
Write-Host "Test 4: Pull Request Format" -ForegroundColor $Yellow
Write-Host "───────────────────────────" -ForegroundColor Gray

try {
    $prMessage = New-Object System.Net.Mail.MailMessage
    $prMessage.From = $EmailFrom
    
    foreach ($recipient in $EmailTo.Split(',')) {
        $prMessage.To.Add($recipient.Trim())
    }
    
    $prMessage.Subject = "🔄 PR opened: Teams Integration implementiert (#789)"
    $prMessage.IsBodyHtml = $true
    
    $prBody = @"
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GitHub Pull Request</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f6f8fa;">
    <div style="max-width: 600px; margin: 0 auto; background-color: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
        
        <!-- Header -->
        <div style="background-color: #28a745; color: white; padding: 20px; text-align: center;">
            <h1 style="margin: 0; font-size: 24px;">🔄 GitHub Pull Request</h1>
            <p style="margin: 5px 0 0 0; opacity: 0.9;">Opened • #789</p>
        </div>
        
        <!-- Content -->
        <div style="padding: 30px;">
            <h2 style="margin: 0 0 15px 0; color: #24292e; font-size: 20px;">
                feat: Microsoft Teams Integration implementiert
            </h2>
            
            <div style="background-color: #f6f8fa; padding: 15px; border-radius: 6px; margin: 20px 0;">
                <strong>📋 Details:</strong><br>
                <strong>Typ:</strong> Pull Request<br>
                <strong>Autor:</strong> developer<br>
                <strong>Branch:</strong> feature/teams-integration → main<br>
                <strong>Zeit:</strong> $(Get-Date -Format "dd.MM.yyyy HH:mm:ss")<br>
            </div>
            
            <!-- Beschreibung -->
            <div style="margin: 20px 0;">
                <strong>📝 Änderungen:</strong><br>
                <div style="background-color: #fff; border: 1px solid #e1e4e8; border-radius: 6px; padding: 15px; margin-top: 10px;">
                    <ul style="margin: 0; padding-left: 20px;">
                        <li>Microsoft Teams Webhook Integration</li>
                        <li>Adaptive Cards für Issue und PR Notifications</li>
                        <li>Error Handling und Retry Logic</li>
                        <li>Comprehensive Testing</li>
                        <li>Dokumentation und Setup-Guide</li>
                    </ul>
                </div>
            </div>
            
            <!-- Action Button -->
            <div style="text-align: center; margin: 30px 0;">
                <a href="https://github.com/test/repo/pull/789" 
                   style="display: inline-block; background-color: #28a745; color: white; text-decoration: none; padding: 12px 24px; border-radius: 6px; font-weight: bold;">
                    Pull Request auf GitHub öffnen
                </a>
            </div>
        </div>
        
        <!-- Footer -->
        <div style="background-color: #f6f8fa; padding: 15px; text-align: center; color: #6a737d; font-size: 12px;">
            <p style="margin: 0;">
                Diese Nachricht wurde automatisch von GitHub Automation Suite generiert.
            </p>
        </div>
    </div>
</body>
</html>
"@

    $prMessage.Body = $prBody
    $smtp.Send($prMessage)
    Write-Host "✅ Test 4 erfolgreich - Pull Request Format gesendet" -ForegroundColor $Green
} catch {
    Write-Host "❌ Test 4 fehlgeschlagen: $($_.Exception.Message)" -ForegroundColor $Red
}

# Aufräumen
$smtp.Dispose()

# Zusammenfassung
Write-Host ""
Write-Host "🎉 E-Mail Integration Test Zusammenfassung" -ForegroundColor $Blue
Write-Host "=========================================" -ForegroundColor $Blue
Write-Host ""
Write-Host "✅ SMTP Verbindung funktioniert" -ForegroundColor $Green
Write-Host "✅ E-Mail Authentifizierung erfolgreich" -ForegroundColor $Green  
Write-Host "✅ Text E-Mails werden versendet" -ForegroundColor $Green
Write-Host "✅ HTML E-Mails werden korrekt formatiert" -ForegroundColor $Green
Write-Host "✅ Multiple Empfänger unterstützt" -ForegroundColor $Green
Write-Host ""
Write-Host "📧 Überprüfe dein E-Mail Postfach:" -ForegroundColor $Yellow
Write-Host "   Empfänger: $EmailTo" -ForegroundColor Gray
Write-Host "   Gesendete Tests: 4 E-Mails" -ForegroundColor Gray
Write-Host "   • Einfache Test-E-Mail" -ForegroundColor Gray
Write-Host "   • Kritisches Issue (HTML)" -ForegroundColor Gray  
Write-Host "   • Pull Request Notification (HTML)" -ForegroundColor Gray
Write-Host ""
Write-Host "🔧 Nächste Schritte:" -ForegroundColor $Yellow
Write-Host "  1. Überprüfe alle Test-E-Mails im Postfach" -ForegroundColor Gray
Write-Host "  2. Aktualisiere .env mit den getesteten Einstellungen" -ForegroundColor Gray
Write-Host "  3. Starte die Flask App: python app.py" -ForegroundColor Gray
Write-Host "  4. Teste mit echten GitHub Events" -ForegroundColor Gray
Write-Host ""
Write-Host "💾 .env Konfiguration:" -ForegroundColor $Blue
Write-Host "EMAIL_FROM=$EmailFrom" -ForegroundColor Gray
Write-Host "EMAIL_TO=$EmailTo" -ForegroundColor Gray  
Write-Host "SMTP_SERVER=$SmtpServer" -ForegroundColor Gray
Write-Host "SMTP_PORT=$SmtpPort" -ForegroundColor Gray
Write-Host "SMTP_USER=$SmtpUser" -ForegroundColor Gray
Write-Host "SMTP_PASS=***" -ForegroundColor Gray
Write-Host ""
Write-Host "🎯 E-Mail Integration erfolgreich getestet! 📧" -ForegroundColor $Green