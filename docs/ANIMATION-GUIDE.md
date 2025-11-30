# 🎬 ImmoFlow Animation Reference

Schnellreferenz für alle verfügbaren Animationen und Effekte.

---

## 🎨 CSS Animation Classes

### Basis Animationen

```html
<!-- Fade In (von unten) -->
<div class="animate-fade-in">Content</div>

<!-- Slide In (von links) -->
<div class="animate-slide-left">Content</div>

<!-- Slide In (von rechts) -->
<div class="animate-slide-right">Content</div>

<!-- Scale In (zoom) -->
<div class="animate-scale">Content</div>

<!-- Float (kontinuierlich) -->
<div class="animate-float">Content</div>

<!-- Pulse (kontinuierlich) -->
<div class="animate-pulse">Content</div>
```

### Scroll-Triggered Animationen

```html
<!-- Automatisch beim Scrollen sichtbar -->
<div class="animate-on-scroll">
  Wird animiert wenn im Viewport
</div>

<!-- Mit Verzögerung -->
<div class="animate-on-scroll" data-delay="100">
  100ms Verzögerung
</div>

<div class="animate-on-scroll" data-delay="200">
  200ms Verzögerung
</div>
```

**💡 Tipp**: Wird automatisch auf alle Cards angewendet!

---

## ✨ Effekt Classes

### Glassmorphism

```html
<!-- Hell (für dunkle Hintergründe) -->
<div class="glass">
  Glassmorphism Effekt
</div>

<!-- Dunkel (für helle Hintergründe) -->
<div class="glass-dark">
  Glassmorphism Dunkel
</div>
```

**Eigenschaften**:
- `backdrop-filter: blur(10px)`
- Transparenter Hintergrund
- Subtile Border

---

## 🔢 Animated Counters

### HTML Setup
```html
<div class="stat-number" data-count="1200">0</div>
```

### Features
- ✅ Automatisch beim Scrollen
- ✅ Smooth Animation (2 Sekunden)
- ✅ Formatierung (1200 → 1.2K+)
- ✅ Nur einmal pro Page Load

### Formatierung
```javascript
// Automatische Formatierung:
1200  → "1.2K+"
5000  → "5.0K+"
250   → "250+"
```

**💡 Tipp**: Funktioniert nur mit Zahlen (nicht "24/7" oder "98%")

---

## 🎯 Parallax Effects

### HTML Setup
```html
<!-- Langsam (0.3 = 30% der Scroll-Geschwindigkeit) -->
<div data-parallax="0.3">
  Bewegt sich langsam
</div>

<!-- Mittel (0.5 = 50%) -->
<div data-parallax="0.5">
  Bewegt sich mittel
</div>

<!-- Schnell (0.8 = 80%) -->
<div data-parallax="0.8">
  Bewegt sich schnell
</div>
```

**Best Practices**:
- 0.3 - 0.5 für subtile Effekte
- 0.5 - 0.7 für mittlere Effekte
- 0.7+ für starke Effekte

---

## 🎴 Card Animations

### 3D Tilt Effect

**Automatisch** auf allen `.product-card` Elements!

**Funktioniert durch**:
- Mouse Move Tracking
- CSS Transform 3D
- Smooth Transitions

**Deaktivieren**:
```javascript
// In immoflow.js, PropertyCards.init()
// Kommentiere aus: this.add3DTilt(card);
```

### Wishlist Animation

```html
<!-- Bereits im HTML -->
<button class="wishlist-btn">
  <i class="fa-regular fa-heart"></i>
</button>
```

**Features**:
- Toggle zwischen outlined/filled
- Heart-Beat Animation
- Color Change zu Rot

---

## 🔍 Search Animation

### Auto-Applied
Search funktioniert automatisch auf:
- `.product-name` - Immobilien Name
- `.product-description` - Beschreibung
- `.product-category` - Kategorie

**Features**:
- ✅ Debounced (300ms)
- ✅ Case-insensitive
- ✅ Scale-in Animation für Ergebnisse
- ✅ "No Results" Message

---

## 📱 Mobile Animations

### Reduzierte Bewegung

```css
@media (prefers-reduced-motion: reduce) {
  /* Alle Animationen deaktiviert */
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

**Respektiert** User-Präferenz für weniger Bewegung.

---

## 🎭 Button Animations

### Ripple Effect

**Bereits auf allen `.btn` Elements!**

```html
<button class="btn btn-primary">
  Klick mich
</button>
```

**Funktioniert durch**:
- `::before` Pseudo-Element
- Scale Animation on Click
- Smooth Transition (600ms)

---

## 🌊 Navigation Animations

### Auto-Hide on Scroll

**Automatisch aktiv!**

**Verhalten**:
- Scrollt runter → Nav versteckt sich
- Scrollt hoch → Nav erscheint wieder
- Über 500px Scroll erforderlich

### Active Section Highlighting

**Automatisch aktiv!**

**Verhalten**:
- Erkennt aktuelle Section
- Highlightet passenden Nav-Link
- Smooth Underline Animation

---

## 💨 Performance Tipps

### Do's ✅

```html
<!-- ✅ CSS Animationen (GPU-beschleunigt) -->
<div style="transform: translateY(10px);">Fast</div>

<!-- ✅ Opacity Changes (GPU-beschleunigt) -->
<div style="opacity: 0.5;">Fast</div>

<!-- ✅ IntersectionObserver für Scroll -->
<div class="animate-on-scroll">Efficient</div>
```

### Don'ts ❌

```html
<!-- ❌ Layout-triggernde Properties -->
<div style="width: 50%;">Slow</div>
<div style="height: 200px;">Slow</div>

<!-- ❌ Scroll Events ohne Throttling -->
window.addEventListener('scroll', () => {...}) // Slow

<!-- ❌ JavaScript Animationen wenn CSS möglich -->
setInterval(() => {...}, 16) // Use CSS instead
```

---

## 🎨 Custom Animations erstellen

### CSS Keyframes

```css
@keyframes meinAnimation {
  from {
    opacity: 0;
    transform: scale(0.8);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.mein-element {
  animation: meinAnimation 0.5s ease-out;
}
```

### JavaScript Animation

```javascript
// In immoflow.js hinzufügen
class MeineAnimation {
  constructor() {
    this.elements = $$('.mein-element');
    this.init();
  }

  init() {
    this.elements.forEach(el => {
      el.addEventListener('click', () => {
        el.classList.add('animated');
      });
    });
  }
}

// In ImmoFlow.initModules() hinzufügen
this.modules.push(new MeineAnimation());
```

---

## 🔧 Animation Konfiguration

### Globale Settings

In `immoflow.css` `:root`:

```css
:root {
  --transition-fast: 150ms cubic-bezier(0.4, 0, 0.2, 1);
  --transition: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  --transition-slow: 500ms cubic-bezier(0.4, 0, 0.2, 1);
}
```

### JavaScript Config

In `immoflow.js`:

```javascript
const CONFIG = {
  ANIMATION_DURATION: 600,      // Standard Animation Zeit
  SCROLL_THRESHOLD: 0.1         // IntersectionObserver Threshold
};
```

---

## 📊 Animation Performance Monitor

### Browser DevTools

```javascript
// In Console
window.ImmoFlow.app.modules.forEach(module => {
  if (module.constructor.name === 'PerformanceMonitor') {
    console.log('Performance Monitor active');
  }
});
```

### Performance Tab
1. Chrome DevTools öffnen
2. "Performance" Tab
3. Record starten
4. Seite scrollen/interagieren
5. Record stoppen
6. Analyse: FPS, Layout Shifts, etc.

**Ziel**: Konstant 60 FPS

---

## 🎬 Beispiel: Complete Animation Setup

```html
<!-- Section mit allem -->
<section class="section bg-surface">
  <!-- Header mit Scroll Animation -->
  <div class="section-header animate-on-scroll">
    <span class="section-badge">
      <i class="fas fa-star"></i> Features
    </span>
    <h2 class="section-title">Unsere Services</h2>
  </div>

  <!-- Grid mit Parallax Background -->
  <div data-parallax="0.3" style="position: absolute; opacity: 0.1;">
    Background Element
  </div>

  <!-- Cards mit Stagger Animation -->
  <div class="automation-grid">
    <div class="automation-card animate-on-scroll" data-delay="0">
      <!-- Card 1 (sofort) -->
    </div>
    <div class="automation-card animate-on-scroll" data-delay="100">
      <!-- Card 2 (100ms später) -->
    </div>
    <div class="automation-card animate-on-scroll" data-delay="200">
      <!-- Card 3 (200ms später) -->
    </div>
  </div>

  <!-- Animated Counter -->
  <div class="stat-card">
    <div class="stat-number" data-count="5000">0</div>
    <div class="stat-label">Users</div>
  </div>

  <!-- Glassmorphism CTA -->
  <div class="glass" style="padding: 2rem; text-align: center;">
    <button class="btn btn-primary animate-float">
      <i class="fas fa-rocket"></i> Los geht's
    </button>
  </div>
</section>
```

---

## 🐛 Troubleshooting

### Animationen funktionieren nicht

**Checkliste**:
1. ✅ `immoflow.css` eingebunden?
2. ✅ `immoflow.js` eingebunden?
3. ✅ Browser Cache geleert?
4. ✅ JavaScript Errors in Console?
5. ✅ Element im Viewport sichtbar?

### Performance Probleme

**Lösungen**:
1. Reduziere `data-parallax` Werte
2. Weniger gleichzeitige Animationen
3. `will-change: transform` für oft animierte Elemente
4. Lazy Loading für Bilder aktivieren
5. Deaktiviere Animationen auf Mobile

### Scroll Animations zu empfindlich

```javascript
// In immoflow.js, ScrollAnimations constructor
this.options = {
  threshold: 0.3,  // Erhöhe von 0.1 auf 0.3
  rootMargin: '0px 0px -200px 0px'  // Größerer Offset
};
```

---

## 📚 Weitere Ressourcen

- **CSS Tricks**: https://css-tricks.com/
- **MDN Web Docs**: https://developer.mozilla.org/
- **Can I Use**: https://caniuse.com/
- **Web.dev**: https://web.dev/animations/

---

**Happy Animating! 🎉**
