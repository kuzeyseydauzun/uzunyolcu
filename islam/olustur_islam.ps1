function New-CategoryTree {
    param (
        [Parameter(Mandatory=$true)]
        [hashtable]$tree,
        [string]$base = ""
    )
    foreach ($key in $tree.Keys) {
        $folder = if ($base -eq "") { $key } else { "$base/$key" }
        if (!(Test-Path $folder)) {
            New-Item -Path $folder -ItemType Directory -Force | Out-Null
        }
        if ($tree[$key] -is [hashtable]) {
            New-CategoryTree -tree $tree[$key] -base $folder
        } else {
            # En alt klasörlerde page.tsx oluştur
            $pageFile = "$folder/page.tsx"
            if (!(Test-Path $pageFile)) {
                New-Item -Path $pageFile -ItemType File | Out-Null
            }
        }
    }
}

# Kategori ağacı (her başlık islami portaller, Diyanet, İslam Ansiklopedisi vb. örnek alınarak hazırlanmıştır)
$categoryTree = @{
    "islam" = @{
        "elifba" = @{
            "harfler" = $true
            "birlestirme" = $true
            "okunuslar" = $true
            "elifba-tablolari" = $true
            "ezber-alistirma" = $true
        }
        "kuran" = @{
            "sureler" = @{
                "kisa-sureler" = $true
                "uzun-sureler" = $true
                "faziletli-sureler" = $true
            }
            "ayetler" = @{
                "ayet-kavramlari" = $true
                "faziletli-ayetler" = $true
                "ayet-mealleri" = $true
            }
            "meal-ve-tefsir" = @{
                "kuran-meali" = $true
                "kuran-tefsiri" = $true
                "okuma-rehberi" = $true
            }
            "kuran-ogreniyorum" = @{
                "alfabe-ogrenimi" = $true
                "tecvid" = $true
                "kuran-hatalari" = $true
            }
            "kuran-hakkinda-bilgiler" = @{
                "kuran-tarihi" = $true
                "kuranin-mucizeleri" = $true
                "kuran-edebi-ozellikler" = $true
            }
        }
        "peygamberler" = @{
            "peygamber-hayatlari" = @{
                "peygamber-isimleri" = $true
                "peygamber-soy-agaci" = $true
                "peygamber-ozellikleri" = $true
            }
            "mucizeler" = @{
                "kuran-mucizeleri" = $true
                "peygamber-mucizeleri" = $true
            }
            "peygamber-sozleri" = $true
            "peygamber-nesli" = $true
            "peygamber-sikca-sorulanlar" = $true
        }
        "ayetler" = @{
            "konuya-gore-ayetler" = @{
                "iman-ayetleri" = $true
                "ahlak-ayetleri" = $true
                "ibadet-ayetleri" = $true
            }
            "faziletli-ayetler" = $true
            "ayet-analizleri" = $true
            "ayet-ezber" = $true
            "ayet-sikca-sorulanlar" = $true
        }
        "hadisler" = @{
            "hadis-kategorileri" = @{
                "iman-hadisleri" = $true
                "ahlak-hadisleri" = $true
                "ibadet-hadisleri" = $true
            }
            "gunluk-hadisler" = $true
            "hadis-ezber" = $true
            "hadis-kaynaklari" = $true
            "hadis-uygulamalari" = $true
            "hadis-sikca-sorulanlar" = $true
        }
        "dua-ve-zikirler" = @{
            "gunluk-dualar" = @{
                "sabah-dualari" = $true
                "aksam-dualari" = $true
                "yatarken-okunan" = $true
            }
            "esmaul-husna" = $true
            "tesbihler" = @{
                "namaz-sonrasi-tesbih" = $true
                "faziletli-tesbihler" = $true
            }
            "zikirler" = @{
                "sabah-zikirleri" = $true
                "aksam-zikirleri" = $true
                "her-an-zikirler" = $true
            }
            "dua-ezber" = $true
            "dua-sikca-sorulanlar" = $true
        }
        "temel-bilgiler" = @{
            "imanin-sartlari" = $true
            "islamin-sartlari" = $true
            "abdest-ve-namaz" = $true
            "oruç-ve-zekat" = $true
            "helal-haram" = $true
        }
        "islami-kavramlar" = @{
            "terimler-sozlugu" = $true
            "ibadet-terimleri" = $true
            "ahlak-terimleri" = $true
            "akaid-terimleri" = $true
            "fikh-terimleri" = $true
        }
        "islami-kaynaklar" = @{
            "kuran-kaynaklari" = $true
            "hadis-kaynaklari" = $true
            "tefsirler" = $true
            "ilmihal-kitaplari" = $true
            "fikh-ve-akaid-kitaplari" = $true
        }
    }
}

# Ağacı oluştur
New-CategoryTree -tree $categoryTree

Write-Host "Tüm klasörler ve en alt klasörlerde page.tsx dosyaları başarıyla oluşturuldu!"