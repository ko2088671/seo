// Shared application logic for KICKZ sneaker store

// 1. Cart Management State
let cart = JSON.parse(localStorage.getItem('kickz_cart')) || [];

// Initialize application on DOM load
document.addEventListener('DOMContentLoaded', () => {
  setupCartDrawer();
  updateCartBadge();
  setupThemeToggle();
  renderCart();
  
  // Expose global functions to window
  window.addToCart = addToCart;
  window.updateCartQuantity = updateCartQuantity;
  window.removeFromCart = removeFromCart;
  window.showToast = showToast;
  window.toggleCart = toggleCart;
});

// 2. Open/Close Cart Drawer
function setupCartDrawer() {
  const cartBtn = document.getElementById('cart-btn');
  const closeBtn = document.getElementById('cart-close');
  const overlay = document.getElementById('cart-overlay');
  
  if (cartBtn) {
    cartBtn.addEventListener('click', (e) => {
      e.preventDefault();
      toggleCart(true);
    });
  }
  
  if (closeBtn) {
    closeBtn.addEventListener('click', () => toggleCart(false));
  }
  
  if (overlay) {
    overlay.addEventListener('click', () => toggleCart(false));
  }
}

function toggleCart(open = true) {
  const drawer = document.getElementById('cart-drawer');
  const overlay = document.getElementById('cart-overlay');
  
  if (drawer && overlay) {
    if (open) {
      drawer.classList.add('open');
      overlay.classList.add('open');
      renderCart();
    } else {
      drawer.classList.remove('open');
      overlay.classList.remove('open');
    }
  }
}

// 3. Add item to cart
function addToCart(productId, size = null) {
  const product = PRODUCTS.find(p => p.id === parseInt(productId));
  if (!product) return;
  
  // If no size selected, default to the first available size or ask user to select
  const finalSize = size || (product.sizes && product.sizes[0]);
  
  const existingItem = cart.find(item => item.id === product.id && item.size === finalSize);
  
  if (existingItem) {
    existingItem.quantity += 1;
  } else {
    cart.push({
      id: product.id,
      name: product.name,
      price: product.price,
      image: product.image,
      size: finalSize,
      quantity: 1
    });
  }
  
  saveCart();
  updateCartBadge();
  renderCart();
  showToast(`已將 ${product.name} (尺寸: ${finalSize}) 加入購物車！`);
  toggleCart(true); // Auto-open cart to show progress
}

// 4. Update quantity
function updateCartQuantity(productId, size, change) {
  const item = cart.find(item => item.id === parseInt(productId) && item.size == size);
  if (!item) return;
  
  item.quantity += change;
  if (item.quantity <= 0) {
    removeFromCart(productId, size);
  } else {
    saveCart();
    updateCartBadge();
    renderCart();
  }
}

// 5. Remove item
function removeFromCart(productId, size) {
  cart = cart.filter(item => !(item.id === parseInt(productId) && item.size == size));
  saveCart();
  updateCartBadge();
  renderCart();
  showToast("商品已從購物車移除。");
}

// 6. Save Cart to LocalStorage
function saveCart() {
  localStorage.setItem('kickz_cart', JSON.stringify(cart));
}

// 7. Update Cart Badge Count
function updateCartBadge() {
  const badge = document.getElementById('cart-badge');
  if (badge) {
    const totalCount = cart.reduce((sum, item) => sum + item.quantity, 0);
    badge.textContent = totalCount;
    badge.style.display = totalCount > 0 ? 'block' : 'none';
  }
}

// 8. Render Cart Drawer Contents
function renderCart() {
  const cartContainer = document.getElementById('cart-items-container');
  const cartTotal = document.getElementById('cart-total-price');
  
  if (!cartContainer) return;
  
  if (cart.length === 0) {
    cartContainer.innerHTML = `
      <div style="text-align: center; color: var(--text-muted); padding: 40px 0;">
        <svg style="width: 48px; height: 48px; margin-bottom: 16px; opacity: 0.5;" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
        <p>購物車空空如也</p>
      </div>
    `;
    if (cartTotal) cartTotal.textContent = "NT$ 0";
    return;
  }
  
  let html = '';
  let subtotal = 0;
  
  cart.forEach(item => {
    const itemTotal = item.price * item.quantity;
    subtotal += itemTotal;
    
    html += `
      <div class="cart-item">
        <div class="cart-item-img">
          <img src="${item.image}" alt="${item.name}">
        </div>
        <div class="cart-item-info">
          <div class="cart-item-name">${item.name}</div>
          <div class="cart-item-meta">尺寸: ${item.size}</div>
          <div class="cart-item-price">NT$ ${item.price.toLocaleString()}</div>
          <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
            <div class="cart-item-qty">
              <button class="qty-btn" onclick="updateCartQuantity(${item.id}, '${item.size}', -1)">-</button>
              <span style="font-weight: 600; font-size: 14px;">${item.quantity}</span>
              <button class="qty-btn" onclick="updateCartQuantity(${item.id}, '${item.size}', 1)">+</button>
            </div>
            <button onclick="removeFromCart(${item.id}, '${item.size}')" style="color: var(--accent-pink); font-size: 13px; font-weight: 500;">移除</button>
          </div>
        </div>
      </div>
    `;
  });
  
  cartContainer.innerHTML = html;
  if (cartTotal) {
    cartTotal.textContent = `NT$ ${subtotal.toLocaleString()}`;
  }
}

// 9. Toast Notification System
function showToast(message) {
  let container = document.getElementById('toast-container');
  if (!container) {
    container = document.createElement('div');
    container.id = 'toast-container';
    container.className = 'toast-container';
    document.body.appendChild(container);
  }
  
  const toast = document.createElement('div');
  toast.className = 'toast';
  toast.innerHTML = `
    <svg style="width: 20px; height: 20px; color: var(--primary);" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
    <span>${message}</span>
  `;
  
  container.appendChild(toast);
  
  // Remove toast after 3s
  setTimeout(() => {
    toast.style.animation = 'slideIn 0.3s reverse forwards';
    setTimeout(() => {
      toast.remove();
    }, 300);
  }, 3000);
}

// 10. Light/Dark Theme setup
function setupThemeToggle() {
  const toggleBtn = document.getElementById('theme-toggle');
  if (!toggleBtn) return;
  
  // Set initial state
  const isLight = localStorage.getItem('kickz_light_theme') === 'true';
  if (isLight) {
    document.body.classList.add('light-theme');
  }
  
  toggleBtn.addEventListener('click', (e) => {
    e.preventDefault();
    const current = document.body.classList.toggle('light-theme');
    localStorage.setItem('kickz_light_theme', current);
    showToast(current ? "已切換至明亮模式" : "已切換至極客暗黑模式");
  });
}
