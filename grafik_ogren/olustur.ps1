function Remove-TurkishChars {
    param([string]$text)
    $dict = @{
        'ç' = 'c'; 'ğ' = 'g'; 'ı' = 'i'; 'ö' = 'o'; 'ş' = 's'; 'ü' = 'u';
        'Ç' = 'C'; 'Ğ' = 'G'; 'İ' = 'I'; 'Ö' = 'O'; 'Ş' = 'S'; 'Ü' = 'U'
    }
    foreach ($pair in $dict.GetEnumerator()) {
        $text = $text -replace [regex]::Escape($pair.Key), $pair.Value
    }
    $text = $text -replace '[^A-Za-z0-9]', '_'
    $text = $text -replace '_+', '_'
    $text = $text.Trim('_').ToLower()
    return $text
}

function New-GraphicDesignTree {
    param (
        [hashtable]$tree,
        [string]$base = ""
    )
    foreach ($key in $tree.Keys) {
        $folderName = Remove-TurkishChars $key
        $folder = if ($base -eq "") { $folderName } else { "$base/$folderName" }
        if (!(Test-Path $folder)) {
            New-Item -Path $folder -ItemType Directory -Force | Out-Null
        }
        if ($tree[$key] -is [hashtable]) {
            New-GraphicDesignTree -tree $tree[$key] -base $folder
        } else {
            $pageFile = "$folder/page.tsx"
            if (!(Test-Path $pageFile)) {
                New-Item -Path $pageFile -ItemType File | Out-Null
            }
        }
    }
}

$graphicDesignTree = @{
    "Grafik Ogren" = @{
        "grafik_tasarim_temelleri" = $true
        "dosya_turleri" = @{
            "vektor_svg" = $true
            "png_nedir" = $true
            "jpg_jpeg" = $true
            "gif_webp" = $true
            "psd_ai_eps" = $true
        }
        "adobe_illustrator_ai" = @{
            "ai_kullanimi" = $true
            "vektor_calismalar" = $true
            "logo_tasarimi" = $true
        }
        "photoshop" = @{
            "photoshop_kullanimi" = $true
            "katmanlar" = $true
            "retus_ve_montaj" = $true
            "png_ciktisi" = $true
        }
        "ucretsiz_gorsel_indirme" = @{
            "unsplash" = $true
            "pixabay" = $true
            "pexels" = $true
            "freepik" = $true
            "shutterstock" = $true
            "gorsel_indirme_tablosu" = $true
        }
        "ai_gorsel_uretim" = @{
            "tensor_art" = $true
            "dalle" = $true
            "midjourney" = $true
            "freepik_ai" = $true
            "canva_magic" = $true
            "adobe_firefly" = $true
            "ai_gorsel_karsilastirma" = $true
        }
        "ucretsizlik_bilgileri" = $true
        "kaynaklar_ve_iletisim" = $true
    }
}

$root = "grafik_ogren"
if (!(Test-Path $root)) { New-Item -Path $root -ItemType Directory | Out-Null }
New-GraphicDesignTree -tree $graphicDesignTree -base $root

Write-Host "Grafik Ogren klasör yapısı ve içerikleri oluşturuldu!"