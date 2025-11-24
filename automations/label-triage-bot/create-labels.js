#!/usr/bin/env node

/**
 * Dieses Skript erstellt alle benötigten Labels für die Bots
 * 
 * Verwendung:
 * 1. Installiere GitHub CLI: https://cli.github.com/
 * 2. Authentifiziere: gh auth login
 * 3. Führe aus: node create-labels.js
 */

const { execSync } = require('child_process');

const labels = [
    { name: 'bug', color: 'd73a4a', description: 'Etwas funktioniert nicht' },
    { name: 'enhancement', color: 'a2eeef', description: 'Neue Funktion oder Verbesserung' },
    { name: 'documentation', color: '0075ca', description: 'Verbesserung der Dokumentation' },
    { name: 'question', color: 'd876e3', description: 'Weitere Informationen werden benötigt' },
    { name: 'priority: high', color: 'b60205', description: 'Hohe Priorität' },
    { name: 'priority: medium', color: 'fbca04', description: 'Mittlere Priorität' },
    { name: 'priority: low', color: '0e8a16', description: 'Niedrige Priorität' },
    { name: 'good first issue', color: '7057ff', description: 'Gut für Anfänger' },
    { name: 'needs triage', color: 'fbca04', description: 'Muss noch bearbeitet werden' },
    { name: 'needs more info', color: 'fef2c0', description: 'Weitere Informationen erforderlich' },
    { name: 'wontfix', color: 'ffffff', description: 'Wird nicht behoben' },
    { name: 'duplicate', color: 'cfd3d7', description: 'Duplikat eines anderen Issues' },
    { name: 'help wanted', color: '008672', description: 'Hilfe von der Community erwünscht' },
    { name: 'security', color: 'ee0701', description: 'Sicherheitsproblem' }
];

console.log('🏷️  Erstelle GitHub Labels...\n');

let created = 0;
let errors = 0;

for (const label of labels) {
    try {
        const command = `gh label create "${label.name}" --color ${label.color} --description "${label.description}" --force`;
        execSync(command, { stdio: 'inherit' });
        console.log(`✅ Label "${label.name}" erstellt`);
        created++;
    } catch (error) {
        console.error(`❌ Fehler bei "${label.name}": ${error.message}`);
        errors++;
    }
}

console.log(`\n📊 Zusammenfassung:`);
console.log(`   Erstellt: ${created}`);
console.log(`   Fehler: ${errors}`);
console.log(`   Total: ${labels.length}`);

if (errors === 0) {
    console.log('\n🎉 Alle Labels wurden erfolgreich erstellt!');
} else {
    console.log('\n⚠️  Einige Labels konnten nicht erstellt werden.');
    console.log('   Stelle sicher, dass GitHub CLI installiert und authentifiziert ist:');
    console.log('   - Installieren: https://cli.github.com/');
    console.log('   - Authentifizieren: gh auth login');
}
