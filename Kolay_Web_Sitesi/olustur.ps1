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

function New-EasyWebSiteTree {
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
            New-EasyWebSiteTree -tree $tree[$key] -base $folder
        } else {
            $pageFile = "$folder/page.tsx"
            if (!(Test-Path $pageFile)) {
                New-Item -Path $pageFile -ItemType File | Out-Null
            }
        }
    }
}

$easyWebTree = @{
    "Kolay Web Sitesi" = @{
        "github_ile_web_site" = @{
            "github_pages" = $true
            "repo_olusturma" = $true
            "site_yayinlama" = $true
            "ucretsiz_domain" = $true
        }
        "vs_code_kullanimi" = @{
            "kurulum" = $true
            "temel_kullanim" = $true
            "uzantilar" = $true
            "kisa_yollar" = $true
        }
        "py_ile_web_site" = @{
            "flask_ile_site" = $true
            "django_ile_basit_site" = $true
            "deploy_etme" = $true
            "ornek_kodlar" = $true
        }
        "html_css_js_temelleri" = @{
            "html_baslangic" = $true
            "css_stil" = $true
            "js_etkilesim" = $true
            "minik_projeler" = $true
        }
        "php_ile_web_site" = @{
            "php_baslangic" = $true
            "form_islemleri" = $true
            "veritabani_baglantisi" = $true
            "hazir_php_sablonlari" = $true
        }
        "asp_net_ile_web_site" = @{
            "asp_net_baslangic" = $true
            "mvc_yapisi" = $true
            "veritabani_baglantisi" = $true
            "ornek_projeler" = $true
        }
        "veritabani_sql" = @{
            "sql_nedir" = $true
            "mysql" = $true
            "sqlite" = $true
            "postgresql" = $true
            "temel_sorgular" = $true
        }
        "wordpress" = @{
            "kurulum" = $true
            "tema_ve_eklentiler" = $true
            "hazir_sablonlar" = $true
            "seo_ayarlari" = $true
            "guvenlik" = $true
        }
        "shopify" = @{
            "shopify_baslangic" = $true
            "tema_duzenleme" = $true
            "urun_ekleme" = $true
        }
        "wix_webflow" = @{
            "wix_tasarim" = $true
            "webflow_baslangic" = $true
            "ozellikler" = $true
        }
        "bootstrap_tailwind" = @{
            "bootstrap_kullanimi" = $true
            "tailwind_baslangic" = $true
        }
        "react_vue_nextjs" = @{
            "react_baslangic" = $true
            "vue_giris" = $true
            "nextjs_ile_ssr" = $true
        }
        "eticaret_sitesi" = @{
            "eticaret_nedir" = $true
            "hazir_eticaret_platformlari" = @{
                "shopify" = $true
                "woocommerce" = $true
                "opencart" = $true
                "wix_eticaret" = $true
                "magento" = $true
            }
            "odeme_sistemleri" = @{
                "iyzico" = $true
                "shopier" = $true
                "paypal" = $true
                "stripe" = $true
            }
            "urun_ekleme_yonetimi" = $true
            "stok_takibi" = $true
            "siparis_yonetimi" = $true
            "kargo_ve_teslimat" = $true
            "musteri_iletisimi_ve_destek" = $true
            "pazarlama_ve_kampanya" = $true
            "seo_ve_reklam" = $true
            "mobil_uyumluluk" = $true
            "guvenlik_ssl" = $true
            "hukuk_ve_gizlilik" = $true
        }
        "surgule_birak_edit" = @{
            "google_sites" = $true
            "carrd" = $true
            "mobirise" = $true
        }
        "ucretsiz_web_araclari" = @{
            "tasarim_araclari" = $true
            "ikon_ve_resim" = $true
            "template_siteleri" = $true
            "domain_araclari" = $true
        }
        "hazir_sablonlar" = @{
            "blog_template" = $true
            "portfoy_template" = $true
            "sirket_template" = $true
            "kisisel_template" = $true
        }
        "adim_adim_rehber" = @{
            "fikirden_yayina" = $true
            "hata_ve_cozum" = $true
        }
        "ai_destekli_web_site" = @{
            "ai_sablon_olusturucu" = $true
            "ai_icerik_olusturma" = $true
            "ai_ile_tasarim" = $true
        }
        "seo_ve_analytics" = @{
            "seo_temelleri" = $true
            "arama_motoruna_ekleme" = $true
            "google_analytics" = $true
        }
        "guvenlik_ve_hosting" = @{
            "ssl_nedir" = $true
            "ddos_koruma" = $true
            "hosting_secimi" = $true
            "cdn_kullanimi" = $true
        }
        "sikca_sorulan_sorular" = $true
        "topluluk_ve_destek" = $true
    }
}

$root = "kolay_web_sitesi"
if (!(Test-Path $root)) { New-Item -Path $root -ItemType Directory | Out-Null }
New-EasyWebSiteTree -tree $easyWebTree -base $root

Write-Host "Kolay Web Sitesi klasör yapısı ve e-ticaret alt başlıklarıyla oluşturuldu!"