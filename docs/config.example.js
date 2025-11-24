// ========================================
// CONFIGURATION EXAMPLE
// ========================================
// 
// Kopiere diese Datei zu "config.js" und füge deinen PAT ein
// config.js wird von .gitignore ignoriert

const CONFIG = {
  GITHUB_PAT: 'dein_personal_access_token_hier',
  REPO_OWNER: 'dinesnimalthas',
  REPO_NAME: 'Demo-Gruppe-12'
};

// Exportiere die Konfiguration (falls benötigt)
if (typeof module !== 'undefined' && module.exports) {
  module.exports = CONFIG;
}
