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

function New-AIGuideTree {
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
            New-AIGuideTree -tree $tree[$key] -base $folder
        } else {
            $pageFile = "$folder/page.tsx"
            if (!(Test-Path $pageFile)) {
                New-Item -Path $pageFile -ItemType File | Out-Null
            }
        }
    }
}

$aiGuideTree = @{
    "Yapay Zeka Rehberi (AI Guide)" = @{
        "ai_nedir" = $true
        "temel_kavramlar" = @{
            "makine_ogrenmesi" = $true
            "dogal_dil_isleme" = $true
            "gorsel_ai" = $true
            "veri_ve_etigi" = $true
        }
        "populer_ai_araclari" = @{
            "chatgpt" = $true
            "claude" = $true
            "copilot" = $true
            "midjourney" = $true
            "dalle" = $true
            "gemini" = $true
            "runway" = $true
            "notion_ai" = $true
            "chatbotlar" = $true
            "sesli_ai" = $true
        }
        "ai_ile_gunluk_hayat" = @{
            "giris_seviyesi_kullanimlar" = $true
            "soru_cevap" = $true
            "metin_yazdirma" = $true
            "ozetleme_ve_ceviri" = $true
            "planlama_ve_takvim" = $true
            "gorsel_uretim" = $true
            "sesli_komutlar" = $true
        }
        "ileri_duzey_ai" = @{
            "prompt_muhendisligi" = $true
            "otomasyon_senaryolari" = $true
            "programlama_ve_ai" = $true
            "veri_analizi" = $true
            "ai_ile_uygulama_gelistirme" = $true
        }
        "ornekk_promtlar" = @{
            "gundelik_hayat" = $true
            "egitim" = $true
            "is_hayati" = $true
            "teknoloji" = $true
            "sanat" = $true
            "saglik" = $true
            "yaratici_yazma" = $true
            "cocuklar_icin" = $true
        }
        "ai_guvenlik_ve_etkiler" = @{
            "etik_kullanim" = $true
            "guvenlik_onlemleri" = $true
            "ai_ve_gelecek" = $true
        }
        "sss_yardim_ve_topluluk" = @{
            "sikca_sorulan_sorular" = $true
            "kullanim_icin_ipuclar" = $true
            "kaynaklar" = $true
            "topluluklar" = $true
        }
    }
}

$root = "yapay_zeka_rehberi_ai_guide"
if (!(Test-Path $root)) { New-Item -Path $root -ItemType Directory | Out-Null }
New-AIGuideTree -tree $aiGuideTree -base $root

Write-Host "Yapay Zeka Rehberi (AI Guide) klasör yapısı ve içerikleri oluşturuldu!"