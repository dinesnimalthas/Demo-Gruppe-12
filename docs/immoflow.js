/* ========================================
   IMMOFLOW - ENHANCED JAVASCRIPT
   Modern Interactions & Animations
   ======================================== */

// === CONFIGURATION ===
const CONFIG = {
  GITHUB_REPO: 'dinesnimalthas/Demo-Gruppe-12',
  GITHUB_TOKEN: null, // Set in repository secrets
  API_BASE: 'https://api.github.com',
  DEMO_MODE: false,
  ANIMATION_DURATION: 600,
  SCROLL_THRESHOLD: 0.1
};

// === UTILITY FUNCTIONS ===
const $ = (selector) => document.querySelector(selector);
const $$ = (selector) => document.querySelectorAll(selector);

const debounce = (func, wait) => {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
};

const throttle = (func, limit) => {
  let inThrottle;
  return function(...args) {
    if (!inThrottle) {
      func.apply(this, args);
      inThrottle = true;
      setTimeout(() => inThrottle = false, limit);
    }
  };
};

// === NAVIGATION ===
class Navigation {
  constructor() {
    this.nav = $('.nav');
    this.lastScroll = 0;
    this.init();
  }

  init() {
    if (!this.nav) return;

    // Scroll effects
    window.addEventListener('scroll', throttle(() => this.handleScroll(), 100));

    // Mobile menu toggle (if implemented)
    const menuToggle = $('.menu-toggle');
    if (menuToggle) {
      menuToggle.addEventListener('click', () => this.toggleMenu());
    }

    // Smooth scroll for nav links
    $$('.nav-link').forEach(link => {
      link.addEventListener('click', (e) => this.smoothScroll(e));
    });

    // Active link highlighting
    this.highlightActiveSection();
  }

  handleScroll() {
    const currentScroll = window.pageYOffset;

    // Add/remove scrolled class
    if (currentScroll > 50) {
      this.nav.classList.add('scrolled');
    } else {
      this.nav.classList.remove('scrolled');
    }

    // Hide/show on scroll
    if (currentScroll > this.lastScroll && currentScroll > 500) {
      this.nav.style.transform = 'translateY(-100%)';
    } else {
      this.nav.style.transform = 'translateY(0)';
    }

    this.lastScroll = currentScroll;
  }

  toggleMenu() {
    const navLinks = $('.nav-links');
    if (navLinks) {
      navLinks.classList.toggle('active');
    }
  }

  smoothScroll(e) {
    const target = e.target.getAttribute('href');
    if (target && target.startsWith('#')) {
      e.preventDefault();
      const element = $(target);
      if (element) {
        const offset = 80; // Nav height
        const elementPosition = element.getBoundingClientRect().top;
        const offsetPosition = elementPosition + window.pageYOffset - offset;

        window.scrollTo({
          top: offsetPosition,
          behavior: 'smooth'
        });
      }
    }
  }

  highlightActiveSection() {
    const sections = $$('section[id]');
    const navLinks = $$('.nav-link');

    window.addEventListener('scroll', throttle(() => {
      let current = '';

      sections.forEach(section => {
        const sectionTop = section.offsetTop;
        if (window.pageYOffset >= sectionTop - 100) {
          current = section.getAttribute('id');
        }
      });

      navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === `#${current}`) {
          link.classList.add('active');
        }
      });
    }, 100));
  }
}

// === SCROLL ANIMATIONS ===
class ScrollAnimations {
  constructor() {
    this.options = {
      threshold: CONFIG.SCROLL_THRESHOLD,
      rootMargin: '0px 0px -100px 0px'
    };
    this.init();
  }

  init() {
    // Intersection Observer for fade-in animations
    this.observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const delay = entry.target.dataset.delay || 0;
          setTimeout(() => {
            entry.target.classList.add('visible');
          }, delay);
        }
      });
    }, this.options);

    // Observe elements
    $$('.animate-on-scroll').forEach(el => {
      this.observer.observe(el);
    });

    // Auto-add animation classes to cards
    this.addAnimationClasses();
  }

  addAnimationClasses() {
    // Add stagger animation to cards
    $$('.product-card, .automation-card, .stat-card, .step-card').forEach((card, index) => {
      card.classList.add('animate-on-scroll');
      card.dataset.delay = index * 100;
    });

    // Add animation to sections
    $$('.section-header').forEach(header => {
      header.classList.add('animate-on-scroll');
    });
  }
}

// === ANIMATED COUNTERS ===
class AnimatedCounters {
  constructor() {
    this.counters = $$('.stat-number[data-count]');
    this.init();
  }

  init() {
    if (this.counters.length === 0) return;

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting && !entry.target.classList.contains('counted')) {
          this.animateCounter(entry.target);
          entry.target.classList.add('counted');
        }
      });
    }, { threshold: 0.5 });

    this.counters.forEach(counter => observer.observe(counter));
  }

  animateCounter(element) {
    const target = parseInt(element.dataset.count);
    const duration = 2000;
    const step = target / (duration / 16);
    let current = 0;

    const timer = setInterval(() => {
      current += step;
      if (current >= target) {
        element.textContent = this.formatNumber(target);
        clearInterval(timer);
      } else {
        element.textContent = this.formatNumber(Math.floor(current));
      }
    }, 16);
  }

  formatNumber(num) {
    if (num >= 1000) {
      return (num / 1000).toFixed(1) + 'K+';
    }
    return num + '+';
  }
}

// === SUPPORT FORM ===
class SupportForm {
  constructor() {
    this.form = $('#supportForm');
    this.init();
  }

  init() {
    if (!this.form) return;

    this.form.addEventListener('submit', (e) => this.handleSubmit(e));

    // Auto-resize textarea
    const textarea = this.form.querySelector('textarea');
    if (textarea) {
      textarea.addEventListener('input', function() {
        this.style.height = 'auto';
        this.style.height = this.scrollHeight + 'px';
      });
    }
  }

  async handleSubmit(e) {
    e.preventDefault();

    const submitBtn = this.form.querySelector('.form-submit-btn');
    const originalText = submitBtn.innerHTML;
    
    // Show loading state
    submitBtn.disabled = true;
    submitBtn.innerHTML = '<span class="loading"></span> Wird gesendet...';

    const formData = {
      name: $('#name')?.value,
      email: $('#email')?.value,
      category: $('#category')?.value,
      subject: $('#subject')?.value,
      message: $('#message')?.value
    };

    try {
      if (CONFIG.DEMO_MODE) {
        await this.simulateSubmission();
      } else {
        await this.submitToGitHub(formData);
      }

      this.showMessage('success', '✓ Vielen Dank! Ihre Anfrage wurde erfolgreich übermittelt.');
      this.form.reset();
    } catch (error) {
      console.error('Form submission error:', error);
      this.showMessage('error', '✗ Fehler beim Senden. Bitte versuchen Sie es erneut.');
    } finally {
      submitBtn.disabled = false;
      submitBtn.innerHTML = originalText;
    }
  }

  async submitToGitHub(data) {
    const issueTitle = `[Support] ${data.category}: ${data.subject}`;
    const issueBody = `
**Name:** ${data.name}
**Email:** ${data.email}
**Kategorie:** ${data.category}

**Nachricht:**
${data.message}

---
*Automatisch erstellt über ImmoFlow Support-Formular*
    `.trim();

    const response = await fetch(`${CONFIG.API_BASE}/repos/${CONFIG.GITHUB_REPO}/issues`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        ...(CONFIG.GITHUB_TOKEN && { 'Authorization': `token ${CONFIG.GITHUB_TOKEN}` })
      },
      body: JSON.stringify({
        title: issueTitle,
        body: issueBody,
        labels: ['support', data.category.toLowerCase()]
      })
    });

    if (!response.ok) {
      throw new Error('GitHub API error');
    }

    return response.json();
  }

  simulateSubmission() {
    return new Promise(resolve => setTimeout(resolve, 1500));
  }

  showMessage(type, message) {
    let messageEl = $('.form-message');
    
    if (!messageEl) {
      messageEl = document.createElement('div');
      messageEl.className = 'form-message';
      this.form.appendChild(messageEl);
    }

    messageEl.textContent = message;
    messageEl.className = `form-message ${type}`;
    messageEl.style.display = 'block';

    setTimeout(() => {
      messageEl.style.display = 'none';
    }, 5000);
  }
}

// === PROPERTY INTERACTIONS ===
class PropertyCards {
  constructor() {
    this.cards = $$('.product-card');
    this.init();
  }

  init() {
    this.cards.forEach(card => {
      // Wishlist functionality
      const wishlistBtn = card.querySelector('.wishlist-btn');
      if (wishlistBtn) {
        wishlistBtn.addEventListener('click', (e) => {
          e.stopPropagation();
          this.toggleWishlist(wishlistBtn);
        });
      }

      // Card click
      card.addEventListener('click', () => {
        this.showPropertyDetails(card);
      });

      // 3D tilt effect
      this.add3DTilt(card);
    });
  }

  toggleWishlist(btn) {
    const icon = btn.querySelector('i');
    if (icon.classList.contains('fa-regular')) {
      icon.classList.remove('fa-regular');
      icon.classList.add('fa-solid');
      btn.style.color = '#ef4444';
      this.animateHeart(btn);
    } else {
      icon.classList.remove('fa-solid');
      icon.classList.add('fa-regular');
      btn.style.color = '';
    }
  }

  animateHeart(btn) {
    btn.style.animation = 'none';
    setTimeout(() => {
      btn.style.animation = 'pulse 0.5s ease-in-out';
    }, 10);
  }

  showPropertyDetails(card) {
    // Could open a modal or navigate to details page
    console.log('Property clicked:', card.dataset.propertyId);
  }

  add3DTilt(card) {
    card.addEventListener('mousemove', (e) => {
      const rect = card.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;

      const centerX = rect.width / 2;
      const centerY = rect.height / 2;

      const rotateX = (y - centerY) / 20;
      const rotateY = (centerX - x) / 20;

      card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-10px)`;
    });

    card.addEventListener('mouseleave', () => {
      card.style.transform = '';
    });
  }
}

// === PARALLAX EFFECTS ===
class ParallaxEffects {
  constructor() {
    this.elements = $$('[data-parallax]');
    this.init();
  }

  init() {
    if (this.elements.length === 0) return;

    window.addEventListener('scroll', throttle(() => {
      this.update();
    }, 16));
  }

  update() {
    const scrolled = window.pageYOffset;

    this.elements.forEach(el => {
      const speed = parseFloat(el.dataset.parallax) || 0.5;
      const offset = scrolled * speed;
      el.style.transform = `translateY(${offset}px)`;
    });
  }
}

// === LAZY LOADING ===
class LazyLoader {
  constructor() {
    this.images = $$('img[data-src]');
    this.init();
  }

  init() {
    if ('IntersectionObserver' in window) {
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            this.loadImage(entry.target);
            observer.unobserve(entry.target);
          }
        });
      });

      this.images.forEach(img => observer.observe(img));
    } else {
      // Fallback for browsers without IntersectionObserver
      this.images.forEach(img => this.loadImage(img));
    }
  }

  loadImage(img) {
    const src = img.dataset.src;
    if (!src) return;

    img.src = src;
    img.removeAttribute('data-src');
    img.classList.add('loaded');
  }
}

// === THEME SWITCHER ===
class ThemeSwitcher {
  constructor() {
    this.toggle = $('.theme-toggle');
    this.currentTheme = localStorage.getItem('theme') || 'light';
    this.init();
  }

  init() {
    if (!this.toggle) return;

    // Apply saved theme
    document.documentElement.setAttribute('data-theme', this.currentTheme);

    this.toggle.addEventListener('click', () => {
      this.currentTheme = this.currentTheme === 'light' ? 'dark' : 'light';
      document.documentElement.setAttribute('data-theme', this.currentTheme);
      localStorage.setItem('theme', this.currentTheme);
    });
  }
}

// === SEARCH FUNCTIONALITY ===
class PropertySearch {
  constructor() {
    this.searchInput = $('#propertySearch');
    this.cards = $$('.product-card');
    this.init();
  }

  init() {
    if (!this.searchInput) return;

    this.searchInput.addEventListener('input', debounce((e) => {
      this.search(e.target.value);
    }, 300));
  }

  search(query) {
    const searchTerm = query.toLowerCase().trim();

    this.cards.forEach(card => {
      const name = card.querySelector('.product-name')?.textContent.toLowerCase() || '';
      const description = card.querySelector('.product-description')?.textContent.toLowerCase() || '';
      const category = card.querySelector('.product-category')?.textContent.toLowerCase() || '';

      if (name.includes(searchTerm) || description.includes(searchTerm) || category.includes(searchTerm)) {
        card.style.display = '';
        card.classList.add('animate-scale');
      } else {
        card.style.display = 'none';
      }
    });

    // Show "no results" message if needed
    const visibleCards = Array.from(this.cards).filter(card => card.style.display !== 'none');
    if (visibleCards.length === 0) {
      this.showNoResults();
    } else {
      this.hideNoResults();
    }
  }

  showNoResults() {
    let message = $('.no-results-message');
    if (!message) {
      message = document.createElement('div');
      message.className = 'no-results-message';
      message.innerHTML = '<p>Keine Immobilien gefunden. Versuchen Sie andere Suchbegriffe.</p>';
      $('.product-grid')?.appendChild(message);
    }
    message.style.display = 'block';
  }

  hideNoResults() {
    const message = $('.no-results-message');
    if (message) {
      message.style.display = 'none';
    }
  }
}

// === PERFORMANCE MONITOR ===
class PerformanceMonitor {
  constructor() {
    this.init();
  }

  init() {
    if ('PerformanceObserver' in window) {
      // Monitor long tasks
      const observer = new PerformanceObserver((list) => {
        for (const entry of list.getEntries()) {
          if (entry.duration > 50) {
            console.warn('Long task detected:', entry);
          }
        }
      });

      observer.observe({ entryTypes: ['longtask'] });
    }

    // Log page load time
    window.addEventListener('load', () => {
      const perfData = window.performance.timing;
      const pageLoadTime = perfData.loadEventEnd - perfData.navigationStart;
      console.log(`Page load time: ${pageLoadTime}ms`);
    });
  }
}

// === INITIALIZATION ===
class ImmoFlow {
  constructor() {
    this.modules = [];
    this.init();
  }

  init() {
    // Wait for DOM to be ready
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', () => this.initModules());
    } else {
      this.initModules();
    }
  }

  initModules() {
    try {
      // Initialize all modules
      this.modules.push(new Navigation());
      this.modules.push(new ScrollAnimations());
      this.modules.push(new AnimatedCounters());
      this.modules.push(new SupportForm());
      this.modules.push(new PropertyCards());
      this.modules.push(new ParallaxEffects());
      this.modules.push(new LazyLoader());
      this.modules.push(new ThemeSwitcher());
      this.modules.push(new PropertySearch());
      this.modules.push(new PerformanceMonitor());

      console.log('🏡 ImmoFlow initialized successfully');
    } catch (error) {
      console.error('ImmoFlow initialization error:', error);
    }
  }
}

// === START APPLICATION ===
const app = new ImmoFlow();

// === EXPOSE TO WINDOW ===
window.ImmoFlow = {
  config: CONFIG,
  app: app
};
