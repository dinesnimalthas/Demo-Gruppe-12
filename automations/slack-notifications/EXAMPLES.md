# 📋 Slack Notifications Examples

Sammlung von Beispiel-Konfigurationen und erweiterten Use Cases für die Slack-Integration.

## 🎯 Beispiel 1: Multi-Channel Setup

Verschiedene Notifications an verschiedene Channels senden:

```yaml
name: Multi-Channel Slack Notifications

on:
  issues:
    types: [opened, closed, labeled]
  pull_request:
    types: [opened, closed, merged]
  release:
    types: [published]

jobs:
  slack-general:
    runs-on: ubuntu-latest
    if: |
      !contains(github.event.issue.labels.*.name, 'priority: critical') &&
      !contains(github.event.pull_request.labels.*.name, 'priority: critical')
    
    steps:
      - uses: actions/github-script@v7
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_GENERAL }}
        with:
          script: |
            // Standard notifications für #general

  slack-critical:
    runs-on: ubuntu-latest
    if: |
      contains(github.event.issue.labels.*.name, 'priority: critical') ||
      contains(github.event.pull_request.labels.*.name, 'priority: critical')
    
    steps:
      - uses: actions/github-script@v7
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_CRITICAL }}
        with:
          script: |
            // Kritische Alerts für #alerts

  slack-releases:
    runs-on: ubuntu-latest
    if: github.event_name == 'release'
    
    steps:
      - uses: actions/github-script@v7
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_RELEASES }}
        with:
          script: |
            // Release notifications für #releases
```

## 🕐 Beispiel 2: Zeitbasierte Notifications

Nur während Geschäftszeiten benachrichtigen:

```yaml
- name: Check business hours
  id: business_hours
  run: |
    # UTC Zeit abrufen
    current_hour=$(date -u +%H)
    current_day=$(date -u +%u)  # 1-7, Mo-So
    
    # Geschäftszeiten: Mo-Fr, 8-18 Uhr (UTC+1 = 7-17 UTC)
    if [ $current_day -ge 1 ] && [ $current_day -le 5 ] && 
       [ $current_hour -ge 7 ] && [ $current_hour -lt 17 ]; then
      echo "send_notification=true" >> $GITHUB_OUTPUT
    else
      echo "send_notification=false" >> $GITHUB_OUTPUT
    fi

- name: Send Slack notification
  if: steps.business_hours.outputs.send_notification == 'true'
  # ... Slack notification steps
```

## 🎨 Beispiel 3: Custom Message Templates

Erweiterte Nachrichtenformate:

```javascript
// GitHub Issue mit erweiterten Informationen
const issuePayload = {
  attachments: [{
    color: getIssueColor(issue),
    blocks: [
      {
        type: "header",
        text: {
          type: "plain_text",
          text: `${getIssueEmoji(issue)} ${getIssueType(issue)}`
        }
      },
      {
        type: "section",
        text: {
          type: "mrkdwn",
          text: `*<${issue.html_url}|${issue.title}>*\nReported by <${issue.user.html_url}|@${issue.user.login}>`
        },
        accessory: {
          type: "button",
          text: {
            type: "plain_text",
            text: "View Issue"
          },
          url: issue.html_url,
          style: "primary"
        }
      },
      {
        type: "context",
        elements: [
          {
            type: "mrkdwn",
            text: `📍 ${context.repo.owner}/${context.repo.repo} • Issue #${issue.number}`
          }
        ]
      }
    ]
  }]
};

// Helper Functions
function getIssueColor(issue) {
  if (issue.labels.some(label => label.name.includes('bug'))) return '#F44336';
  if (issue.labels.some(label => label.name.includes('feature'))) return '#4CAF50';
  if (issue.labels.some(label => label.name.includes('documentation'))) return '#2196F3';
  return '#757575';
}

function getIssueEmoji(issue) {
  if (issue.labels.some(label => label.name.includes('bug'))) return '🐛';
  if (issue.labels.some(label => label.name.includes('feature'))) return '✨';
  if (issue.labels.some(label => label.name.includes('question'))) return '❓';
  return '📋';
}

function getIssueType(issue) {
  if (issue.labels.some(label => label.name.includes('bug'))) return 'Bug Report';
  if (issue.labels.some(label => label.name.includes('feature'))) return 'Feature Request';
  if (issue.labels.some(label => label.name.includes('documentation'))) return 'Documentation';
  return 'New Issue';
}
```

## 📊 Beispiel 4: PR mit Code Review Status

Pull Requests mit Review-Informationen:

```javascript
- name: Enhanced PR Notification
  uses: actions/github-script@v7
  with:
    script: |
      const pr = context.payload.pull_request;
      
      // Review Status abrufen
      const { data: reviews } = await github.rest.pulls.listReviews({
        owner: context.repo.owner,
        repo: context.repo.repo,
        pull_number: pr.number,
      });
      
      // Requested Reviewers abrufen
      const { data: reviewRequests } = await github.rest.pulls.listRequestedReviewers({
        owner: context.repo.owner,
        repo: context.repo.repo,
        pull_number: pr.number,
      });
      
      const approvals = reviews.filter(r => r.state === 'APPROVED').length;
      const rejections = reviews.filter(r => r.state === 'CHANGES_REQUESTED').length;
      const pendingReviews = reviewRequests.users.length;
      
      const reviewStatus = getReviewStatus(approvals, rejections, pendingReviews);
      
      const payload = {
        attachments: [{
          color: reviewStatus.color,
          blocks: [
            {
              type: "header", 
              text: {
                type: "plain_text",
                text: `${reviewStatus.emoji} Pull Request: ${pr.title}`
              }
            },
            {
              type: "section",
              fields: [
                {
                  type: "mrkdwn",
                  text: `*Author:* <${pr.user.html_url}|@${pr.user.login}>`
                },
                {
                  type: "mrkdwn",
                  text: `*Status:* ${reviewStatus.text}`
                },
                {
                  type: "mrkdwn",
                  text: `*Reviews:* ✅ ${approvals} • ❌ ${rejections} • ⏳ ${pendingReviews}`
                },
                {
                  type: "mrkdwn",
                  text: `*Branch:* \`${pr.head.ref}\` → \`${pr.base.ref}\``
                }
              ]
            },
            {
              type: "actions",
              elements: [
                {
                  type: "button",
                  text: { type: "plain_text", text: "View PR" },
                  url: pr.html_url,
                  style: "primary"
                },
                {
                  type: "button", 
                  text: { type: "plain_text", text: "Review Changes" },
                  url: `${pr.html_url}/files`
                }
              ]
            }
          ]
        }]
      };
      
      function getReviewStatus(approvals, rejections, pending) {
        if (rejections > 0) {
          return { 
            emoji: '🔴', 
            color: '#F44336', 
            text: 'Changes Requested' 
          };
        } else if (approvals >= 2) {
          return { 
            emoji: '🟢', 
            color: '#4CAF50', 
            text: 'Ready to Merge' 
          };
        } else if (pending > 0) {
          return { 
            emoji: '🟡', 
            color: '#FFC107', 
            text: 'Awaiting Reviews' 
          };
        } else {
          return { 
            emoji: '🔵', 
            color: '#2196F3', 
            text: 'Open for Review' 
          };
        }
      }
```

## 🔍 Beispiel 5: Smart Filtering

Intelligente Filterung basierend auf Datei-Änderungen:

```yaml
- name: Determine notification type
  id: notification_type
  uses: actions/github-script@v7
  with:
    script: |
      const { data: files } = await github.rest.pulls.listFiles({
        owner: context.repo.owner,
        repo: context.repo.repo,
        pull_number: context.payload.pull_request.number,
      });
      
      const changedFiles = files.map(f => f.filename);
      
      let notificationType = 'general';
      let priority = 'normal';
      
      // Security-relevante Dateien
      if (changedFiles.some(f => 
        f.includes('security') || 
        f.includes('auth') || 
        f.includes('.env') ||
        f.includes('package-lock.json')
      )) {
        notificationType = 'security';
        priority = 'high';
      }
      
      // Infrastructure Änderungen
      else if (changedFiles.some(f => 
        f.includes('.github/workflows') ||
        f.includes('Dockerfile') ||
        f.includes('docker-compose') ||
        f.includes('terraform')
      )) {
        notificationType = 'infrastructure';
        priority = 'medium';
      }
      
      // Dokumentation
      else if (changedFiles.every(f => 
        f.includes('.md') || 
        f.includes('docs/') ||
        f.includes('README')
      )) {
        notificationType = 'documentation';
        priority = 'low';
      }
      
      core.setOutput('type', notificationType);
      core.setOutput('priority', priority);
      core.setOutput('files', JSON.stringify(changedFiles));

- name: Send targeted notification
  if: steps.notification_type.outputs.priority != 'low'
  env:
    SLACK_WEBHOOK: ${{ 
      steps.notification_type.outputs.type == 'security' && secrets.SLACK_WEBHOOK_SECURITY ||
      steps.notification_type.outputs.type == 'infrastructure' && secrets.SLACK_WEBHOOK_DEVOPS ||
      secrets.SLACK_WEBHOOK_GENERAL 
    }}
  # ... Slack notification mit spezifischen Informationen
```

## 📈 Beispiel 6: Metriken und Statistics

Erweiterte Statistiken in Benachrichtigungen:

```javascript
- name: Generate statistics
  uses: actions/github-script@v7
  with:
    script: |
      // Repository Statistiken abrufen
      const { data: repo } = await github.rest.repos.get({
        owner: context.repo.owner,
        repo: context.repo.repo
      });
      
      // Letzte Issues und PRs
      const { data: recentIssues } = await github.rest.issues.listForRepo({
        owner: context.repo.owner,
        repo: context.repo.repo,
        state: 'open',
        per_page: 100
      });
      
      const openIssues = recentIssues.filter(i => !i.pull_request).length;
      const openPRs = recentIssues.filter(i => i.pull_request).length;
      
      // Contributor Aktivität
      const { data: contributors } = await github.rest.repos.listContributors({
        owner: context.repo.owner,
        repo: context.repo.repo,
        per_page: 10
      });
      
      const payload = {
        attachments: [{
          color: '#9C27B0',
          blocks: [
            {
              type: "header",
              text: {
                type: "plain_text", 
                text: "📊 Repository Status Update"
              }
            },
            {
              type: "section",
              fields: [
                {
                  type: "mrkdwn",
                  text: `*Repository:* ${context.repo.owner}/${context.repo.repo}`
                },
                {
                  type: "mrkdwn",
                  text: `*Stars:* ⭐ ${repo.stargazers_count}`
                },
                {
                  type: "mrkdwn", 
                  text: `*Open Issues:* 📋 ${openIssues}`
                },
                {
                  type: "mrkdwn",
                  text: `*Open PRs:* 🔄 ${openPRs}`
                },
                {
                  type: "mrkdwn",
                  text: `*Contributors:* 👥 ${contributors.length}+`
                },
                {
                  type: "mrkdwn",
                  text: `*Language:* ${repo.language || 'Mixed'}`
                }
              ]
            },
            {
              type: "context",
              elements: [
                {
                  type: "mrkdwn",
                  text: `Last updated: ${new Date().toLocaleString('de-DE')}`
                }
              ]
            }
          ]
        }]
      };
```

## 🎛️ Beispiel 7: Environment-basierte Konfiguration

Verschiedene Konfigurationen für verschiedene Environments:

```yaml
name: Environment-Aware Slack Notifications

on:
  push:
    branches: [main, develop, staging]
  pull_request:
    branches: [main, develop]

jobs:
  slack-notification:
    runs-on: ubuntu-latest
    
    steps:
      - name: Determine environment
        id: env
        run: |
          if [[ "${{ github.ref }}" == "refs/heads/main" ]]; then
            echo "environment=production" >> $GITHUB_OUTPUT
            echo "webhook_secret=SLACK_WEBHOOK_PROD" >> $GITHUB_OUTPUT
            echo "color=#F44336" >> $GITHUB_OUTPUT  # Rot für Production
          elif [[ "${{ github.ref }}" == "refs/heads/staging" ]]; then
            echo "environment=staging" >> $GITHUB_OUTPUT
            echo "webhook_secret=SLACK_WEBHOOK_STAGING" >> $GITHUB_OUTPUT
            echo "color=#FF9800" >> $GITHUB_OUTPUT  # Orange für Staging
          else
            echo "environment=development" >> $GITHUB_OUTPUT
            echo "webhook_secret=SLACK_WEBHOOK_DEV" >> $GITHUB_OUTPUT
            echo "color=#4CAF50" >> $GITHUB_OUTPUT  # Grün für Development
          fi
      
      - name: Send environment notification
        uses: actions/github-script@v7
        env:
          SLACK_WEBHOOK: ${{ secrets[steps.env.outputs.webhook_secret] }}
          ENVIRONMENT: ${{ steps.env.outputs.environment }}
          ENV_COLOR: ${{ steps.env.outputs.color }}
        with:
          script: |
            const payload = {
              attachments: [{
                color: process.env.ENV_COLOR,
                blocks: [
                  {
                    type: "header",
                    text: {
                      type: "plain_text",
                      text: `🚀 Deployment to ${process.env.ENVIRONMENT.toUpperCase()}`
                    }
                  }
                  // ... weitere Blöcke
                ]
              }]
            };
```

## 🔄 Beispiel 8: Reusable Slack Action

Wiederverwendbare Action für Slack-Benachrichtigungen:

```yaml
# .github/actions/slack-notify/action.yml
name: 'Enhanced Slack Notification'
description: 'Send rich Slack notifications for GitHub events'

inputs:
  webhook-url:
    description: 'Slack Webhook URL'
    required: true
  message-type:
    description: 'Type of message (issue, pr, release, alert)'
    required: true
    default: 'general'
  priority:
    description: 'Message priority (low, normal, high, critical)'
    required: false
    default: 'normal'

runs:
  using: 'composite'
  steps:
    - uses: actions/github-script@v7
      with:
        script: |
          const messageType = '${{ inputs.message-type }}';
          const priority = '${{ inputs.priority }}';
          
          // Dynamische Nachrichtenerstellung basierend auf Typ und Priorität
          // ... Implementation

# Verwendung in Workflows:
- name: Notify Slack
  uses: ./.github/actions/slack-notify
  with:
    webhook-url: ${{ secrets.SLACK_WEBHOOK_URL }}
    message-type: 'pr'
    priority: 'high'
```

## 💡 Best Practices

### 1. Rate Limiting vermeiden
```javascript
// Batch notifications für mehrere Events
const notifications = [];
// Sammle alle Events
// ...
// Sende als eine große Nachricht
await sendBatchNotification(notifications);
```

### 2. Fehlerbehandlung
```javascript
try {
  await fetch(webhook, {
    method: 'POST', 
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(payload)
  });
  console.log('✅ Slack notification sent successfully');
} catch (error) {
  console.log('❌ Failed to send Slack notification:', error.message);
  // Fallback oder retry logic
}
```

### 3. Konditionale Benachrichtigungen
```yaml
# Nur bei bestimmten Bedingungen senden
- name: Send notification
  if: |
    (github.event_name == 'issues' && github.event.action == 'opened') ||
    (github.event_name == 'pull_request' && github.event.pull_request.draft == false) ||
    contains(github.event.head_commit.message, '[notify]')
```

---

Diese Beispiele zeigen die Vielseitigkeit der Slack-Integration und können als Basis für deine eigenen erweiterten Implementierungen dienen!