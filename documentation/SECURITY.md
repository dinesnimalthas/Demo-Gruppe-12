# SECURITY.md
# Sicherheitsrichtlinien und Verfahren

## 🔐 Sicherheitsverpflichtung

Die Sicherheit unseres Projekts ist uns wichtig. Wir schätzen die Bemühungen von Sicherheitsforschern und der Community, Sicherheitsprobleme verantwortungsvoll zu melden.

## 🚨 Sicherheitslücke melden

**Bitte melde Sicherheitslücken NICHT über öffentliche GitHub Issues!**

Stattdessen sende bitte eine E-Mail an: **[deine-email@example.com]**

Du solltest innerhalb von 48 Stunden eine Antwort erhalten. Wenn nicht, kontaktiere uns bitte erneut.

### Was sollte der Bericht enthalten?

- Art der Sicherheitslücke
- Vollständige Pfade der betroffenen Quellcode-Datei(en)
- Speicherort des betroffenen Quellcodes (Tag/Branch/Commit oder direkte URL)
- Schritt-für-Schritt-Anleitung zur Reproduktion
- Proof-of-concept oder exploit Code (falls möglich)
- Auswirkungen des Problems, einschließlich wie ein Angreifer das Problem ausnutzen könnte

## 🔒 Unterstützte Versionen

| Version | Unterstützt          |
| ------- | -------------------- |
| main    | ✅ Ja                |
| andere  | ❌ Nein              |

## 🛡️ Sicherheits-Best-Practices

### Für Contributors

1. **Secrets nie im Code committen**
   - Verwende immer GitHub Secrets für sensible Daten
   - Prüfe deinen Code vor dem Commit auf exposed credentials
   - Verwende Tools wie `git-secrets` oder `truffleHog`

2. **Dependencies aktuell halten**
   - Überprüfe regelmäßig auf Sicherheitsupdates
   - Verwende `npm audit` oder ähnliche Tools
   - Aktualisiere abhängige Pakete zeitnah

3. **Input Validation**
   - Validiere alle Benutzereingaben
   - Sanitize Daten vor der Verwendung
   - Verwende parametrisierte Queries

4. **Least Privilege Prinzip**
   - Workflows sollten nur minimale Berechtigungen haben
   - Verwende spezifische Permissions in GitHub Actions
   - Keine unnötigen Token-Berechtigungen

### Secrets Management

```yaml
# ✅ Gut
permissions:
  contents: read
  issues: write

# ❌ Schlecht
permissions: write-all
```

## 📋 Verantwortungsvolle Offenlegung

Wir folgen einem Prozess der verantwortungsvollen Offenlegung:

1. **Meldung**: Du meldest die Schwachstelle privat
2. **Bestätigung**: Wir bestätigen den Empfang innerhalb von 48 Stunden
3. **Bewertung**: Wir bewerten und verifizieren das Problem
4. **Fix**: Wir entwickeln und testen einen Fix
5. **Release**: Wir veröffentlichen den Fix
6. **Disclosure**: Nach angemessener Zeit wird das Problem öffentlich gemacht

**Timeline**: Wir bemühen uns, Probleme innerhalb von 90 Tagen zu beheben.

## 🏆 Anerkennung

Wir danken Sicherheitsforschern für ihre Beiträge:

- [Hier werden Sicherheitsforscher aufgelistet]

## 📚 Weitere Ressourcen

- [GitHub Security Best Practices](https://docs.github.com/en/code-security)
- [OWASP Top Ten](https://owasp.org/www-project-top-ten/)
- [CWE Top 25](https://cwe.mitre.org/top25/)

## 📞 Kontakt

Bei Fragen zur Sicherheit:
- **E-Mail**: [deine-email@example.com]
- **GitHub**: @dinesnimalthas

---

**Letzte Aktualisierung**: November 2025
