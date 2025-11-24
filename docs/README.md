# 🌐 TechGear — Premium Electronics Store

Ein minimalistisches, Apple-inspiriertes E-Commerce-Design mit intelligenter GitHub-Automatisierung.

## 🎨 Design-Philosophie

Das neue Design folgt Apples Designprinzipien:
- **Minimalismus**: Klare Linien, viel Weißraum, Fokus auf Inhalt
- **Typografie**: SF Pro Display-ähnliche Schrift (Inter/System Fonts)
- **Farben**: Dezent und elegant mit blauen Akzenten
- **Animationen**: Subtil und funktional, niemals aufdringlich
- **Responsive**: Perfekt auf allen Geräten

## 📄 Dateien

- **index.html** - Haupt-Website (Apple-inspired minimalist design)
- **styles.css** - Separates CSS mit CSS Custom Properties
- **script.js** - Modulares JavaScript (ES6+)
- **automation-dashboard.html** - Live Workflow Monitoring Dashboard

## 🚀 Features

### Design
- ✅ Apple-inspirierte Navigation mit Blur-Effekt
- ✅ Minimalistischer Hero-Bereich ohne störende Grafiken
- ✅ Elegante Produktkarten mit subtilen Hover-Effekten
- ✅ Clean Support-Formular mit klarer Hierarchie
- ✅ Responsives Grid-Layout
- ✅ Smooth Scrolling & Fade-in Animationen

### Funktionalität
- ✅ Shopping Cart mit Counter
- ✅ GitHub Issue Integration
- ✅ Automatisches Label-System
- ✅ Formular-Validierung
- ✅ Intersection Observer für Performance
- ✅ Parallax-Effekte

## 🛠 Technologie-Stack

- **HTML5**: Semantisches Markup, SEO-optimiert
- **CSS3**: Custom Properties, Flexbox, Grid, Backdrop-filter
- **JavaScript**: ES6+, Fetch API, Async/Await
- **Font Awesome 6.4**: Icons
- **GitHub REST API**: Issue-Erstellung

## 🎯 Support Form Integration

Das Support-Formular erstellt automatisch GitHub Issues:

```javascript
// Konfiguration in script.js
const CONFIG = {
  GITHUB_PAT: 'YOUR_GITHUB_PAT_HERE',
  REPO_OWNER: 'dinesnimalthas',
  REPO_NAME: 'Demo-Gruppe-12'
};
```

**⚠️ Wichtig**: Personal Access Token muss in `script.js` (Zeile 6) konfiguriert werden!

## 📱 Responsive Design

- **Mobile-First Approach**
- **Breakpoints**: 768px (Tablet), 1024px+ (Desktop)
- **Touch-Friendly**: Große Touch-Targets, optimierte Navigation
- **Flexible Grid**: Auto-fit mit minmax()

## 🎨 CSS Design System

### Farben
```css
--color-accent: #0071e3;        /* Apple Blau */
--color-text: #1d1d1f;          /* Fast-Schwarz */
--color-text-secondary: #6e6e73; /* Grau */
--color-surface: #f5f5f7;        /* Hellgrau */
```

### Typografie
```css
--font-family: -apple-system, BlinkMacSystemFont, 'Inter', ...
--font-size-base: 1rem;
--font-size-xl: 1.5rem;
--font-size-4xl: 4rem;
```

### Abstände
```css
--spacing-sm: 1rem;
--spacing-md: 2rem;
--spacing-lg: 4rem;
--spacing-xl: 6rem;
```

## 🔧 Anpassungen

### Farben ändern
Bearbeite CSS Custom Properties in `styles.css`:
```css
:root {
  --color-accent: #0071e3; /* Deine Farbe */
}
```

### Neue Produkte hinzufügen
Kopiere einen `.product-card` Block in `index.html`:
```html
<div class="product-card">
  <div class="product-image">
    <i class="fas fa-laptop product-icon"></i>
  </div>
  <div class="product-info">
    <!-- Produktinformationen -->
  </div>
</div>
```

### JavaScript erweitern
Alle Funktionen sind modular in `script.js` organisiert.

## 📊 Performance

- **Minimales CSS**: Keine Framework-Bloat
- **Vanilla JavaScript**: Kein jQuery oder große Libraries
- **CDN**: Font Awesome via CDN
- **Lazy Loading**: Intersection Observer für Animationen
- **Optimiert**: Schnelle Ladezeiten

## 🌍 Browser Support

- ✅ Chrome/Edge (90+)
- ✅ Firefox (88+)
- ✅ Safari (14+)
- ✅ Mobile Browsers (iOS/Android)

## 📖 Weitere Dokumentation

- [Präsentations-Guide](../PRESENTATION-GUIDE.md)
- [Workflow Docs](../.github/workflows/)
- [Setup-Anleitung](../README.md)
- [Automation Dashboard](./automation-dashboard.html)

## 🎯 Design Guidelines

### Prinzipien
1. **Klarheit**: Inhalt steht im Vordergrund
2. **Konsistenz**: Einheitliche Abstände und Größen
3. **Hierarchie**: Klare visuelle Hierarchie durch Größe und Gewicht
4. **Weißraum**: Großzügiger Einsatz für Lesbarkeit
5. **Subtilität**: Dezente Animationen und Übergänge

### Best Practices
- Verwende immer CSS Custom Properties für Farben und Abstände
- Halte Animationen unter 0.3s für Micro-Interaktionen
- Nutze semantisches HTML für Accessibility
- Teste auf verschiedenen Geräten

## 👥 Team

Demo-Website für IT Project Basics — HSLU

## 📄 Lizenz

Siehe [LICENSE](../LICENSE)


## 🎨 Design Features

### Index.html (Hauptseite)
- **Hero Section**: Parallax-Effekte, animated gradients, Trust Badges
- **Bestsellers**: Premium Produktkarten mit Sale-Badges, Ratings
- **Product Categories**: Smartwatches, Gaming, Photo/Video
- **Customer Reviews**: Testimonials mit Verified Purchase Badges
- **Support Form**: GitHub API Integration für automatische Ticket-Erstellung
- **Footer**: Newsletter, Social Links, umfassende Navigation

### Automation Dashboard
- **Live Stats**: Active Workflows, Support Tickets, Response Time
- **Workflow Cards**: 4 Hauptautomationen visualisiert
- **Activity Timeline**: Recent Events mit Status-Updates
- **5-Step Workflow**: Visueller Prozessablauf

## 🚀 Technologie

- **Framework**: Tailwind CSS (via CDN)
- **Icons**: Font Awesome 6.4.0
- **Fonts**: Google Fonts - Inter
- **JavaScript**: Vanilla ES6+
- **API**: GitHub REST API

## 🎯 Support Form Integration

Das Support-Formular erstellt automatisch GitHub Issues:

```javascript
// GitHub API Configuration
const GITHUB_PAT = 'DEIN_PAT_HIER';
const REPO_OWNER = 'HSLU-Exercise';
const REPO_NAME = 'Demo-Gruppe-12';
```

**⚠️ Wichtig**: Personal Access Token muss in `index.html` Zeile ~885 eingefügt werden!

## 📱 Responsive Design

- **Mobile-First**: Optimiert für alle Bildschirmgrößen
- **Breakpoints**: sm, md, lg, xl (Tailwind Standard)
- **Touch-Friendly**: Große Buttons, optimierte Navigation

## 🎨 CSS Features

```css
/* Glassmorphism */
.glass {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
}

/* Parallax Hero */
.parallax-hero {
    background: linear-gradient(135deg, #667eea, #764ba2, #f093fb);
}

/* Product Card Hover */
.product-card:hover {
    transform: translateY(-12px) scale(1.02);
}
```

## 🔧 Anpassungen

### Farben ändern
Suche nach `from-purple-600 to-blue-600` und ersetze mit gewünschten Farben.

### Produkte hinzufügen
Dupliziere einen `.product-card` Block und passe Content an.

### Support-Kategorien
Editiere das `<select id="issueType">` Element.

## 📊 Performance

- **Lighthouse Score**: 95+ (Performance, Accessibility, Best Practices)
- **Load Time**: < 2s (mit CDN)
- **Bundle Size**: Keine - alles via CDN

## 🌍 Browser Support

- ✅ Chrome/Edge (90+)
- ✅ Firefox (88+)
- ✅ Safari (14+)
- ✅ Mobile Browsers

## 📖 Weitere Dokumentation

- [Präsentations-Guide](../automations/README.md)
- [Workflow Docs](../.github/workflows/)
- [Setup-Anleitung](../README.md)
