import React from "react";

const categories = [
  {
    title: "İslam Rehberi",
    desc: "Elifba, Kur’an, dua, hadis, ayet, mucizeler ve çok daha fazlası",
<<<<<<< HEAD
    emoji: "🕌",
    href: "/islam",
    gradient: "from-emerald-400/80 to-green-500/90",
=======
    color: "from-green-400 to-green-600",
    icon: "🕌",
    href: "/islam",
>>>>>>> e76b4ec5801d05309227645f00d4f03b0924da5d
  },
  {
    title: "GB İngilizce Akademi",
    desc: "Online dersler, kelime, pratik, sınav hazırlık ve daha fazlası",
<<<<<<< HEAD
    emoji: "📘",
    href: "/ingilizce",
    gradient: "from-sky-400/80 to-blue-500/90",
=======
    color: "from-blue-400 to-blue-600",
    icon: "📘",
    href: "/ingilizce",
>>>>>>> e76b4ec5801d05309227645f00d4f03b0924da5d
  },
  {
    title: "Sağlık & Yaşam",
    desc: "Güncel sağlık bilgisi, spor, beslenme, yaşam tüyoları",
<<<<<<< HEAD
    emoji: "💪",
    href: "/saglik_yasam",
    gradient: "from-pink-400/80 to-pink-600/90",
=======
    color: "from-pink-400 to-pink-600",
    icon: "💪",
    href: "/saglik_yasam",
>>>>>>> e76b4ec5801d05309227645f00d4f03b0924da5d
  },
  {
    title: "Kişisel Gelişim",
    desc: "Motivasyon, verimlilik, eğitim, hedef yönetimi, psikoloji",
<<<<<<< HEAD
    emoji: "🌟",
    href: "/kisisel_gelisim",
    gradient: "from-yellow-400/80 to-amber-500/90",
=======
    color: "from-yellow-400 to-yellow-600",
    icon: "🌟",
    href: "/kisisel_gelisim",
>>>>>>> e76b4ec5801d05309227645f00d4f03b0924da5d
  },
  {
    title: "Online Gelir",
    desc: "Evden para kazanma, yatırım, girişimcilik, yeni trendler",
<<<<<<< HEAD
    emoji: "💸",
    href: "/online_gelir",
    gradient: "from-purple-400/80 to-purple-600/90",
=======
    color: "from-purple-400 to-purple-600",
    icon: "💸",
    href: "/online_gelir",
>>>>>>> e76b4ec5801d05309227645f00d4f03b0924da5d
  },
  {
    title: "Kolay Web Sitesi",
    desc: "GitHub, VS Code, WordPress, e-ticaret, hosting, modern web araçları",
<<<<<<< HEAD
    emoji: "💻",
    href: "/Kolay_Web_Sitesi",
    gradient: "from-cyan-400/80 to-cyan-600/90",
=======
    color: "from-cyan-400 to-cyan-600",
    icon: "💻",
    href: "/Kolay_Web_Sitesi",
>>>>>>> e76b4ec5801d05309227645f00d4f03b0924da5d
  },
  {
    title: "AI Guide",
    desc: "Yapay zeka rehberi, araçlar ve etkili kullanım yolları",
<<<<<<< HEAD
    emoji: "🤖",
    href: "/AI_Guide",
    gradient: "from-fuchsia-500/80 to-indigo-600/90",
=======
    color: "from-fuchsia-500 to-indigo-600",
    icon: "🤖",
    href: "/AI_Guide",
>>>>>>> e76b4ec5801d05309227645f00d4f03b0924da5d
  },
  {
    title: "Grafik Öğren",
    desc: "Grafik tasarım, vektör, photoshop, AI ile görsel üretim, kaynaklar",
<<<<<<< HEAD
    emoji: "🎨",
    href: "/grafik_ogren",
    gradient: "from-orange-400/80 to-pink-500/90",
  },
];

export default function MainPage() {
  return (
    <main className="min-h-screen flex items-center justify-center bg-[#1a1c27] px-4 fade-in">
      <section className="bg-[#23263a]/95 rounded-3xl shadow-2xl p-8 sm:p-16 max-w-3xl w-full border border-[#292c3f] flex flex-col items-center gap-10">
        <div className="flex flex-col items-center gap-3">
          <span className="text-5xl">✨</span>
          <h1 className="text-4xl md:text-5xl font-extrabold bg-gradient-to-r from-emerald-300 to-blue-400 text-transparent bg-clip-text drop-shadow mb-2">
            Uzun Yolcu Bilgi Evreni
          </h1>
          <p className="text-lg text-gray-300 text-center max-w-xl">
            Hayatınızı kolaylaştıracak rehber içerikler, modern İslami bilgi, eğitim, kişisel gelişim ve daha fazlası burada!
          </p>
        </div>
        <nav className="flex flex-wrap justify-center gap-4 mt-4">
          {categories.map((cat) => (
            <a
              key={cat.href}
              href={cat.href}
              className={`group relative inline-block px-6 py-4 font-semibold rounded-xl bg-gradient-to-r ${cat.gradient} text-white shadow-lg transition-all duration-300 hover:scale-105 focus:outline-none focus:ring-2 focus:ring-emerald-400`}
            >
              <span className="mr-3 text-2xl">{cat.emoji}</span>
              <span className="relative z-10">{cat.title}</span>
              <div className="text-xs opacity-80">{cat.desc}</div>
              <span className="absolute top-0 left-0 w-full h-full rounded-xl opacity-0 group-hover:opacity-20 transition bg-white"></span>
            </a>
          ))}
        </nav>
        <footer className="mt-8 text-gray-400 text-center text-xs opacity-80">
          © 2025 Uzun Yolcu Bilgi Evreni
        </footer>
      </section>
    </main>
=======
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
>>>>>>> e76b4ec5801d05309227645f00d4f03b0924da5d
  );
}