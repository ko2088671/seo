const PRODUCTS = [
  // Men's Shoes
  {
    id: 1,
    name: "KICKZ 未來跑鞋 V1",
    category: "men",
    price: 6800,
    image: "assets/北科大球鞋專賣店-未來跑鞋V1.svg",
    description: "Designed for the urban runner who demands style and speed. Features an advanced carbon fiber support plate, responsive responsive sole, and a futuristic neon-green knit pattern that breathes dynamically with every step.",
    features: ["Carbon Fiber Propulsion Plate", "Neon Mesh Knit Upper", "Ultra-Lightweight Air Cushioning", "Eco-friendly Recycled Outsole"],
    rating: 4.9,
    reviews: 189,
    sizes: [8, 8.5, 9, 9.5, 10, 10.5, 11, 12],
    isNew: true,
    isFeatured: true,
  },
  {
    id: 2,
    name: "KICKZ 高筒跑鞋",
    category: "men",
    price: 8200,
    image: "assets/北科大球鞋專賣店-高筒跑鞋.svg",
    description: "An elegant street fashion statement. Hand-crafted with premium matte black full-grain leather, deep burgundy suede highlights, and side-zipper entry for an ultra-premium aesthetic and comfort fit.",
    features: ["Full-Grain Matte Leather", "Premium Italian Suede Overlays", "YKK Side-Zipper Closure", "Cushioned OrthoLite Insole"],
    rating: 4.8,
    reviews: 94,
    sizes: [8, 9, 10, 11, 12],
    isNew: false,
    isFeatured: true
  },
  {
    id: 3,
    name: "KICKZ Orange 空氣力學",
    category: "men",
    price: 5900,
    image: "assets/北科大球鞋專賣店-Orange 空氣力學.svg",
    description: "Built for peak athletic performance. Outfitted with slate grey mesh overlays and a vibrant orange translucent air bubble sole that offers unmatched impact absorption and bounce.",
    features: ["Translucent Air Bubble Sole", "High-Ventilation Mesh Technology", "Reinforced Heel Stabilizer", "Non-Slip Rubber Traction"],
    rating: 4.7,
    reviews: 142,
    sizes: [8, 8.5, 9, 9.5, 10, 10.5, 11],
    isNew: false,
    isFeatured: false
  },
  {
    id: 4,
    name: "KICKZ 經典 Off-White 球鞋",
    category: "men",
    price: 4900,
    image: "assets/北科大球鞋專賣店-經典Off-White球鞋.svg",
    description: "A timeless silhouette re-imagined. Features an off-white leather body, vintage forest green heel tab, and a durable gum rubber outsole that matches effortlessly with any casual outfit.",
    features: ["Vintage Gum Outsole", "Soft Nappa Leather Upper", "Minimalist Gold Foil Branding", "Perforated Toe Box Ventilation"],
    rating: 4.6,
    reviews: 215,
    sizes: [7, 8, 8.5, 9, 9.5, 10, 10.5, 11, 12],
    isNew: false,
    isFeatured: false
  },

  // Women's Shoes
  {
    id: 5,
    name: "KICKZ Pastel Comfort Platform",
    category: "women",
    price: 5500,
    image: "assets/women_shoe_1.svg",
    description: "Elevation meets supreme comfort. A platform sneaker styling pastel pink and lavender overlays with a super-soft cloud sole designed for all-day wear.",
    features: ["Chunky Lightweight EVA Sole", "Double-Stitched Pastel Overlays", "Memory Foam Collar Linings", "Breathable Mesh Toe Panels"],
    rating: 4.9,
    reviews: 165,
    sizes: [5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5],
    isNew: false,
    isFeatured: true
  },
  {
    id: 6,
    name: "KICKZ Rose Gold Trainer Active",
    category: "women",
    price: 6200,
    image: "assets/women_shoe_2.svg",
    description: "Glow in and out of the gym. Boasts beautiful rose gold metallic details on a modern slip-on sock trainer design, providing snug ankle support and ultimate responsiveness.",
    features: ["Rose Gold Metallic TPU Cage", "Flexible Knit Sock Fit", "High-Rebound Foam Midsole", "Reflective Heel Pull Tabs"],
    rating: 4.8,
    reviews: 112,
    sizes: [5.5, 6, 6.5, 7, 7.5, 8, 8.5],
    isNew: true,
    isFeatured: true
  },
  {
    id: 7,
    name: "KICKZ Minimalist White Luxe",
    category: "women",
    price: 7500,
    image: "assets/women_shoe_3.svg",
    description: "Luxury in its simplest form. Premium white pebble leather paired with refined gold accents, perfect for upscale streetwear and everyday chic ensembles.",
    features: ["Premium Pebble Leather", "Polished Gold Lace Eyelets", "Low-Profile Cupsole Design", "Ultra-Soft Calfskin Lining"],
    rating: 4.5,
    reviews: 73,
    sizes: [5, 6, 7, 8, 9],
    isNew: false,
    isFeatured: false
  },
  {
    id: 8,
    name: "KICKZ Turquoise Knit Performance",
    category: "women",
    price: 5800,
    image: "assets/women_shoe_4.svg",
    description: "Bring energy to your workouts. Styled in turquoise and coral mesh, this ultra-lightweight shoe offers high flexibility and ergonomic support.",
    features: ["Ergonomic Arch Support", "Flexible Multi-Directional Grooves", "Ultra-Cool Mesh Ventilation", "Speed-Lacing Toggle System"],
    rating: 4.7,
    reviews: 104,
    sizes: [5.5, 6, 6.5, 7, 7.5, 8, 8.5],
    isNew: false,
    isFeatured: false
  },

  // Accessories
  {
    id: 9,
    name: "KICKZ Performance Cushioned Socks",
    category: "accessories",
    price: 600,
    image: "assets/accessory_1.svg",
    description: "Anti-blister, moisture-wicking compression socks featuring strategic underfoot cushioning to protect your feet during intense workouts or long city walks.",
    features: ["Moisture-Wicking CoolMax Fibers", "Targeted Arch Compression", "Reinforced Heel and Toe pockets", "Seamless Toe Closure"],
    rating: 4.8,
    reviews: 320,
    sizes: ["S", "M", "L"],
    isNew: false,
    isFeatured: false
  },
  {
    id: 10,
    name: "KICKZ Heavy-Duty Reflective Laces",
    category: "accessories",
    price: 450,
    image: "assets/accessory_2.svg",
    description: "Premium round sneaker laces woven with highly reflective 3M threads to ensure visibility during night runs and add an industrial vibe to your kicks.",
    features: ["3M Reflective Weaving", "Heavy-Duty Braided Core", "Branded Metal Aglets", "Includes 2 Length Options (120cm/140cm)"],
    rating: 4.6,
    reviews: 145,
    sizes: ["120cm", "140cm"],
    isNew: false,
    isFeatured: false
  },
  {
    id: 11,
    name: "KICKZ Urban Snapback Cap",
    category: "accessories",
    price: 1280,
    image: "assets/accessory_3.svg",
    description: "Classic snapback cap in deep violet, crafted with premium wool blend fabric and 3D embroidered KICKZ logo. Adjustable snapback ensures a perfect fit.",
    features: ["Premium Wool Blend Panels", "3D Raised Embroidery Logo", "Breathable Embroidered Eyelets", "Adjustable Plastic Snap Closure"],
    rating: 4.9,
    reviews: 98,
    sizes: ["One Size"],
    isNew: false,
    isFeatured: true
  },
  {
    id: 12,
    name: "KICKZ Waterproof Tech Utility Pack",
    category: "accessories",
    price: 3800,
    image: "assets/accessory_4.svg",
    description: "The ultimate sneakerhead daily backpack. Sleek waterproof shell with a dedicated bottom ventilated sneaker compartment to carry your favorite pair safely.",
    features: ["Waterproof Balistic Nylon", "Ventilated Shoe Compartment", "16-Inch Padded Laptop Sleeve", "Fidlock Magnetic Buckles"],
    rating: 5.0,
    reviews: 57,
    sizes: ["One Size"],
    isNew: true,
    isFeatured: true
  },

  // Others
  {
    id: 13,
    name: "KICKZ Ultimate Eco Shoe Care Kit",
    category: "others",
    price: 980,
    image: "assets/other_1.svg",
    description: "Keep your shoes looking brand new. Contains natural eco-friendly cleaning foam, a premium pig-bristle brush, and a soft microfiber towel in a neat travel bag.",
    features: ["98% Natural Biodegradable Solution", "Premium Wooden Handled Brush", "Microfiber Quick-Dry Towel", "Recycled EVA Travel Case"],
    rating: 4.9,
    reviews: 240,
    sizes: ["Standard Kit"],
    isNew: true,
    isFeatured: true
  },
  {
    id: 14,
    name: "KICKZ Carbon Fiber Orthotic Insoles",
    category: "others",
    price: 1800,
    image: "assets/other_2.svg",
    description: "Medical-grade arch support with a super lightweight carbon fiber stability shell. Transforms any sneaker into a health-promoting, ergonomic masterpiece.",
    features: ["Carbon Fiber Arch Arch Shell", "Shock-Absorbing Poron Pads", "Anti-Microbial Top Cover", "Trimmable for Custom Fit"],
    rating: 4.7,
    reviews: 82,
    sizes: ["S (5-7)", "M (8-10)", "L (11-13)"],
    isNew: false,
    isFeatured: false
  },
  {
    id: 15,
    name: "KICKZ UV Protective Acrylic Display Box",
    category: "others",
    price: 1200,
    image: "assets/other_3.svg",
    description: "Display your grail sneakers in style. High-clarity magnetic acrylic drop-front box featuring UV protection to prevent color fading and oxidation.",
    features: ["99% UV Resistant Acrylic", "Strong Magnetic Drop-Front Door", "Interlocking Stackable Design", "Extra Large Fits up to US 13 High-Tops"],
    rating: 4.9,
    reviews: 136,
    sizes: ["Single Pack", "3-Pack (+10%)"],
    isNew: false,
    isFeatured: false
  },
  {
    id: 16,
    name: "KICKZ Premium Cedar Shoe Tree",
    category: "others",
    price: 880,
    image: "assets/other_4.svg",
    description: "Preserve the shape and fresh scent of your leather shoes. Crafted from aromatic red cedar wood, absorbing moisture and neutralizing odor naturally.",
    features: ["100% Organic Red Cedar", "Adjustable Split-Toe Design", "Spring-Loaded Brass Tube Tension", "Naturally Deodorizing"],
    rating: 4.8,
    reviews: 119,
    sizes: ["S (US 6-8)", "M (US 9-11)", "L (US 12-14)"],
    isNew: false,
    isFeatured: false
  }
];

// Helper functions for site-wide use
function getProductById(id) {
  return PRODUCTS.find(p => p.id === parseInt(id));
}

function getProductsByCategory(category) {
  return PRODUCTS.filter(p => p.category === category);
}

function getFeaturedProducts() {
  return PRODUCTS.filter(p => p.isFeatured);
}

function getNewArrivals() {
  return PRODUCTS.filter(p => p.isNew);
}
