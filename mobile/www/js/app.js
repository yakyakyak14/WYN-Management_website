// WYN Management Mobile App JavaScript
document.addEventListener('deviceready', onDeviceReady, false);

function onDeviceReady() {
    console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
    
    // Hide loading screen and show app
    setTimeout(() => {
        document.getElementById('appLoading').classList.add('hidden');
        document.getElementById('appContainer').style.display = 'block';
        loadWebsiteContent();
    }, 2000);
    
    // Handle back button for Android
    document.addEventListener("backbutton", onBackKeyDown, false);
    
    // Handle pause/resume events
    document.addEventListener("pause", onPause, false);
    document.addEventListener("resume", onResume, false);
    
    // Handle network events
    document.addEventListener("offline", onOffline, false);
    document.addEventListener("online", onOnline, false);
}

function loadWebsiteContent() {
    const contentWrapper = document.getElementById('contentWrapper');
    
    // Load the main website content
    fetch('../index.html')
        .then(response => response.text())
        .then(html => {
            // Extract body content from the website
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');
            const bodyContent = doc.body.innerHTML;
            
            // Inject the content
            contentWrapper.innerHTML = bodyContent;
            
            // Initialize website functionality
            initializeWebsiteFeatures();
        })
        .catch(error => {
            console.error('Error loading website content:', error);
            loadFallbackContent();
        });
}

function loadFallbackContent() {
    const contentWrapper = document.getElementById('contentWrapper');
    contentWrapper.innerHTML = `
        <div style="padding: 20px; text-align: center; color: white;">
            <h1 style="color: #ffffff; margin-bottom: 20px;">WYN Management</h1>
            <h2 style="color: #cccccc; margin-bottom: 30px;">Elite Talent Management</h2>
            <p style="color: #cccccc; margin-bottom: 20px;">Scouting • Refining • Managing • Branding • Publicity</p>
            
            <div style="margin: 30px 0;">
                <h3 style="color: #ffffff;">Our Talents</h3>
                <div style="margin: 20px 0;">
                    <h4 style="color: #ffffff;">Jacob Njoku</h4>
                    <p style="color: #cccccc;">Professional Footballer - Kasuka FC</p>
                </div>
                <div style="margin: 20px 0;">
                    <h4 style="color: #ffffff;">Oscar Onyeka</h4>
                    <p style="color: #cccccc;">Rising Football Star - Kasuka FC</p>
                </div>
            </div>
            
            <div style="margin: 30px 0;">
                <h3 style="color: #ffffff;">Contact</h3>
                <p style="color: #cccccc;">Get in touch for talent management services</p>
            </div>
        </div>
    `;
}

function initializeWebsiteFeatures() {
    // Initialize menu functionality
    const menuToggle = document.querySelector('.menu-toggle');
    const sideMenu = document.querySelector('.side-menu');
    const menuOverlay = document.querySelector('.menu-overlay');
    
    if (menuToggle && sideMenu) {
        menuToggle.addEventListener('click', () => {
            sideMenu.classList.toggle('show');
            menuOverlay.classList.toggle('show');
        });
        
        menuOverlay.addEventListener('click', () => {
            sideMenu.classList.remove('show');
            menuOverlay.classList.remove('show');
        });
    }
    
    // Initialize updates slider
    initializeUpdatesSlider();
    
    // Add touch feedback for mobile
    addTouchFeedback();
}

function initializeUpdatesSlider() {
    const slider = document.getElementById('updatesSlider');
    if (!slider) return;
    
    const slides = Array.from(slider.querySelectorAll('.updates-slide'));
    const bullets = document.getElementById('updatesBullets');
    let idx = 0;
    
    // Create bullets
    if (bullets) {
        bullets.innerHTML = '';
        slides.forEach((_, i) => {
            const bullet = document.createElement('div');
            bullet.className = 'updates-bullet' + (i === 0 ? ' active' : '');
            bullet.addEventListener('click', () => goToSlide(i));
            bullets.appendChild(bullet);
        });
    }
    
    function goToSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.toggle('active', i === index);
        });
        
        const bulletElements = bullets.querySelectorAll('.updates-bullet');
        bulletElements.forEach((bullet, i) => {
            bullet.classList.toggle('active', i === index);
        });
        
        idx = index;
    }
    
    function nextSlide() {
        idx = (idx + 1) % slides.length;
        goToSlide(idx);
    }
    
    // Auto-rotate every 10 seconds
    setInterval(nextSlide, 10000);
}

function addTouchFeedback() {
    const touchElements = document.querySelectorAll('.talent-card, .nav-option, .menu-toggle, .contact-item');
    
    touchElements.forEach(element => {
        element.addEventListener('touchstart', function() {
            this.style.transform = 'scale(0.95)';
        });
        
        element.addEventListener('touchend', function() {
            this.style.transform = '';
        });
    });
}

function onBackKeyDown() {
    // Handle back button - you can customize this behavior
    if (confirm('Exit WYN Management?')) {
        navigator.app.exitApp();
    }
}

function onPause() {
    console.log('App paused');
}

function onResume() {
    console.log('App resumed');
}

function onOffline() {
    console.log('App is offline');
    showNetworkStatus('You are currently offline');
}

function onOnline() {
    console.log('App is online');
    showNetworkStatus('Connection restored');
}

function showNetworkStatus(message) {
    const statusDiv = document.createElement('div');
    statusDiv.style.cssText = `
        position: fixed;
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        background: rgba(0, 0, 0, 0.8);
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        z-index: 10000;
        font-size: 14px;
    `;
    statusDiv.textContent = message;
    document.body.appendChild(statusDiv);
    
    setTimeout(() => {
        document.body.removeChild(statusDiv);
    }, 3000);
}
