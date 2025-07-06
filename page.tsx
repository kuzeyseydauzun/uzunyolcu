import React from "react";

const categories = [
  {
    title: "İslam Rehberi",
    desc: "Elifba, Kur’an, dua, hadis, ayet, mucizeler ve çok daha fazlası",
    color: "from-green-400 to-green-600",
    icon: "🕌",
    href: "/islam",
  },
  {
    title: "GB İngilizce Akademi",
    desc: "Online dersler, kelime, pratik, sınav hazırlık ve daha fazlası",
    color: "from-blue-400 to-blue-600",
    icon: "📘",
    href: "/ingilizce",
  },
  {
    title: "Sağlık & Yaşam",
    desc: "Güncel sağlık bilgisi, spor, beslenme, yaşam tüyoları",
    color: "from-pink-400 to-pink-600",
    icon: "💪",
    href: "/saglik_yasam",
  },
  {
    title: "Kişisel Gelişim",
    desc: "Motivasyon, verimlilik, eğitim, hedef yönetimi, psikoloji",
    color: "from-yellow-400 to-yellow-600",
    icon: "🌟",
    href: "/kisisel_gelisim",
  },
  {
    title: "Online Gelir",
    desc: "Evden para kazanma, yatırım, girişimcilik, yeni trendler",
    color: "from-purple-400 to-purple-600",
    icon: "💸",
    href: "/online_gelir",
  },
  {
    title: "Kolay Web Sitesi",
    desc: "GitHub, VS Code, WordPress, e-ticaret, hosting, modern web araçları",
    color: "from-cyan-400 to-cyan-600",
    icon: "💻",
    href: "/Kolay_Web_Sitesi",
  },
  {
    title: "AI Guide",
    desc: "Yapay zeka rehberi, araçlar ve etkili kullanım yolları",
    color: "from-fuchsia-500 to-indigo-600",
    icon: "🤖",
    href: "/AI_Guide",
  },
  {
    title: "Grafik Öğren",
    desc: "Grafik tasarım, vektör, photoshop, AI ile görsel üretim, kaynaklar",
    color: "from-orange-400 to-pink-500",
    icon: "🎨",
    href: "/grafik_ogren",
  },
];

export default function Home() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-br from-gray-900 to-gray-800">
      <div className="w-full max-w-2xl px-4 py-12 flex flex-col items-center">
        <div className="text-center mb-10">
          <div className="flex justify-center mb-4">
            <span className="text-4xl">✨</span>
          </div>
          <h1 className="text-4xl md:text-5xl font-bold bg-gradient-to-r from-green-400 to-blue-500 text-transparent bg-clip-text drop-shadow mb-3">
            Uzun Yolcu Bilgi Evreni
          </h1>
          <p className="text-gray-200 text-lg md:text-xl">
            Hayatınızı kolaylaştıracak rehber içerikler, modern İslami bilgi, eğitim, kişisel gelişim, teknoloji ve daha fazlası burada!
          </p>
        </div>
        <div className="flex flex-col gap-4 w-full">
          {categories.map((cat, i) => (
            <a
              key={cat.title}
              href={cat.href}
              className={`
                flex items-center gap-4 transition
                bg-gradient-to-r ${cat.color}
                rounded-2xl px-6 py-4 shadow-lg
                text-white text-lg md:text-xl font-semibold
                hover:scale-105 hover:shadow-2xl hover:bg-opacity-90
                backdrop-blur-sm bg-opacity-80
                outline-none focus:ring-2 focus:ring-white
              `}
              style={{
                transition: "transform 0.16s, box-shadow 0.18s",
              }}
            >
              <span className="text-3xl">{cat.icon}</span>
              <div>
                <span>{cat.title}</span>
                <div className="text-white text-sm font-normal opacity-80">{cat.desc}</div>
              </div>
            </a>
          ))}
        </div>
        <footer className="mt-12 text-gray-400 text-center text-xs opacity-80">
          © 2025 Uzun Yolcu Bilgi Evreni
        </footer>
      </div>
    </div>
  );
}