# Uzun Yolcu Bilgi Evreni

Hayatınızı kolaylaştıracak rehber içerikler, modern İslami bilgi, eğitim, kişisel gelişim ve daha fazlası burada!

## Ana Kategoriler

Sitemiz aşağıdaki ana başlıklardan oluşmaktadır:

- 🕌 **İslam Rehberi**  
  Elifba, Kur’ân, dua, hadis, ayet, mucizeler ve çok daha fazlası  
  (Klasör: `/islam`)

- 🇬🇧 **GB İngilizce Akademi**  
  Online dersler, kelime, pratik, sınav hazırlık ve daha fazlası  
  (Klasör: `/ingilizce-akademi`)

- 💪 **Sağlık & Yaşam**  
  Güncel sağlık bilgisi, spor, beslenme, yaşam tüyoları  
  (Klasör: `/saglik-yasam`)

- 🚀 **Kişisel Gelişim**  
  Motivasyon, verimlilik, eğitim, hedef yönetimi, psikoloji  
  (Klasör: `/kisisel-gelisim`)

- 💸 **Online Gelir**  
  Evden para kazanma, yatırım, girişimcilik, yeni trendler  
  (Klasör: `/online-gelir`)

## Klasör Yapısı

Proje ana dizininde aşağıdaki klasörler ve her birinde `page.tsx` dosyası bulunur. Detaylı alt yapılar için örnek olarak İslam bölümü aşağıda gösterilmiştir.

```
/islam
  /elifba
    /harfler/page.tsx
    /birlestirme/page.tsx
    ...
  /kuran
    /sureler/kisa-sureler/page.tsx
    ...
  ...
/ingilizce-akademi/page.tsx
/saglik-yasam/page.tsx
/kisisel-gelisim/page.tsx
/online-gelir/page.tsx
```

> Not: Yeni kategoriler veya alt başlıklar eklemek için ilgili klasöre yeni bir klasör ve `page.tsx` dosyası ekleyebilirsiniz.

## Kurulum ve Kullanım

1. Depoyu klonlayın:
   ```bash
   git clone https://github.com/kuzeyseydauzun/uzunyolcu.git
   cd uzunyolcu
   ```
2. Gerekli klasörleri otomatik oluşturmak için PowerShell scriptini kullanın:
   ```powershell
   ./New-CategoryTree-All.ps1
   ```
3. Next.js veya kullandığınız framework talimatlarına göre projeyi başlatın.

## Katkı Sağlamak

Katkıda bulunmak isterseniz, lütfen bir issue oluşturun veya pull request gönderin.

---

Görseldeki ana başlıklar ve kategori yapısı ile uyumlu şekilde bu README dosyasını kullanabilirsiniz. Kendi logonuzu/görselinizi eklemeyi unutmayın!
