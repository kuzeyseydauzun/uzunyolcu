function Remove-TurkishChars {
    param([string]$text)
    $dict = @{
        'ç' = 'c'; 'ğ' = 'g'; 'ı' = 'i'; 'ö' = 'o'; 'ş' = 's'; 'ü' = 'u';
        'Ç' = 'C'; 'Ğ' = 'G'; 'İ' = 'I'; 'Ö' = 'O'; 'Ş' = 'S'; 'Ü' = 'U'
    }
    foreach ($pair in $dict.GetEnumerator()) {
        $text = $text -replace [regex]::Escape($pair.Key), $pair.Value
    }
    # boşluk, parantez, vs -> alt tire
    $text = $text -replace '[^A-Za-z0-9]', '_'
    $text = $text -replace '_+', '_'
    $text = $text.Trim('_').ToLower()
    return $text
}

function New-EnglishAcademyTree {
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
            New-EnglishAcademyTree -tree $tree[$key] -base $folder
        } else {
            $pageFile = "$folder/page.tsx"
            if (!(Test-Path $pageFile)) {
                New-Item -Path $pageFile -ItemType File | Out-Null
            }
        }
    }
}

$englishAcademyTree = @{
    "Baslangic (A0 ve A1)" = @{
        "alfabe_ve_okunus" = $true
        "temel_kelimeler" = $true
        "renkler_sayilar_gunler" = $true
        "selamlasma_vedalasmak" = $true
        "aile_ve_kisisel_bilgiler" = $true
        "sorular_ve_cevaplar" = $true
        "gorusme_ve_tanisma" = $true
        "dinleme_baslangic" = $true
        "okuma_kolay_metinler" = $true
        "yazma_ilk_adimlar" = $true
        "telaffuz_pratikleri" = $true
        "oyunlar_ve_egzersizler" = $true
        "ai_turkce_okunus_destegi" = $true
    }
    "Temel Orta (A2 ve B1)" = @{
        "gramer_temelleri" = $true
        "genis_kelime_listeleri" = $true
        "gunluk_hayat_diyaloglari" = $true
        "dinleme_egzersizleri" = $true
        "okuma_farkli_metinler" = $true
        "yazma_kisa_kompozisyon" = $true
        "sik_kullanilan_ifadeler" = $true
        "zamanlar_ve_duzenli_fiiller" = $true
        "ai_ile_pratik" = $true
    }
    "Ileri Orta (B2)" = @{
        "complex_grammar" = $true
        "phrasal_verbs" = $true
        "advanced_vocabulary" = $true
        "listening_podcasts" = $true
        "reading_articles" = $true
        "writing_essays" = $true
        "speaking_discussions" = $true
        "idioms_collocations" = $true
        "ai_advanced_practice" = $true
        "exam_practice" = $true
    }
    "Ileri (C1 ve C2)" = @{
        "academic_grammar" = $true
        "academic_writing" = $true
        "listening_advanced" = $true
        "reading_research" = $true
        "public_speaking" = $true
        "debate_argumentation" = $true
        "ielts_toefl_strategies" = $true
        "ai_language_coach" = $true
    }
}

$root = "ingilizce_akademi"
if (!(Test-Path $root)) { New-Item -Path $root -ItemType Directory | Out-Null }
New-EnglishAcademyTree -tree $englishAcademyTree -base $root

Write-Host "Görseldeki gibi ana başlıklar ve alt tireli alt klasörlerle yapı oluşturuldu!"