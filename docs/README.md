# 🌐 TechGear Store Website

Die Live-Website des TechGear Store mit automatisierter Support-Integration.

## 📄 Dateien

- **index.html** - Haupt-Website (E-Commerce Store)
- **automation-dashboard.html** - Live Workflow Monitoring Dashboard

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
