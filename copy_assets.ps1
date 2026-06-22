$destDir = "C:\Users\Kye\Desktop\06211\assets"

# Ensure destination directory exists
if (-not (Test-Path $destDir)) {
    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
}

# Helper function to generate SVGs
function Generate-SVG ($name, $theme, $iconType, $title, $subtitle) {
    $gradientColors = ""
    $iconPath = ""

    switch ($theme) {
        "neon_green_black" {
            $gradientColors = '<stop offset="0%" stop-color="#10B981"/><stop offset="100%" stop-color="#020617"/>'
        }
        "black_burgundy" {
            $gradientColors = '<stop offset="0%" stop-color="#4B5563"/><stop offset="100%" stop-color="#450A0A"/>'
        }
        "orange_grey" {
            $gradientColors = '<stop offset="0%" stop-color="#F97316"/><stop offset="100%" stop-color="#374151"/>'
        }
        "offwhite_green" {
            $gradientColors = '<stop offset="0%" stop-color="#F3F4F6"/><stop offset="100%" stop-color="#064E3B"/>'
        }
        "pastel_pink" {
            $gradientColors = '<stop offset="0%" stop-color="#FBCFE8"/><stop offset="100%" stop-color="#C084FC"/>'
        }
        "rose_gold" {
            $gradientColors = '<stop offset="0%" stop-color="#F3A195"/><stop offset="100%" stop-color="#D47A75"/>'
        }
        "minimal_white" {
            $gradientColors = '<stop offset="0%" stop-color="#F9F9F9"/><stop offset="100%" stop-color="#D1D5DB"/>'
        }
        "turquoise_coral" {
            $gradientColors = '<stop offset="0%" stop-color="#14B8A6"/><stop offset="100%" stop-color="#F43F5E"/>'
        }
        "performance_socks" {
            $gradientColors = '<stop offset="0%" stop-color="#3B82F6"/><stop offset="100%" stop-color="#1E3A8A"/>'
        }
        "laces" {
            $gradientColors = '<stop offset="0%" stop-color="#FBBF24"/><stop offset="100%" stop-color="#D97706"/>'
        }
        "cap" {
            $gradientColors = '<stop offset="0%" stop-color="#8B5CF6"/><stop offset="100%" stop-color="#4C1D95"/>'
        }
        "backpack" {
            $gradientColors = '<stop offset="0%" stop-color="#6B7280"/><stop offset="100%" stop-color="#111827"/>'
        }
        "cleaning_kit" {
            $gradientColors = '<stop offset="0%" stop-color="#10B981"/><stop offset="100%" stop-color="#064E3B"/>'
        }
        "insoles" {
            $gradientColors = '<stop offset="0%" stop-color="#EF4444"/><stop offset="100%" stop-color="#7F1D1D"/>'
        }
        "display_box" {
            $gradientColors = '<stop offset="0%" stop-color="#06B6D4"/><stop offset="100%" stop-color="#0891B2"/>'
        }
        "shoe_tree" {
            $gradientColors = '<stop offset="0%" stop-color="#78350F"/><stop offset="100%" stop-color="#451A03"/>'
        }
        "logo_theme" {
            $gradientColors = '<stop offset="0%" stop-color="#1E1B4B"/><stop offset="100%" stop-color="#030712"/>'
        }
        default {
            $gradientColors = '<stop offset="0%" stop-color="#4F46E5"/><stop offset="100%" stop-color="#312E81"/>'
        }
    }

    if ($iconType -eq "sneaker") {
        $iconPath = @'
      <!-- Sneaker Silhouette -->
      <path d="M120,240 C140,240 180,245 200,220 C220,195 240,140 260,130 C270,125 300,145 320,175 C340,205 380,210 400,210 C420,210 440,225 450,240 L450,265 C450,270 440,275 420,275 L120,275 Z" fill="#ffffff" fill-opacity="0.85" filter="url(#shadow)"/>
      <path d="M120,265 L450,265 L445,280 C445,283 440,285 435,285 L135,285 C125,285 120,280 120,275 Z" fill="#ffffff" fill-opacity="0.95"/>
      <path d="M280,140 L300,165 M265,155 L285,180 M250,170 L270,195" stroke="#ffffff" stroke-width="4" stroke-linecap="round" stroke-opacity="0.6"/>
'@
    } elseif ($iconType -eq "socks") {
        $iconPath = @'
      <!-- Socks Silhouette -->
      <path d="M220,120 L270,120 C275,120 280,125 280,130 L280,230 L340,280 C345,284 345,290 340,295 L310,320 C300,328 285,325 275,315 L215,250 C210,245 210,238 215,233 L215,130 C215,125 218,120 220,120 Z" fill="#ffffff" fill-opacity="0.85" filter="url(#shadow)"/>
      <path d="M220,120 L270,120 L270,135 L220,135 Z" fill="#ffffff" fill-opacity="0.5"/>
'@
    } elseif ($iconType -eq "laces") {
        $iconPath = @'
      <!-- Laces/Spiral -->
      <path d="M150,280 Q200,150 250,280 T350,280 T450,280" fill="none" stroke="#ffffff" stroke-width="12" stroke-linecap="round" stroke-opacity="0.8" filter="url(#shadow)"/>
      <path d="M150,290 Q200,160 250,290 T350,290 T450,290" fill="none" stroke="#ffffff" stroke-width="4" stroke-linecap="round" stroke-opacity="0.4"/>
'@
    } elseif ($iconType -eq "cap") {
        $iconPath = @'
      <!-- Cap Silhouette -->
      <path d="M200,260 C200,180 270,150 350,150 C400,150 430,170 440,200 L445,235 C420,235 320,240 280,260 Z" fill="#ffffff" fill-opacity="0.85" filter="url(#shadow)"/>
      <path d="M270,262 C340,240 440,245 470,255 C480,258 485,268 475,273 C450,285 390,290 330,290 C290,290 270,280 270,262 Z" fill="#ffffff" fill-opacity="0.95"/>
'@
    } elseif ($iconType -eq "backpack") {
        $iconPath = @'
      <!-- Backpack Silhouette -->
      <rect x="220" y="140" width="160" height="200" rx="40" fill="#ffffff" fill-opacity="0.85" filter="url(#shadow)"/>
      <rect x="240" y="240" width="120" height="90" rx="15" fill="#ffffff" fill-opacity="0.4"/>
      <path d="M270,140 L270,110 C270,105 330,105 330,110 L330,140" fill="none" stroke="#ffffff" stroke-width="8" stroke-linecap="round"/>
'@
    } elseif ($iconType -eq "cleaning_kit") {
        $iconPath = @'
      <!-- Spray Bottle & Brush -->
      <rect x="210" y="160" width="70" height="170" rx="10" fill="#ffffff" fill-opacity="0.85" filter="url(#shadow)"/>
      <path d="M230,160 L230,130 L210,140 L210,120 L270,120 L270,140 L250,130 L250,160 Z" fill="#ffffff" fill-opacity="0.95"/>
      <rect x="300" y="200" width="90" height="50" rx="8" fill="#ffffff" fill-opacity="0.6" filter="url(#shadow)"/>
      <rect x="300" y="250" width="90" height="30" fill="#ffffff" fill-opacity="0.9"/>
'@
    } elseif ($iconType -eq "insoles") {
        $iconPath = @'
      <!-- Insoles Silhouette -->
      <path d="M230,120 C255,120 280,150 280,220 C280,260 260,290 270,320 C272,325 260,335 240,335 C220,335 208,325 210,320 C220,290 200,260 200,220 C200,150 205,120 230,120 Z" fill="#ffffff" fill-opacity="0.85" filter="url(#shadow)"/>
      <path d="M230,135 C245,135 265,160 265,220 C265,250 250,280 255,305 C255,310 248,318 238,318 C228,318 225,310 225,305 C230,280 215,250 215,220 C215,160 215,135 230,135 Z" fill="#ffffff" fill-opacity="0.4"/>
'@
    } elseif ($iconType -eq "display_box") {
        $iconPath = @'
      <!-- Transparent Display Box -->
      <polygon points="200,180 300,130 400,180 400,300 300,350 200,300" fill="#ffffff" fill-opacity="0.3" stroke="#ffffff" stroke-width="4" filter="url(#shadow)"/>
      <polygon points="200,180 300,230 400,180" fill="none" stroke="#ffffff" stroke-width="3" stroke-dasharray="5,5"/>
      <line x1="300" y1="230" x2="300" y2="350" stroke="#ffffff" stroke-width="3" stroke-dasharray="5,5"/>
'@
    } elseif ($iconType -eq "shoe_tree") {
        $iconPath = @'
      <!-- Shoe Tree -->
      <path d="M180,240 C190,220 210,180 250,180 C270,180 290,200 300,220 C310,240 330,250 350,250 L380,250 L380,270 L180,270 Z" fill="#ffffff" fill-opacity="0.85" filter="url(#shadow)"/>
      <rect x="380" y="253" width="60" height="14" rx="7" fill="#ffffff" fill-opacity="0.6"/>
      <circle cx="430" cy="260" r="15" fill="#ffffff" fill-opacity="0.9"/>
'@
    } elseif ($iconType -eq "logo") {
        $iconPath = @'
      <!-- Logo Brand Icon -->
      <g filter="url(#shadow)">
        <path d="M160,200 C180,200 230,205 250,180 C270,155 290,110 310,100 C320,95 340,115 360,145 C380,175 420,180 440,180 C460,180 480,195 490,210 L490,235 C490,240 480,245 460,245 L160,245 Z" fill="none" stroke="#d4af37" stroke-width="6" stroke-linecap="round"/>
        <text x="325" y="320" font-family="'Outfit', 'Inter', sans-serif" font-weight="900" font-size="64" fill="#ffffff" text-anchor="middle" letter-spacing="4">KICKZ</text>
        <text x="325" y="360" font-family="'Outfit', 'Inter', sans-serif" font-weight="500" font-size="16" fill="#d4af37" text-anchor="middle" letter-spacing="8">LUXURY SNEAKERS</text>
      </g>
'@
    }

    if ($iconType -eq "logo") {
        $svgContent = @"
<?xml version="1.0" encoding="UTF-8"?>
<svg width="650" height="450" viewBox="0 0 650 450" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="100%">
      $gradientColors
    </linearGradient>
    <filter id="shadow" x="-10%" y="-10%" width="120%" height="120%">
      <feDropShadow dx="0" dy="15" stdDeviation="15" flood-color="#000000" flood-opacity="0.4"/>
    </filter>
  </defs>
  <rect width="650" height="450" rx="24" fill="url(#grad)"/>
  $iconPath
</svg>
"@
    } else {
        $svgContent = @"
<?xml version="1.0" encoding="UTF-8"?>
<svg width="600" height="450" viewBox="0 0 600 450" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="100%">
      $gradientColors
    </linearGradient>
    <filter id="shadow" x="-10%" y="-10%" width="120%" height="120%">
      <feDropShadow dx="0" dy="15" stdDeviation="15" flood-color="#000000" flood-opacity="0.25"/>
    </filter>
  </defs>
  
  <!-- Gradient Background -->
  <rect width="600" height="450" rx="24" fill="url(#grad)"/>
  
  <!-- Subtle Grid overlay -->
  <path d="M 0,50 L 600,50 M 0,100 L 600,100 M 0,150 L 600,150 M 0,200 L 600,200 M 0,250 L 600,250 M 0,300 L 600,300 M 0,350 L 600,350 M 0,400 L 600,400" stroke="#ffffff" stroke-width="1" stroke-opacity="0.05"/>
  <path d="M 100,0 L 100,450 M 200,0 L 200,450 M 300,0 L 300,450 M 400,0 L 400,450 M 500,0 L 500,450" stroke="#ffffff" stroke-width="1" stroke-opacity="0.05"/>
  
  <!-- Main Icon Graphic -->
  $iconPath
  
  <!-- Tech Branding Overlay -->
  <text x="40" y="380" font-family="'Outfit', 'Inter', sans-serif" font-weight="800" font-size="28" fill="#ffffff" fill-opacity="0.95">$title</text>
  <text x="40" y="410" font-family="'Outfit', 'Inter', sans-serif" font-weight="500" font-size="16" fill="#ffffff" fill-opacity="0.7" letter-spacing="2">$($subtitle.ToUpper())</text>
  
  <!-- Watermark logo -->
  <text x="520" y="50" font-family="'Outfit', 'Inter', sans-serif" font-weight="900" font-size="18" fill="#ffffff" fill-opacity="0.3" text-anchor="end">KICKZ LAB</text>
  
  <!-- Top decorative badge -->
  <rect x="40" y="35" width="80" height="24" rx="12" fill="#ffffff" fill-opacity="0.2"/>
  <text x="80" y="51" font-family="'Outfit', 'Inter', sans-serif" font-weight="700" font-size="11" fill="#ffffff" fill-opacity="0.9" text-anchor="middle">PREMIUM</text>
</svg>
"@
    }

    $destPath = Join-Path $destDir $name
    [System.IO.File]::WriteAllText($destPath, $svgContent)
    Write-Host "Generated SVG: $name"
}

# Generate Logo
Generate-SVG "logo.svg" "logo_theme" "logo" "KICKZ" "Luxury Sneakers"

# Generate Men Shoes
Generate-SVG "men_shoe_1.svg" "neon_green_black" "sneaker" "Futuristic Runner" "Men Performance Series"
Generate-SVG "men_shoe_2.svg" "black_burgundy" "sneaker" "Matte Black High-Top" "Men Luxury Casual"
Generate-SVG "men_shoe_3.svg" "orange_grey" "sneaker" "Orange Air Runner" "Men Athletic Performance"
Generate-SVG "men_shoe_4.svg" "offwhite_green" "sneaker" "Classic Court" "Men Retro Heritage"

# Generate Women Shoes
Generate-SVG "women_shoe_1.svg" "pastel_pink" "sneaker" "Pastel Platform" "Women Comfort Series"
Generate-SVG "women_shoe_2.svg" "rose_gold" "sneaker" "Rose Gold Trainer" "Women Running Series"
Generate-SVG "women_shoe_3.svg" "minimal_white" "sneaker" "Minimalist White" "Luxury Casual Series"
Generate-SVG "women_shoe_4.svg" "turquoise_coral" "sneaker" "Turquoise Knit Runner" "Performance Athletic"

# Generate Accessories
Generate-SVG "accessory_1.svg" "performance_socks" "socks" "Performance Socks" "Knit Cushioned"
Generate-SVG "accessory_2.svg" "laces" "laces" "Reflective Laces" "Heavy Duty Round"
Generate-SVG "accessory_3.svg" "cap" "cap" "Streetwear Cap" "Urban Snapback"
Generate-SVG "accessory_4.svg" "backpack" "backpack" "Tech Utility Pack" "Waterproof Daily"

# Generate Others
Generate-SVG "other_1.svg" "cleaning_kit" "cleaning_kit" "Ultimate Cleaner Kit" "Eco Shoe Wash & Brush"
Generate-SVG "other_2.svg" "insoles" "insoles" "Orthotic Insoles" "Carbon Fiber Support"
Generate-SVG "other_3.svg" "display_box" "display_box" "Acrylic Display Box" "UV Protective Cases"
Generate-SVG "other_4.svg" "shoe_tree" "shoe_tree" "Cedar Shoe Tree" "Premium Deodorizer"

Write-Host "All assets generated successfully as high-resolution SVGs."
