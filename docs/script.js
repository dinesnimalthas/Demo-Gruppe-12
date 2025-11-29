// ========================================
// TECHGEAR STORE - MAIN JAVASCRIPT
// ========================================

// === CONFIGURATION ===
// WICHTIG: GITHUB_PAT wird automatisch von GitHub Actions ersetzt
// Lokal läuft Demo-Modus (keine echten API Calls)
const CONFIG = {
  GITHUB_PAT: 'PLACEHOLDER_TOKEN', // Wird von GitHub Actions ersetzt
  REPO_OWNER: 'dinesnimalthas',
  REPO_NAME: 'Demo-Gruppe-12',
  DEMO_MODE: true // Lokal: true | Nach Deployment: false
};

// === SMOOTH SCROLLING ===
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    e.preventDefault();
    const target = document.querySelector(this.getAttribute('href'));
    if (target) {
      target.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  });
});

// === INTERSECTION OBSERVER FOR ANIMATIONS ===
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('fade-in-up');
      observer.unobserve(entry.target);
    }
  });
}, observerOptions);

// Observe all sections and cards
document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.section, .product-card, .trust-badge').forEach(el => {
    observer.observe(el);
  });
});

// === SHOPPING CART FUNCTIONALITY ===
let cartCount = 0;
const cartCountElement = document.querySelector('.cart-count');

function addToCart(button) {
  // Prevent form submission if button is in a form
  if (button.closest('form')) {
    return;
  }

  cartCount++;
  updateCartCount();

  // Visual feedback
  const originalHTML = button.innerHTML;
  button.innerHTML = '<i class="fas fa-check"></i> Hinzugefügt';
  button.style.background = '#22c55e';

  setTimeout(() => {
    button.innerHTML = originalHTML;
    button.style.background = '';
  }, 2000);
}

function updateCartCount() {
  if (cartCountElement) {
    cartCountElement.textContent = cartCount;
  }
}

// Add event listeners to all add-to-cart buttons
document.querySelectorAll('.product-button').forEach(button => {
  button.addEventListener('click', (e) => {
    e.preventDefault();
    addToCart(button);
  });
});

// === SUPPORT FORM HANDLING ===
const supportForm = document.getElementById('supportForm');
if (supportForm) {
  supportForm.addEventListener('submit', async function(e) {
    e.preventDefault();
    await handleSupportFormSubmission(e.target);
  });
}

async function handleSupportFormSubmission(form) {
  const submitButton = form.querySelector('button[type="submit"]');
  
  // Disable button and show loading state
  submitButton.disabled = true;
  const originalHTML = submitButton.innerHTML;
  submitButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Wird verarbeitet...';

  // Collect form data
  const formData = {
    userName: document.getElementById('userName').value,
    userEmail: document.getElementById('userEmail').value,
    issueType: document.getElementById('issueType').value,
    description: document.getElementById('issueDescription').value,
    isUrgent: document.getElementById('urgentCheckbox').checked
  };

  try {
    // Demo Mode: Simuliere Success ohne echten API Call
    if (CONFIG.DEMO_MODE || !CONFIG.GITHUB_PAT) {
      console.log('📋 Demo Mode: Simuliere Issue-Erstellung');
      console.log('Formulardaten:', formData);
      
      // Simuliere Verzögerung
      await new Promise(resolve => setTimeout(resolve, 1500));
      
      // Generiere Demo Ticket-Nummer
      const demoIssueNumber = Math.floor(Math.random() * 900) + 100;
      showSuccessMessage(demoIssueNumber);
      form.style.display = 'none';
      
      console.log('✅ Demo: Issue #' + demoIssueNumber + ' würde erstellt werden');
      console.log('ℹ️ Für echte GitHub-Integration: CONFIG.DEMO_MODE = false setzen und PAT eintragen');
      return;
    }
    
    // Echter API Call
    const issueNumber = await createGitHubIssue(formData);
    showSuccessMessage(issueNumber);
    form.style.display = 'none';
  } catch (error) {
    console.error('Fehler:', error);
    showAlert('error', `Es gab einen Fehler: ${error.message}`);
    submitButton.disabled = false;
    submitButton.innerHTML = originalHTML;
  }
}

async function createGitHubIssue(formData) {
  const title = `[${formData.issueType.toUpperCase()}] Support-Anfrage von ${formData.userName}`;
  const body = `**Anfrage von:** ${formData.userName} (${formData.userEmail})
**Priorität:** ${formData.isUrgent ? '🚨 DRINGEND' : 'Normal'}

**Problembeschreibung:**
${formData.description}

---
*Automatisch erstellt über TechGear Support-Formular*`;

  const labels = [formData.issueType];
  if (formData.isUrgent) {
    labels.push('critical', 'priority:high');
  }

  const response = await fetch(
    `https://api.github.com/repos/${CONFIG.REPO_OWNER}/${CONFIG.REPO_NAME}/issues`,
    {
      method: 'POST',
      headers: {
        'Authorization': `token ${CONFIG.GITHUB_PAT}`,
        'Accept': 'application/vnd.github.v3+json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ title, body, labels })
    }
  );

  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(errorData.message || 'GitHub API Fehler');
  }

  const issue = await response.json();
  console.log('✅ GitHub Issue erstellt:', issue.html_url);
  return issue.number;
}

function showSuccessMessage(issueNumber) {
  const successMessage = document.getElementById('successMessage');
  const ticketNumber = document.getElementById('ticketNumber');
  
  if (ticketNumber) {
    ticketNumber.textContent = `#${issueNumber}`;
  }
  
  if (successMessage) {
    successMessage.classList.remove('hidden');
    successMessage.classList.add('show');
    
    setTimeout(() => {
      successMessage.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }, 100);
  }
}

function showAlert(type, message) {
  // Simple alert for now - can be enhanced with custom modal
  alert(message);
}

// === PARALLAX EFFECT ===
let ticking = false;

function updateParallax() {
  const scrolled = window.pageYOffset;
  const hero = document.querySelector('.hero');
  
  if (hero && scrolled < window.innerHeight) {
    hero.style.transform = `translateY(${scrolled * 0.3}px)`;
  }
  
  ticking = false;
}

window.addEventListener('scroll', () => {
  if (!ticking) {
    window.requestAnimationFrame(updateParallax);
    ticking = true;
  }
});

// === NAVIGATION SCROLL EFFECT ===
let lastScroll = 0;
const nav = document.querySelector('.nav');

window.addEventListener('scroll', () => {
  const currentScroll = window.pageYOffset;
  
  if (currentScroll > 100) {
    nav.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.08)';
  } else {
    nav.style.boxShadow = 'none';
  }
  
  lastScroll = currentScroll;
});

// === SEARCH FUNCTIONALITY (PLACEHOLDER) ===
document.querySelectorAll('.nav-icon.fa-search').forEach(icon => {
  icon.addEventListener('click', () => {
    showAlert('info', 'Suchfunktion wird bald verfügbar sein.');
  });
});

// === WISHLIST FUNCTIONALITY (PLACEHOLDER) ===
document.querySelectorAll('.nav-icon.fa-heart').forEach(icon => {
  icon.addEventListener('click', () => {
    showAlert('info', 'Wunschliste wird bald verfügbar sein.');
  });
});

// === INITIALIZATION ===
console.log('🚀 TechGear Store initialisiert');
console.log('📦 Version: 2.0 - Apple-inspired Minimalist Design');
