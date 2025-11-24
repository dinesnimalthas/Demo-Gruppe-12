# Labels für den Bot

## Auto-generierte Labels

Der Label-Bot erkennt automatisch folgende Keywords:

### Bug-Labels
- **bug**: Erkannt durch: bug, error, fehler, problem, crash, broken, fix
  - Beispiel: "Bug: Division durch Null in calculator.js"

### Enhancement-Labels
- **enhancement**: Erkannt durch: feature, enhancement, verbesserung, neu, new
  - Beispiel: "Feature: Neue Exponentialfunktion hinzufügen"

### Documentation-Labels
- **documentation**: Erkannt durch: doc, documentation, dokumentation, readme, guide
  - Beispiel: "Documentation: API-Dokumentation fehlt"

### Question-Labels
- **question**: Erkannt durch: question, frage, help, hilfe, how to, wie
  - Beispiel: "Question: Wie verwende ich die API?"

### Priority-Labels
- **priority: high**: Erkannt durch: urgent, dringend, critical, kritisch, asap
  - Beispiel: "Bug: Critical security vulnerability in auth"

### Difficulty-Labels
- **good first issue**: Erkannt durch: easy, einfach, beginner, anfänger
  - Beispiel: "Easy fix: Update README typo"

## Automatische Triage-Labels

- **needs triage**: Wird automatisch bei jedem neuen Issue/PR hinzugefügt
- **needs more info**: Wird hinzugefügt wenn wichtige Informationen fehlen

## Testing

Um die Bots zu testen, erstelle Issues mit diesen Titeln:

1. "Bug: Calculator crashed when dividing by zero"
2. "Feature: Add support for scientific notation"
3. "Documentation: Missing installation instructions"
4. "Question: How do I run the tests?"
5. "Critical Bug: Security vulnerability in user authentication"
6. "Easy fix: Typo in README.md"
