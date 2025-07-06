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

function New-CategoryTree {
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
            New-CategoryTree -tree $tree[$key] -base $folder
        } else {
            $pageFile = "$folder/page.tsx"
            if (!(Test-Path $pageFile)) {
                New-Item -Path $pageFile -ItemType File | Out-Null
            }
        }
    }
}

$categoryTree = @{
    "Saglik_Yasam" = @{
        "genel_saglik_bilgisi" = $true
        "hastaliklar_ve_tedavi" = $true
        "ilk_yardim_ve_acil" = $true
        "spor_ve_egzersiz" = @{
            "evde_egzersiz" = $true
            "fitness" = $true
            "yuruyus_ve_kardiyo" = $true
            "yoga_pilates" = $true
            "cocuklar_icin_spor" = $true
        }
        "beslenme" = @{
            "dengeli_beslenme" = $true
            "diyetler" = $true
            "super_besinler" = $true
            "vitaminler_mineraller" = $true
            "zayiflama" = $true
            "vejetaryen_vegan" = $true
            "yemek_tarifleri" = $true
        }
        "psikoloji_ve_ruhsal_saglik" = @{
            "stres_ve_kaygi" = $true
            "mutluluk_ve_motivasyon" = $true
            "uyku_ve_dinlenme" = $true
            "psikolojik_hastaliklar" = $true
            "meditasyon" = $true
        }
        "gunluk_yasam_tuyolari" = $true
        "anne_bebek_cocuk_sagligi" = $true
        "yaslilar_icin_saglik" = $true
        "teknoloji_ve_saglik" = $true
        "ai_saglik_asistani" = $true
    }
    "Kisisel_Gelisim" = @{
        "motivasyon" = $true
        "verimlilik_zaman_yonetimi" = $true
        "hedef_koyma" = $true
        "okuma_ve_ogrenme_teknikleri" = $true
        "not_alma_hafiza" = $true
        "kisisel_finans" = $true
        "kariyer_planlama" = $true
        "egitim_ve_sertifikalar" = $true
        "psikoloji_ve_ozguven" = $true
        "iletişim_becerileri" = $true
        "liderlik" = $true
        "problem_cozme" = $true
        "yaraticilik" = $true
        "giriskenlik" = $true
        "topluluk_onunde_konusma" = $true
        "ai_kisisel_gelisim_koçu" = $true
    }
    "Online_Gelir" = @{
        "evden_para_kazanma" = @{
            "freelance_isler" = $true
            "anket_ve_mikro_isler" = $true
            "el_yapimi_urunler" = $true
            "sosyal_medya_kazanci" = $true
            "blog_youtube" = $true
        }
        "yatirim" = @{
            "hisse_senedi_borsa" = $true
            "kripto_para" = $true
            "altin_doviz" = $true
            "emlak" = $true
        }
        "girişimcilik" = @{
            "startup_kurmak" = $true
            "is_fikirleri" = $true
            "pazarlama" = $true
            "finansman" = $true
            "ai_is_fikri_uretici" = $true
        }
        "pasif_gelir_fikirleri" = $true
        "yeni_trendler" = $true
        "ai_gelir_asistani" = $true
    }
}

New-CategoryTree -tree $categoryTree

Write-Host "Sağlık & Yaşam, Kişisel Gelişim ve Online Gelir için kapsamlı klasör yapısı oluşturuldu!"