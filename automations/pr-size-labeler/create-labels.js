#!/usr/bin/env node

/**
 * PR Size Labeler - Label Creator
 * 
 * Erstellt alle benötigten Labels für den PR Size Labeler Bot
 * 
 * Verwendung:
 * 1. Installiere GitHub CLI: https://cli.github.com/
 * 2. Authentifiziere: gh auth login
 * 3. Führe aus: node create-labels.js
 */

const { execSync } = require('child_process');

const labels = [
    // Size labels with color gradient
    { 
        name: 'size: XS', 
        color: '0e8a16', 
        description: '< 10 lines changed - Perfect size for quick review' 
    },
    { 
        name: 'size: S', 
        color: '5ec93f', 
        description: '< 50 lines changed - Good size for review' 
    },
    { 
        name: 'size: M', 
        color: 'fbca04', 
        description: '< 200 lines changed - Moderate review needed' 
    },
    { 
        name: 'size: L', 
        color: 'ff9800', 
        description: '< 500 lines changed - Large PR, consider splitting' 
    },
    { 
        name: 'size: XL', 
        color: 'd93f0b', 
        description: '500+ lines changed - Very large, should be split' 
    },
    // Additional labels
    { 
        name: 'needs split', 
        color: 'd73a4a', 
        description: 'PR is too large and should be split into smaller PRs' 
    }
];

console.log('🏷️  Creating PR Size Labeler Labels...\n');

let created = 0;
let errors = 0;

for (const label of labels) {
    try {
        const command = `gh label create "${label.name}" --color ${label.color} --description "${label.description}" --force`;
        execSync(command, { stdio: 'inherit' });
        console.log(`✅ Label "${label.name}" created`);
        created++;
    } catch (error) {
        console.error(`❌ Error creating "${label.name}": ${error.message}`);
        errors++;
    }
}

console.log(`\n📊 Summary:`);
console.log(`   Created: ${created}`);
console.log(`   Errors: ${errors}`);
console.log(`   Total: ${labels.length}`);

if (errors === 0) {
    console.log('\n🎉 All labels created successfully!');
    console.log('\n📝 Next steps:');
    console.log('   1. Merge the workflow to main branch');
    console.log('   2. Create a test PR');
    console.log('   3. Watch the bot add size labels automatically!');
} else {
    console.log('\n⚠️  Some labels could not be created.');
    console.log('   Make sure GitHub CLI is installed and authenticated:');
    console.log('   - Install: https://cli.github.com/');
    console.log('   - Authenticate: gh auth login');
}

console.log('\n🎨 Label Color Guide:');
console.log('   🟢 size: XS/S - Green (good)');
console.log('   🟡 size: M - Yellow (moderate)');
console.log('   🟠 size: L - Orange (large)');
console.log('   🔴 size: XL - Red (too large)');
