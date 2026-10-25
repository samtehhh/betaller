// Education articles about height growth for the BeTaller app.
// Returns localized articles based on language code.

List<Map<String, dynamic>> getEducationArticles(String languageCode) {
  switch (languageCode) {
    case 'tr':
      return _articlesTr;
    case 'de':
      return _articlesDe;
    case 'fr':
      return _articlesFr;
    case 'es':
      return _articlesEs;
    case 'pt':
      return _articlesPt;
    case 'it':
      return _articlesIt;
    case 'hi':
      return _articlesHi;
    case 'nl':
      return _articlesNl;
    case 'pl':
      return _articlesPl;
    case 'sv':
      return _articlesSv;
    default:
      return _articlesEn;
  }
}

// ── ENGLISH ──────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesEn = [
  {
    'id': 'article_hgh',
    'title': 'What is Growth Hormone?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Meet Your Growth Engine: HGH',
        'body':
            'Human Growth Hormone (HGH) is a small protein produced by the '
            'pituitary gland at the base of your brain. HGH is the single most '
            'important hormone for increasing your height during childhood and '
            'adolescence. It tells your bones, muscles, and organs to grow.',
      },
      {
        'header': 'How the Pituitary Gland Works',
        'body':
            'The pituitary gland releases HGH in pulses throughout the day, '
            'but the largest bursts happen during deep sleep and right after '
            'intense exercise. The hypothalamus controls these pulses using '
            'GHRH (stimulates HGH) and somatostatin (suppresses HGH).',
      },
      {
        'header': 'When Does HGH Peak?',
        'body':
            'HGH levels are highest during puberty. For boys, the peak '
            'typically occurs between ages 13–15; for girls, between ages '
            '11–13. After the growth-spurt years, HGH production gradually '
            'declines by about 14% per decade after age 20.',
      },
      {
        'header': 'How to Boost HGH Naturally',
        'body':
            '1. Sleep 8–10 hours every night (deep sleep = biggest HGH pulses).\n'
            '2. Exercise intensely — sprints and resistance training trigger '
            'large HGH releases.\n'
            '3. Eat enough protein — arginine and ornithine stimulate HGH.\n'
            '4. Avoid sugar spikes before bed — high blood sugar suppresses '
            'HGH release during sleep.',
      },
      {
        'header': 'What Lowers HGH?',
        'body':
            '• Chronic sleep deprivation.\n'
            '• Excess body fat, especially around the belly.\n'
            '• High sugar and processed food intake.\n'
            '• Chronic stress (raises cortisol, suppresses HGH).\n'
            '• Sedentary lifestyle with little physical activity.',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
      'Takahashi Y et al. J Clin Invest. 1968;47(9):2079-90.',
      'Wideman L et al. Sports Med. 2002;32(15):987-1004.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'How Do Growth Plates Work?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'What Are Growth Plates?',
        'body':
            'Growth plates (epiphyseal plates) are thin layers of cartilage '
            'located near the ends of your long bones. These plates are the '
            'only areas where new bone tissue is added to increase length. '
            'As long as they remain open (unfused), you can still grow taller.',
      },
      {
        'header': 'How Bones Get Longer',
        'body':
            'Inside each growth plate, chondrocytes constantly divide. New '
            'cartilage cells push older ones toward the bone shaft, where '
            'they are replaced by hard bone tissue through ossification. '
            'This cycle makes your legs and spine longer over time.',
      },
      {
        'header': 'When Do Growth Plates Close?',
        'body':
            'Growth plate closure is triggered mainly by sex hormones:\n\n'
            '• Girls: plates begin fusing around age 14–16.\n'
            '• Boys: plates begin fusing around age 16–18.\n'
            '• Some plates may not fully close until age 25.\n\n'
            'A hand/wrist X-ray (bone age test) can show remaining potential.',
      },
      {
        'header': 'Factors That Affect Plate Closure',
        'body':
            '• Early puberty → earlier closure (less total growth time).\n'
            '• Malnutrition → delayed closure but also slower growth rate.\n'
            '• Obesity → higher estrogen can accelerate closure.\n'
            '• Adequate nutrition and sleep maintain healthy plate activity.',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
      'Weise M et al. PNAS. 2001;98(12):6871-6.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Sleep & Growth: The Science',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Why Sleep Is Non-Negotiable',
        'body':
            'Up to 75% of daily growth hormone is released during sleep. '
            'No amount of exercise or nutrition can fully compensate for poor '
            'sleep. Your body literally builds bone and repairs tissue '
            'while you are asleep.',
      },
      {
        'header': 'Sleep Cycles and GH Release',
        'body':
            'A typical night contains 4–6 sleep cycles of about 90 minutes '
            'each. The largest HGH pulses occur during stage 3 deep sleep, '
            'especially in the first 1–2 cycles. Going to bed late or waking '
            'frequently means missing these critical pulses.',
      },
      {
        'header': 'How Much Sleep Do You Need?',
        'body':
            '• Ages 6–12: 9–12 hours per night.\n'
            '• Ages 13–15: 9–10 hours per night.\n'
            '• Ages 16–18: 8–10 hours per night.\n'
            '• Ages 19–25: 7–9 hours per night.\n\n'
            'Aim for the higher end if you are actively growing.',
      },
      {
        'header': 'Tips for Better Sleep',
        'body':
            '1. Go to bed and wake at the same time every day.\n'
            '2. Stop screens 30 minutes before bed (blue light suppresses melatonin).\n'
            '3. Keep your room cool (18–20 °C) and dark.\n'
            '4. Avoid caffeine after 2 PM and heavy meals 2 hours before bed.\n'
            '5. Light stretching before bed helps relax your body.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
      'Paruthi S et al. J Clin Sleep Med. 2016;12(6):785-786.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Nutrition for Maximum Growth',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Why Diet Matters for Height',
        'body':
            'Genetics set your height potential, but nutrition determines '
            'whether you reach it. Improved nutrition over the past century '
            'has increased average height by up to 10 cm in many countries.',
      },
      {
        'header': 'Calcium — The Bone Builder',
        'body':
            'Calcium makes up about 70% of bone tissue. During peak growth '
            'years, you need 1,000–1,300 mg daily. Top sources: milk, yogurt, '
            'cheese, broccoli, almonds. Pair with vitamin D for best absorption.',
      },
      {
        'header': 'Protein — The Growth Fuel',
        'body':
            'Teenagers need about 1.0–1.5 g of protein per kg of body weight '
            'daily. Arginine especially stimulates HGH secretion. Great sources: '
            'eggs, chicken, fish, lean beef, lentils, Greek yogurt, tofu.',
      },
      {
        'header': 'Key Vitamins and Minerals',
        'body':
            '• Vitamin D: 600–1,000 IU daily for calcium absorption.\n'
            '• Zinc: 8–11 mg/day for cell division and growth.\n'
            '• Vitamin A: Supports bone remodeling (carrots, sweet potatoes).\n'
            '• Iron: 8–15 mg/day, carries oxygen to growing tissues.\n'
            '• Phosphorus & Magnesium: Mineralize bone with calcium.',
      },
      {
        'header': 'What to Avoid',
        'body':
            '• Excess sugar and soda — leaches calcium and suppresses HGH.\n'
            '• Extreme dieting — stunts growth.\n'
            '• Too much caffeine — interferes with calcium absorption.\n'
            '• Highly processed food — low in micronutrients.',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
      'Prentice A. Public Health Nutr. 2004;7(1A):227-243.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Exercise & Height: The Science',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Can Exercise Make You Taller?',
        'body':
            'Exercise alone cannot change your genetic height ceiling, but it '
            'helps you reach your full potential. Physical activity stimulates '
            'HGH release, strengthens bones, and improves posture.',
      },
      {
        'header': 'Impact Exercise and Growth Plates',
        'body':
            'Running, jumping, and basketball create mechanical stress on '
            'growth plates, stimulating chondrocyte activity and encouraging '
            'more bone growth. Athletes in jumping sports tend to have greater '
            'bone mineral density.',
      },
      {
        'header': 'Best Exercises for Growth',
        'body':
            '1. Jumping: jump rope, box jumps — stimulates leg growth plates.\n'
            '2. Sprinting: triggers large HGH releases.\n'
            '3. Swimming: full-body stretch with low impact.\n'
            '4. Hanging & pull-ups: decompress the spine.\n'
            '5. Yoga/dynamic stretching: improve posture.\n'
            '6. Moderate resistance training: supports bone growth.',
      },
      {
        'header': 'HGH Response to Exercise',
        'body':
            'High-intensity exercise can raise HGH by 300–500% for 1–2 hours '
            'post-workout. Key factors:\n\n'
            '• Intensity > 70% of max effort.\n'
            '• Duration of at least 10–20 minutes.\n'
            '• Rest 60–90 seconds between sets.',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
      'Behringer M et al. Pediatrics. 2014;133(5):e1121.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Posture & Hidden Centimeters',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'How Posture Affects Your Height',
        'body':
            'Poor posture can make you appear 2–5 cm shorter than your actual '
            'skeletal height. Rounded shoulders and forward head position '
            'compress your spine. Standing properly can instantly "add" '
            'centimeters to your measured height.',
      },
      {
        'header': 'Spinal Compression During the Day',
        'body':
            'Gravity compresses the discs between your vertebrae throughout '
            'the day. You are tallest in the morning and shortest in the '
            'evening — the difference can be 1.5–2.5 cm. Poor posture '
            'and weak core muscles make it worse.',
      },
      {
        'header': 'Decompression Exercises',
        'body':
            '1. Dead hang (30–60 sec) — stretch the spine with gravity.\n'
            '2. Cat-cow stretch — arch and round your back on all fours.\n'
            '3. Cobra stretch — push chest up from face-down position.\n'
            '4. Child\'s pose — kneel and reach forward.\n'
            '5. Wall angels — strengthen postural muscles.',
      },
      {
        'header': 'Long-Term Posture Habits',
        'body':
            '• Ergonomic desk setup — screen at eye level.\n'
            '• 2-minute posture break every 30 minutes of sitting.\n'
            '• Strengthen core and back (planks, rows).\n'
            '• Imagine a string pulling the top of your head upward.\n'
            '• Sleep on your back with a thin pillow.',
      },
    ],
    'references': [
      'Kim D et al. J Phys Ther Sci. 2015;27(6):1791-4.',
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Height Growth: Myths vs Facts',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Myth: "Genetics Is Everything"',
        'body':
            'FACT: Genetics accounts for 60–80% of final height. The remaining '
            '20–40% depends on nutrition, sleep, and exercise. In South Korea '
            'and the Netherlands, average height rose 10–15 cm in just a few '
            'generations with improved nutrition.',
      },
      {
        'header': 'Myth: "Stretching Makes You Permanently Taller"',
        'body':
            'FACT: Stretching improves posture and reduces spinal compression, '
            'which can make you measure 1–3 cm taller. But it does not lengthen '
            'bones. Gains come from posture correction, not bone growth.',
      },
      {
        'header': 'Myth: "Milk Alone Makes You Tall"',
        'body':
            'FACT: Milk provides calcium, protein, and vitamin D — all great. '
            'But you also need zinc, vitamin A, iron, and phosphorus. Growth '
            'requires a full team of nutrients, not a single food.',
      },
      {
        'header': 'Myth: "You Stop Growing at 18"',
        'body':
            'FACT: Most people finish growing by 18, but some — especially '
            'late-puberty males — continue until age 20–22. Growth plate '
            'closure varies. A bone age X-ray can reveal remaining potential.',
      },
      {
        'header': 'Myth: "Weights Stunt Teen Growth"',
        'body':
            'FACT: Properly supervised resistance training is safe for teens '
            'and supports growth by increasing HGH and strengthening bones. '
            'The myth comes from rare injuries caused by improper heavy lifting.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
      'Faigenbaum AD et al. J Strength Cond Res. 2009;23(5):S60-79.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Maximize Your Growth Window',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Understanding Growth Spurts',
        'body':
            'Height growth happens in bursts. Two major growth spurts:\n\n'
            '1. Infancy to age 2 (~25 cm in year one).\n'
            '2. Puberty (girls: ~8–10 cm/year peak; boys: ~10–12 cm/year).\n\n'
            'Between spurts, children grow about 5–6 cm per year.',
      },
      {
        'header': 'Puberty Timing Matters',
        'body':
            'Early bloomers grow fast but stop sooner. Late bloomers grow '
            'slower initially but often end up taller with more years of growth. '
            'If friends are taller now, you may not have hit your peak spurt '
            'yet — and may ultimately grow more.',
      },
      {
        'header': 'What to Do at Each Age',
        'body':
            'Ages 8–12: Build the foundation.\n'
            '• Balanced diet with calcium and protein. 10+ hours sleep.\n\n'
            'Ages 13–16: The critical window.\n'
            '• Prioritize 9+ hours sleep. Sprint and jump exercises.\n'
            '• 1,300 mg calcium, 1.2–1.5 g/kg protein daily.\n\n'
            'Ages 17–20: Final opportunity.\n'
            '• Excellent nutrition, sleep, posture exercises.',
      },
      {
        'header': 'Signs a Growth Spurt Is Coming',
        'body':
            '• Shoe size increases before height.\n'
            '• Hands and feet seem disproportionately large.\n'
            '• Increased appetite and hunger.\n'
            '• Growing pains (aching legs at night).\n'
            '• Rapid changes in clothing fit.\n\n'
            'When you notice these signs, double down on sleep and nutrition.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
      'Rogol AD et al. J Adolesc Health. 2002;31(6):192-200.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── TURKISH ──────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesTr = [
  {
    'id': 'article_hgh',
    'title': 'Büyüme Hormonu Nedir?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Büyüme Motorunuz: HGH',
        'body':
            'İnsan büyüme hormonu (HGH), beynin tabanındaki hipofiz bezi '
            'tarafından üretilen küçük bir proteindir. HGH, çocukluk ve '
            'ergenlik döneminde boyunuzu artırmak için en önemli hormondur. '
            'Kemiklerinize, kaslarınıza ve organlarınıza büyüme sinyali verir.',
      },
      {
        'header': 'Hipofiz Bezi Nasıl Çalışır?',
        'body':
            'Hipofiz bezi, HGH\'yi gün boyunca darbeler halinde salgılar. '
            'En büyük darbeler derin uyku sırasında ve yoğun egzersizden '
            'hemen sonra gerçekleşir. Hipotalamus, GHRH (artırır) ve '
            'somatostatin (baskılar) sinyalleriyle bu süreçleri yönetir.',
      },
      {
        'header': 'HGH Ne Zaman Zirveye Ulaşır?',
        'body':
            'HGH düzeyleri ergenlik döneminde en yüksektir. Erkeklerde zirve '
            'genellikle 13–15 yaşlarında, kızlarda ise 11–13 yaşlarında '
            'görülür. Büyüme dönemi bittikten sonra HGH üretimi, 20 yaşından '
            'itibaren her on yılda yaklaşık %14 azalır.',
      },
      {
        'header': 'HGH\'yi Doğal Olarak Nasıl Artırırsınız?',
        'body':
            '1. Her gece 8–10 saat uyuyun (derin uyku = en büyük HGH darbesi).\n'
            '2. Yoğun egzersiz yapın — sprint ve ağırlık antrenmanı HGH salgılar.\n'
            '3. Yeterli protein tüketin — arjinin ve ornitin HGH\'yi uyarır.\n'
            '4. Yatmadan önce şeker tüketmekten kaçının — kan şekeri '
            'yükselirse HGH baskılanır.',
      },
      {
        'header': 'HGH\'yi Ne Düşürür?',
        'body':
            '• Kronik uyku yoksunluğu.\n'
            '• Özellikle karın bölgesindeki fazla yağ.\n'
            '• Yüksek şeker ve işlenmiş gıda tüketimi.\n'
            '• Kronik stres (kortizol yükselir, HGH baskılanır).\n'
            '• Hareketsiz yaşam tarzı.',
      },
    ],
    'references': [
      'Veldhuis JD ve ark. J Neuroendocrinol. 2012;24(12):1365-71.',
      'Takahashi Y ve ark. J Clin Invest. 1968;47(9):2079-90.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'Büyüme Plakaları Nasıl Çalışır?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'Büyüme Plakaları Nedir?',
        'body':
            'Büyüme plakaları (epifiz plakaları), uzun kemiklerin uçlarına '
            'yakın konumlanmış ince kıkırdak tabakalarıdır. Boy uzaması için '
            'yeni kemik dokusu yalnızca bu bölgelerde eklenir. Plakalar açık '
            'kaldıkça (birleşmemiş) boy uzamaya devam edebilir.',
      },
      {
        'header': 'Kemikler Nasıl Uzar?',
        'body':
            'Her büyüme plakasında kondrosit hücreleri sürekli bölünür. '
            'Yeni kıkırdak hücreleri eski hücreleri kemik gövdesine doğru '
            'iter; burada ossifikasyon (kalsifikasyon) ile sert kemiğe '
            'dönüşürler. Bu döngü bacaklarınızı ve omurganızı uzatır.',
      },
      {
        'header': 'Büyüme Plakaları Ne Zaman Kapanır?',
        'body':
            'Büyüme plakası kapanması esas olarak cinsiyet hormonlarıyla '
            'tetiklenir:\n\n'
            '• Kızlar: 14–16 yaşlarında kapanmaya başlar.\n'
            '• Erkekler: 16–18 yaşlarında kapanmaya başlar.\n'
            '• Bazı plakalar 25 yaşına kadar tam kapanmayabilir.\n\n'
            'El/bilek röntgeni (kemik yaşı testi) kalan potansiyeli gösterir.',
      },
      {
        'header': 'Plaka Kapanmasını Etkileyen Faktörler',
        'body':
            '• Erken ergenlik → erken kapanma (daha az büyüme süresi).\n'
            '• Yetersiz beslenme → gecikmiş kapanma ama yavaş büyüme.\n'
            '• Obezite → yüksek östrojen kapanmayı hızlandırabilir.\n'
            '• Yeterli beslenme ve uyku sağlıklı plaka aktivitesini korur.',
      },
    ],
    'references': [
      'Nilsson O ve ark. Horm Res. 2005;64(4):157-65.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Uyku ve Büyüme: Bilim Ne Diyor?',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Uyku Neden Vazgeçilmez?',
        'body':
            'Günlük büyüme hormonunun %75\'e kadarı uyku sırasında salgılanır. '
            'Hiçbir egzersiz veya beslenme düzeni yetersiz uyku için tam '
            'telafi sağlayamaz. Vücudunuz uyurken kemik inşa eder ve '
            'dokuları onarır.',
      },
      {
        'header': 'Uyku Döngüleri ve HGH Salgısı',
        'body':
            'Tipik bir gece 4–6 uyku döngüsü içerir; her biri yaklaşık '
            '90 dakikadır. En büyük HGH darbesi özellikle ilk 1–2 döngüde '
            'görülen derin uyku aşamasında (evre 3) gerçekleşir. Geç yatmak '
            'veya sık uyanmak bu kritik darbeyi kaçırmanıza neden olur.',
      },
      {
        'header': 'Ne Kadar Uyumalısınız?',
        'body':
            '• 6–12 yaş: gecede 9–12 saat.\n'
            '• 13–15 yaş: gecede 9–10 saat.\n'
            '• 16–18 yaş: gecede 8–10 saat.\n'
            '• 19–25 yaş: gecede 7–9 saat.\n\n'
            'Aktif büyüme dönemindeyseniz üst sınıra yakın uyumayı hedefleyin.',
      },
      {
        'header': 'Daha İyi Uyku İçin İpuçları',
        'body':
            '1. Her gün aynı saatte yatın ve kalkın.\n'
            '2. Yatmadan 30 dakika önce ekranları kapatın (mavi ışık melatonini baskılar).\n'
            '3. Odayı serin (18–20 °C) ve karanlık tutun.\n'
            '4. Saat 14\'ten sonra kafein ve yatmadan 2 saat önce ağır yemek tüketmeyin.\n'
            '5. Yatmadan önce hafif esneme gevşemenize yardımcı olur.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Maksimum Büyüme İçin Beslenme',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Beslenme Neden Boy İçin Önemlidir?',
        'body':
            'Genetik boy potansiyelinizi belirler; beslenme ise ona ulaşıp '
            'ulaşamayacağınızı. Geçen yüzyılda iyileşen beslenme koşulları '
            'pek çok ülkede ortalama boyu 10 cm\'ye kadar artırmıştır.',
      },
      {
        'header': 'Kalsiyum — Kemik Yapı Taşı',
        'body':
            'Kalsiyum, kemik dokusunun yaklaşık %70\'ini oluşturur. Hızlı büyüme '
            'döneminde günde 1.000–1.300 mg kalsiyuma ihtiyacınız vardır. '
            'Başlıca kaynaklar: süt, yoğurt, peynir, brokoli, badem. '
            'En iyi emilim için D vitaminiyle birlikte tüketin.',
      },
      {
        'header': 'Protein — Büyümenin Yakıtı',
        'body':
            'Ergenler vücut ağırlığının kilogramı başına günde 1,0–1,5 g '
            'proteine ihtiyaç duyar. Arjinin, HGH salgısını özellikle uyarır. '
            'En iyi kaynaklar: yumurta, tavuk, balık, mercimek, Yunan yoğurdu.',
      },
      {
        'header': 'Temel Vitamin ve Mineraller',
        'body':
            '• D Vitamini: Kalsiyum emilimi için günde 600–1.000 IU.\n'
            '• Çinko: Hücre bölünmesi ve büyüme için günde 8–11 mg.\n'
            '• A Vitamini: Kemik yeniden yapılanmasını destekler (havuç, tatlı patates).\n'
            '• Demir: Büyüyen dokulara oksijen taşır, günde 8–15 mg.\n'
            '• Fosfor & Magnezyum: Kalsiyumla birlikte kemik mineralizasyonunu sağlar.',
      },
      {
        'header': 'Kaçınılması Gerekenler',
        'body':
            '• Fazla şeker ve gazlı içecek — kalsiyumu azaltır ve HGH\'yi baskılar.\n'
            '• Aşırı diyet — büyümeyi durdurur.\n'
            '• Aşırı kafein — kalsiyum emilimini bozar.\n'
            '• Yüksek işlenmiş gıdalar — büyüme için gereken mikro besinleri içermez.',
      },
    ],
    'references': [
      'Golden NH ve ark. Pediatrics. 2014;134(4):e1229-43.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Egzersiz ve Boy: Bilim Ne Diyor?',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Egzersiz Sizi Uzatabilir Mi?',
        'body':
            'Egzersiz tek başına genetik boy tavanını değiştiremez, ancak '
            'tam potansiyelinize ulaşmanıza yardımcı olur. Fiziksel aktivite '
            'HGH salgısını uyarır, kemikleri güçlendirir ve duruşu düzeltir.',
      },
      {
        'header': 'Darbeli Egzersiz ve Büyüme Plakaları',
        'body':
            'Koşu, zıplama ve basketbol, büyüme plakalarına mekanik baskı '
            'uygular ve kondrosit aktivitesini uyararak kemik büyümesini '
            'teşvik eder. Zıplamalı sporlarda aktif olan genç sporcuların '
            'kemik mineral yoğunluğu genellikle daha yüksektir.',
      },
      {
        'header': 'Büyüme İçin En İyi Egzersizler',
        'body':
            '1. Zıplama: atlama ipi, box jump — bacak büyüme plaklarını uyarır.\n'
            '2. Sprint: büyük HGH darbelerini tetikler.\n'
            '3. Yüzme: tüm vücut esneme ve düşük darbeli direnç.\n'
            '4. Asılma & pull-up: omurgayı dekomprese eder.\n'
            '5. Yoga/dinamik esneme: duruşu düzeltir.\n'
            '6. Orta ağırlık antrenmanı: kemik büyümesini destekler.',
      },
      {
        'header': 'Egzersize HGH Yanıtı',
        'body':
            'Yüksek yoğunluklu egzersiz HGH düzeyini antrenman sonrası '
            '1–2 saat boyunca %300–500 artırabilir. Temel faktörler:\n\n'
            '• Maksimum eforun %70\'inden fazla yoğunluk.\n'
            '• En az 10–20 dakika süre.\n'
            '• Setler arasında 60–90 saniyelik dinlenme.',
      },
    ],
    'references': [
      'Godfrey RJ ve ark. Sports Med. 2003;33(8):599-613.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Duruş ve Gizli Santimetreler',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Duruş Boyunuzu Nasıl Etkiler?',
        'body':
            'Kötü duruş, gerçek iskelet boyunuzdan 2–5 cm daha kısa '
            'görünmenize neden olabilir. Yuvarlak omuzlar ve öne çıkmış '
            'kafa pozisyonu omurgayı sıkıştırır. Düzgün durmak anında '
            'santimetre "kazandırır".',
      },
      {
        'header': 'Gün İçi Omurga Sıkışması',
        'body':
            'Yerçekimi gün boyunca omurlar arasındaki diskleri sıkıştırır. '
            'Sabahları en uzun, akşamları en kısasınızdır; fark 1,5–2,5 cm '
            'olabilir. Kötü duruş ve zayıf karın kasları bunu daha da kötüleştirir.',
      },
      {
        'header': 'Dekompresyon Egzersizleri',
        'body':
            '1. Ölü asılma (30–60 sn) — yerçekimiyle omurgayı gerer.\n'
            '2. Kedi-inek germe — dört ayak üzerinde sırtı içbükey ve dışbükey yapın.\n'
            '3. Kobra germe — yüzüstü yatıp göğsü kaldırın.\n'
            '4. Çocuk pozu — öne uzanarak sırtı uzatın.\n'
            '5. Duvar melekleri — postural kasları güçlendirir.',
      },
      {
        'header': 'Uzun Vadeli Duruş Alışkanlıkları',
        'body':
            '• Ergonomik masa düzeni — ekran göz hizasında.\n'
            '• Her 30 dakika oturuşta 2 dakika duruş molası.\n'
            '• Karın ve sırt kaslarını güçlendirin (plank, kürek çekme).\n'
            '• Başınızın tepesinden bir ip yukarı çekiyormuş gibi düşünün.\n'
            '• İnce bir yastıkla sırtüstü uyuyun.',
      },
    ],
    'references': [
      'Reilly T ve ark. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Boy Büyümesi: Mitler ve Gerçekler',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Mit: "Genetik Her Şeydir"',
        'body':
            'GERÇEK: Genetik nihai boyun %60–80\'ini belirler. Kalan %20–40 '
            'beslenme, uyku ve egzersizle şekillenir. Güney Kore ve '
            'Hollanda\'da beslenme iyileşince birkaç nesil içinde ortalama '
            'boy 10–15 cm arttı — aynı gen havuzu, farklı beslenme.',
      },
      {
        'header': 'Mit: "Esneme Kalıcı Olarak Uzatır"',
        'body':
            'GERÇEK: Esneme esnekliği artırır ve omurga sıkışmasını azaltır; '
            'bu da 1–3 cm uzun ölçülmenizi sağlayabilir. Ancak kemikleri '
            'uzatmaz. Kazanımlar duruş düzeltmesinden gelir.',
      },
      {
        'header': 'Mit: "Süt Sizi Uzatır"',
        'body':
            'GERÇEK: Süt kalsiyum, protein ve D vitamini açısından zengindir. '
            'Ama tek başına yeterli değil. Çinko, A vitamini, demir ve fosfor '
            'da gereklidir. Büyüme tek bir besin değil, besin ekibi ister.',
      },
      {
        'header': 'Mit: "18 Yaşında Büyüme Durur"',
        'body':
            'GERÇEK: Çoğu insan 18\'de büyümesini tamamlar, ancak özellikle '
            'geç ergenlik yaşayan erkeklerde 20–22 yaşına kadar büyüme '
            'sürebilir. Büyüme plakası kapanması kişiden kişiye değişir.',
      },
      {
        'header': 'Mit: "Ağırlık Büyümeyi Durdurur"',
        'body':
            'GERÇEK: Doğru teknikle yapılan orta yoğunluktaki ağırlık '
            'antrenmanı ergenler için güvenlidir ve HGH artırıp kemikleri '
            'güçlendirerek büyümeyi destekler. Mit, yanlış teknikle yapılan '
            'nadir yaralanmalardan kaynaklanmaktadır.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Büyüme Pencerenizi Maksimize Edin',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Büyüme Atılımlarını Anlamak',
        'body':
            'Boy uzaması düzenli değil, atılımlar halinde olur. İki büyük atılım:\n\n'
            '1. Bebeklikten 2 yaşa kadar (ilk yılda ~25 cm).\n'
            '2. Ergenlik (kızlar: ~yılda 8–10 cm; erkekler: ~yılda 10–12 cm).\n\n'
            'Atılımlar arasında çocuklar yılda yaklaşık 5–6 cm uzar.',
      },
      {
        'header': 'Ergenlik Zamanlaması Çok Önemli',
        'body':
            'Erken olgunlaşanlar hızlı büyür ama daha erken durur. Geç '
            'olgunlaşanlar başta yavaşlar ama daha uzun süre büyüyerek '
            'çoğunlukla daha uzun olur. Arkadaşlarınız şimdi daha uzunsa, '
            'henüz doruk noktanıza ulaşmamış olabilirsiniz.',
      },
      {
        'header': 'Her Yaşta Ne Yapmalısınız?',
        'body':
            '8–12 yaş: Temel oluşturun.\n'
            '• Kalsiyum ve proteinli dengeli beslenme. 10+ saat uyku.\n\n'
            '13–16 yaş: Kritik pencere.\n'
            '• 9+ saat uyku. Sprint ve zıplama egzersizleri.\n'
            '• Günde 1.300 mg kalsiyum, 1,2–1,5 g/kg protein.\n\n'
            '17–20 yaş: Son fırsat.\n'
            '• Mükemmel beslenme, uyku, duruş egzersizleri.',
      },
      {
        'header': 'Büyüme Atılımının Belirtileri',
        'body':
            '• Ayak numarası boydan önce artar.\n'
            '• Eller ve ayaklar orantısız büyük görünür.\n'
            '• Artmış iştah ve açlık hissi.\n'
            '• Büyüme ağrıları (özellikle geceleri bacak ağrısı).\n'
            '• Kıyafet bedeninin hızla değişmesi.\n\n'
            'Bu belirtileri fark ettiğinizde uyku ve beslenmeye çift yatırım yapın.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── GERMAN ────────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesDe = [
  {
    'id': 'article_hgh',
    'title': 'Was ist Wachstumshormon?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Dein Wachstumsmotor: HGH',
        'body':
            'Menschliches Wachstumshormon (HGH) ist ein kleines Protein, das '
            'von der Hypophyse am Hirnstamm produziert wird. HGH ist das '
            'wichtigste Hormon für das Körperwachstum im Kindes- und '
            'Jugendalter. Es signalisiert Knochen, Muskeln und Organen zu wachsen.',
      },
      {
        'header': 'Wie Wächst der Körper?',
        'body':
            'Die Hypophyse schüttet HGH in Pulsen aus, besonders stark im '
            'Tiefschlaf und direkt nach intensivem Sport. Der Hypothalamus '
            'steuert diese Pulse mit GHRH (Ausschüttung) und Somatostatin '
            '(Hemmung).',
      },
      {
        'header': 'Wann erreicht HGH seinen Höchstwert?',
        'body':
            'HGH-Spiegel sind in der Pubertät am höchsten. Bei Jungen '
            'typischerweise zwischen 13–15 Jahren, bei Mädchen zwischen '
            '11–13 Jahren. Nach der Wachstumsphase sinkt die HGH-Produktion '
            'ab 20 Jahren pro Jahrzehnt um ca. 14 %.',
      },
      {
        'header': 'HGH natürlich steigern',
        'body':
            '1. Täglich 8–10 Stunden schlafen (Tiefschlaf = stärkste HGH-Pulse).\n'
            '2. Intensiv trainieren — Sprint und Krafttraining fördern HGH.\n'
            '3. Genug Protein essen — Arginin und Ornithin stimulieren HGH.\n'
            '4. Vor dem Schlafen keinen Zucker — Blutzucker unterdrückt HGH.',
      },
      {
        'header': 'Was senkt HGH?',
        'body':
            '• Chronischer Schlafmangel.\n'
            '• Übermäßiges Körperfett, besonders am Bauch.\n'
            '• Viel Zucker und verarbeitete Lebensmittel.\n'
            '• Chronischer Stress (erhöht Kortisol, senkt HGH).\n'
            '• Bewegungsmangel.',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'Wie funktionieren Wachstumsfugen?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'Was sind Wachstumsfugen?',
        'body':
            'Wachstumsfugen (Epiphysenfugen) sind dünne Knorpelschichten '
            'nahe den Enden langer Knochen. Nur hier wird neues Knochengewebe '
            'angelagert. Solange sie offen (nicht verknöchert) sind, '
            'kann der Körper weiter wachsen.',
      },
      {
        'header': 'Wie werden Knochen länger?',
        'body':
            'In jeder Wachstumsfuge teilen sich Chondrozyten ständig. Neue '
            'Knorpelzellen schieben ältere in Richtung Knochenschaft, wo sie '
            'durch Ossifikation zu hartem Knochen werden. Dieser Zyklus '
            'verlängert Beine und Wirbelsäule.',
      },
      {
        'header': 'Wann schließen sich Wachstumsfugen?',
        'body':
            'Der Verschluss wird hauptsächlich durch Sexualhormone ausgelöst:\n\n'
            '• Mädchen: Verschluss beginnt ca. mit 14–16 Jahren.\n'
            '• Jungen: Verschluss beginnt ca. mit 16–18 Jahren.\n'
            '• Manche Fugen schließen sich erst mit 25 Jahren vollständig.\n\n'
            'Ein Hand-/Handgelenk-Röntgenbild zeigt das verbleibende Potenzial.',
      },
      {
        'header': 'Einflussfaktoren auf den Verschluss',
        'body':
            '• Frühe Pubertät → früherer Verschluss, weniger Wachstumszeit.\n'
            '• Mangelernährung → verzögerter Verschluss, aber langsames Wachstum.\n'
            '• Fettleibigkeit → mehr Östrogen kann Verschluss beschleunigen.\n'
            '• Gute Ernährung und Schlaf halten gesunde Fugenaktivität aufrecht.',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Schlaf & Wachstum: Die Wissenschaft',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Warum Schlaf unverzichtbar ist',
        'body':
            'Bis zu 75 % des täglichen Wachstumshormons werden im Schlaf '
            'ausgeschüttet. Kein Sport und keine Ernährung können schlechten '
            'Schlaf vollständig kompensieren. Der Körper baut Knochen auf '
            'und repariert Gewebe während des Schlafs.',
      },
      {
        'header': 'Schlafzyklen und HGH-Ausschüttung',
        'body':
            'Eine typische Nacht hat 4–6 Schlafzyklen à 90 Minuten. Die '
            'stärksten HGH-Pulse treten im Tiefschlaf (Phase 3) der ersten '
            '1–2 Zyklen auf. Spätes Zubettgehen oder häufiges Aufwachen '
            'lässt diese kritischen Pulse aus.',
      },
      {
        'header': 'Wie viel Schlaf braucht man?',
        'body':
            '• 6–12 Jahre: 9–12 Stunden pro Nacht.\n'
            '• 13–15 Jahre: 9–10 Stunden pro Nacht.\n'
            '• 16–18 Jahre: 8–10 Stunden pro Nacht.\n'
            '• 19–25 Jahre: 7–9 Stunden pro Nacht.\n\n'
            'In aktiven Wachstumsphasen die oberen Werte anstreben.',
      },
      {
        'header': 'Tipps für besseren Schlaf',
        'body':
            '1. Täglich zur gleichen Zeit schlafen und aufstehen.\n'
            '2. Bildschirme 30 Minuten vor dem Schlafen ausschalten (Blaulicht hemmt Melatonin).\n'
            '3. Raum kühl (18–20 °C) und dunkel halten.\n'
            '4. Ab 14 Uhr keinen Koffein und 2 Stunden vor dem Schlafen keine schweren Mahlzeiten.\n'
            '5. Leichtes Dehnen vor dem Schlafen hilft beim Entspannen.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Ernährung für maximales Wachstum',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Warum Ernährung für die Körpergröße wichtig ist',
        'body':
            'Gene bestimmen das Wachstumspotenzial, die Ernährung entscheidet, '
            'ob man es erreicht. Verbesserte Ernährung hat die durchschnittliche '
            'Körpergröße in vielen Ländern um bis zu 10 cm erhöht.',
      },
      {
        'header': 'Kalzium — der Knochenbaustoff',
        'body':
            'Kalzium macht ca. 70 % des Knochengewebes aus. In der '
            'Hauptwachstumsphase werden täglich 1.000–1.300 mg benötigt. '
            'Top-Quellen: Milch, Joghurt, Käse, Brokkoli, Mandeln. '
            'Zusammen mit Vitamin D am besten aufgenommen.',
      },
      {
        'header': 'Protein — der Wachstumstreibstoff',
        'body':
            'Jugendliche brauchen täglich ca. 1,0–1,5 g Protein pro kg '
            'Körpergewicht. Arginin stimuliert besonders die HGH-Ausschüttung. '
            'Top-Quellen: Eier, Huhn, Fisch, Linsen, griechischer Joghurt.',
      },
      {
        'header': 'Wichtige Vitamine und Mineralstoffe',
        'body':
            '• Vitamin D: 600–1.000 IU täglich für Kalziumaufnahme.\n'
            '• Zink: 8–11 mg/Tag für Zellteilung und Wachstum.\n'
            '• Vitamin A: unterstützt Knochenerneuerung (Karotten, Süßkartoffeln).\n'
            '• Eisen: 8–15 mg/Tag, transportiert Sauerstoff zu wachsendem Gewebe.\n'
            '• Phosphor & Magnesium: Mineralisieren Knochen zusammen mit Kalzium.',
      },
      {
        'header': 'Was zu vermeiden ist',
        'body':
            '• Viel Zucker und Limonade — schwächt Knochen und hemmt HGH.\n'
            '• Extreme Diäten — hemmt Wachstum.\n'
            '• Zu viel Koffein — beeinträchtigt Kalziumaufnahme.\n'
            '• Hochverarbeitete Lebensmittel — arm an Mikronährstoffen.',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Sport & Körpergröße: Die Wissenschaft',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Kann Sport größer machen?',
        'body':
            'Sport allein kann die genetische Körpergrößengrenze nicht '
            'verändern, hilft aber, das volle Potenzial zu erreichen. '
            'Körperliche Aktivität stimuliert HGH, stärkt Knochen '
            'und verbessert die Körperhaltung.',
      },
      {
        'header': 'Belastungsübungen und Wachstumsfugen',
        'body':
            'Laufen, Springen und Basketball erzeugen mechanischen Druck '
            'auf Wachstumsfugen und regen die Chondrozytenaktivität an. '
            'Sportler in Sprung- und Laufsportarten haben oft eine höhere '
            'Knochenmineraldichte.',
      },
      {
        'header': 'Beste Übungen für Wachstum',
        'body':
            '1. Sprungübungen: Springseil, Box-Jumps — stimuliert Beinwachstumsfugen.\n'
            '2. Sprint: löst starke HGH-Pulse aus.\n'
            '3. Schwimmen: Ganzkörperdehnung mit geringer Belastung.\n'
            '4. Hängen & Klimmzüge: dekomprimiert die Wirbelsäule.\n'
            '5. Yoga/dynamisches Dehnen: verbessert Körperhaltung.\n'
            '6. Moderates Krafttraining: unterstützt Knochenwachstum.',
      },
      {
        'header': 'HGH-Reaktion auf Sport',
        'body':
            'Hochintensiver Sport kann HGH 1–2 Stunden nach dem Training '
            'um 300–500 % erhöhen. Schlüsselfaktoren:\n\n'
            '• Intensität > 70 % der Maximalleistung.\n'
            '• Mindestens 10–20 Minuten Dauer.\n'
            '• 60–90 Sekunden Pause zwischen den Sätzen.',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Körperhaltung & versteckte Zentimeter',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Wie Körperhaltung die Größe beeinflusst',
        'body':
            'Schlechte Haltung kann dich 2–5 cm kleiner erscheinen lassen. '
            'Runde Schultern und vorgebeugter Kopf komprimieren die '
            'Wirbelsäule. Aufrecht zu stehen kann sofort Zentimeter '
            'zur gemessenen Größe hinzufügen.',
      },
      {
        'header': 'Wirbelkompression im Tagesverlauf',
        'body':
            'Schwerkraft komprimiert die Bandscheiben tagsüber. Morgens bist '
            'du am größten, abends am kleinsten — der Unterschied beträgt '
            '1,5–2,5 cm. Schlechte Haltung und schwache Rumpfmuskeln '
            'verstärken diesen Effekt.',
      },
      {
        'header': 'Dekompressionsübungen',
        'body':
            '1. Hängen (30–60 Sek.) — Wirbelsäule durch Schwerkraft dehnen.\n'
            '2. Katze-Kuh-Dehnung — Rücken in und aus dem Hohlkreuz auf allen Vieren.\n'
            '3. Kobra-Dehnung — aus der Bauchlage Brust anheben.\n'
            '4. Kindshaltung — nach vorne strecken.\n'
            '5. Wandengel — Haltungsmuskulatur kräftigen.',
      },
      {
        'header': 'Langfristige Haltungsgewohnheiten',
        'body':
            '• Ergonomischer Arbeitsplatz — Bildschirm auf Augenhöhe.\n'
            '• Alle 30 Minuten Sitzen eine 2-minütige Haltungspause.\n'
            '• Rumpf und Rücken stärken (Planke, Rudern).\n'
            '• Stell dir vor, ein Faden zieht deinen Kopf nach oben.\n'
            '• Auf dem Rücken mit dünnem Kissen schlafen.',
      },
    ],
    'references': [
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Körpergröße: Mythen vs. Fakten',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Mythos: „Gene bestimmen alles"',
        'body':
            'FAKT: Gene bestimmen 60–80 % der endgültigen Größe. Die übrigen '
            '20–40 % werden von Ernährung, Schlaf und Sport beeinflusst. '
            'In Südkorea und den Niederlanden stieg die Durchschnittsgröße '
            'durch bessere Ernährung in Generationen um 10–15 cm.',
      },
      {
        'header': 'Mythos: „Dehnen macht dauerhaft größer"',
        'body':
            'FAKT: Dehnen verbessert Körperhaltung und reduziert '
            'Wirbelkompression, was 1–3 cm mehr beim Messen bedeuten kann. '
            'Es verlängert aber keine Knochen. Gewinne kommen aus '
            'Haltungsverbesserung.',
      },
      {
        'header': 'Mythos: „Milch allein macht groß"',
        'body':
            'FAKT: Milch liefert Kalzium, Protein und Vitamin D. Aber man '
            'braucht auch Zink, Vitamin A, Eisen und Phosphor. Wachstum '
            'erfordert ein Team von Nährstoffen.',
      },
      {
        'header': 'Mythos: „Mit 18 hört das Wachstum auf"',
        'body':
            'FAKT: Die meisten Menschen sind mit 18 ausgewachsen, aber manche — '
            'besonders spät pubertäre Männer — wachsen bis 20–22 Jahre. '
            'Der Verschluss der Wachstumsfugen variiert individuell.',
      },
      {
        'header': 'Mythos: „Gewichte hemmen Wachstum bei Teenagern"',
        'body':
            'FAKT: Gut betreutes Krafttraining ist für Jugendliche sicher '
            'und fördert Wachstum durch mehr HGH und stärkere Knochen. '
            'Der Mythos entstand durch seltene Verletzungen bei falscher Technik.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Dein Wachstumsfenster maximieren',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Wachstumsschübe verstehen',
        'body':
            'Körperwachstum ist nicht gleichmäßig, es geschieht in Schüben:\n\n'
            '1. Säuglingszeit bis 2 Jahre (~25 cm im ersten Jahr).\n'
            '2. Pubertät (Mädchen: ~8–10 cm/Jahr; Jungen: ~10–12 cm/Jahr).\n\n'
            'Zwischen Schüben wachsen Kinder etwa 5–6 cm pro Jahr.',
      },
      {
        'header': 'Pubertätszeitpunkt macht den Unterschied',
        'body':
            'Früh Reifende wachsen schnell, aber hören früher auf. Spät '
            'Reifende wachsen anfangs langsamer, werden aber oft größer. '
            'Wenn Freunde jetzt größer sind, hast du vielleicht deinen '
            'Wachstumsschub noch vor dir.',
      },
      {
        'header': 'Was in jedem Alter zu tun ist',
        'body':
            '8–12 Jahre: Grundlage aufbauen.\n'
            '• Ausgewogene Ernährung mit Kalzium und Protein. 10+ Stunden Schlaf.\n\n'
            '13–16 Jahre: Das kritische Fenster.\n'
            '• 9+ Stunden Schlaf. Sprint- und Sprungübungen.\n'
            '• 1.300 mg Kalzium, 1,2–1,5 g/kg Protein täglich.\n\n'
            '17–20 Jahre: Letzte Chance.\n'
            '• Exzellente Ernährung, Schlaf, Haltungsübungen.',
      },
      {
        'header': 'Anzeichen eines kommenden Wachstumsschubs',
        'body':
            '• Schuhgröße steigt vor der Körpergröße.\n'
            '• Hände und Füße wirken unverhältnismäßig groß.\n'
            '• Gesteigerter Appetit und Hunger.\n'
            '• Wachstumsschmerzen (Beinschmerzen nachts).\n'
            '• Schnell verändernde Kleidungsgrößen.\n\n'
            'Bei diesen Zeichen Schlaf und Ernährung verdoppeln.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── FRENCH ────────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesFr = [
  {
    'id': 'article_hgh',
    'title': 'Qu\'est-ce que l\'hormone de croissance?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Ton moteur de croissance: HGH',
        'body':
            'L\'hormone de croissance humaine (HGH) est une petite protéine '
            'produite par l\'hypophyse à la base du cerveau. C\'est l\'hormone '
            'la plus importante pour la croissance osseuse pendant l\'enfance '
            'et l\'adolescence. Elle signale aux os, aux muscles et aux organes '
            'de grandir.',
      },
      {
        'header': 'Comment fonctionne l\'hypophyse?',
        'body':
            'L\'hypophyse libère la HGH par impulsions, surtout pendant le '
            'sommeil profond et juste après un exercice intense. '
            'L\'hypothalamus contrôle ces impulsions via la GHRH (stimule) '
            'et la somatostatine (inhibe).',
      },
      {
        'header': 'Quand la HGH atteint-elle son pic?',
        'body':
            'Les niveaux de HGH sont les plus élevés pendant la puberté. '
            'Chez les garçons, le pic se situe généralement entre 13 et 15 ans; '
            'chez les filles, entre 11 et 13 ans. Ensuite, la production '
            'diminue d\'environ 14 % par décennie après 20 ans.',
      },
      {
        'header': 'Comment augmenter la HGH naturellement',
        'body':
            '1. Dormir 8–10 heures par nuit (sommeil profond = pics de HGH).\n'
            '2. S\'entraîner intensément — sprints et musculation libèrent la HGH.\n'
            '3. Manger assez de protéines — l\'arginine stimule la HGH.\n'
            '4. Éviter le sucre avant le coucher — il supprime la HGH pendant le sommeil.',
      },
      {
        'header': 'Ce qui diminue la HGH',
        'body':
            '• Manque de sommeil chronique.\n'
            '• Excès de graisse corporelle, surtout abdominale.\n'
            '• Alimentation sucrée et aliments transformés.\n'
            '• Stress chronique (augmente le cortisol, supprime la HGH).\n'
            '• Mode de vie sédentaire.',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'Comment fonctionnent les cartilages de croissance?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'Que sont les cartilages de croissance?',
        'body':
            'Les cartilages de croissance (plaques épiphysaires) sont de '
            'minces couches de cartilage près des extrémités des os longs. '
            'C\'est là que le nouveau tissu osseux est ajouté. Tant qu\'ils '
            'restent ouverts (non fusionnés), on peut encore grandir.',
      },
      {
        'header': 'Comment les os s\'allongent',
        'body':
            'Dans chaque cartilage de croissance, les chondrocytes se divisent '
            'constamment. Les nouvelles cellules cartilagineux poussent les '
            'anciennes vers la diaphyse où elles sont remplacées par de '
            'l\'os dur par ossification.',
      },
      {
        'header': 'Quand les cartilages se ferment-ils?',
        'body':
            'La fermeture est principalement déclenchée par les hormones sexuelles:\n\n'
            '• Filles: fusion vers 14–16 ans.\n'
            '• Garçons: fusion vers 16–18 ans.\n'
            '• Certaines plaques ne se ferment qu\'à 25 ans.\n\n'
            'Une radiographie du poignet (âge osseux) révèle le potentiel restant.',
      },
      {
        'header': 'Facteurs influençant la fermeture',
        'body':
            '• Puberté précoce → fermeture précoce, moins de temps de croissance.\n'
            '• Malnutrition → fermeture retardée mais croissance lente.\n'
            '• Obésité → l\'œstrogène peut accélérer la fermeture.\n'
            '• Bonne nutrition et sommeil maintiennent une activité saine.',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Sommeil et croissance: la science',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Pourquoi le sommeil est indispensable',
        'body':
            'Jusqu\'à 75 % de l\'hormone de croissance quotidienne est libérée '
            'pendant le sommeil. Aucun sport ni alimentation ne peut compenser '
            'un mauvais sommeil. Le corps construit les os et répare les tissus '
            'pendant le sommeil.',
      },
      {
        'header': 'Cycles de sommeil et libération de HGH',
        'body':
            'Une nuit typique comporte 4–6 cycles de 90 minutes. Les pics de '
            'HGH les plus importants se produisent en sommeil profond (stade 3) '
            'des 1–2 premiers cycles. Se coucher tard ou se réveiller souvent '
            'fait manquer ces pics critiques.',
      },
      {
        'header': 'Combien de sommeil faut-il?',
        'body':
            '• 6–12 ans: 9–12 heures par nuit.\n'
            '• 13–15 ans: 9–10 heures par nuit.\n'
            '• 16–18 ans: 8–10 heures par nuit.\n'
            '• 19–25 ans: 7–9 heures par nuit.\n\n'
            'Viser le haut de la fourchette en période de croissance active.',
      },
      {
        'header': 'Conseils pour mieux dormir',
        'body':
            '1. Se coucher et se lever à la même heure chaque jour.\n'
            '2. Éteindre les écrans 30 minutes avant le coucher (lumière bleue supprime la mélatonine).\n'
            '3. Chambre fraîche (18–20 °C) et sombre.\n'
            '4. Pas de caféine après 14h ni de repas lourds 2h avant de dormir.\n'
            '5. Étirements légers avant le coucher pour relaxer.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Nutrition pour une croissance maximale',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Pourquoi l\'alimentation compte pour la taille',
        'body':
            'La génétique fixe le potentiel de taille, l\'alimentation détermine '
            'si on l\'atteint. Une meilleure nutrition a augmenté la taille '
            'moyenne de 10 cm dans de nombreux pays au cours du siècle dernier.',
      },
      {
        'header': 'Calcium — le constructeur osseux',
        'body':
            'Le calcium constitue 70 % du tissu osseux. Pendant la croissance, '
            'il faut 1 000–1 300 mg par jour. Meilleures sources: lait, yaourt, '
            'fromage, brocoli, amandes. À consommer avec la vitamine D.',
      },
      {
        'header': 'Protéines — le carburant de la croissance',
        'body':
            'Les adolescents ont besoin de 1,0–1,5 g de protéines par kg de '
            'poids corporel par jour. L\'arginine stimule particulièrement la HGH. '
            'Meilleures sources: œufs, poulet, poisson, lentilles, yaourt grec.',
      },
      {
        'header': 'Vitamines et minéraux essentiels',
        'body':
            '• Vitamine D: 600–1 000 UI/jour pour l\'absorption du calcium.\n'
            '• Zinc: 8–11 mg/jour pour la division cellulaire.\n'
            '• Vitamine A: soutient le remodelage osseux (carottes, patates douces).\n'
            '• Fer: 8–15 mg/jour, transporte l\'oxygène vers les tissus.\n'
            '• Phosphore & Magnésium: minéralisent l\'os avec le calcium.',
      },
      {
        'header': 'Ce qu\'il faut éviter',
        'body':
            '• Excès de sucre et sodas — réduisent le calcium et la HGH.\n'
            '• Régimes extrêmes — freinent la croissance.\n'
            '• Trop de caféine — perturbe l\'absorption du calcium.\n'
            '• Aliments ultra-transformés — pauvres en micronutriments.',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Sport et taille: la science',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Le sport peut-il vraiment faire grandir?',
        'body':
            'Le sport ne change pas le plafond génétique, mais aide à '
            'atteindre son plein potentiel. L\'activité physique stimule la '
            'HGH, renforce les os et améliore la posture.',
      },
      {
        'header': 'Exercices à impact et cartilages de croissance',
        'body':
            'La course, les sauts et le basketball créent des contraintes '
            'mécaniques sur les cartilages de croissance, stimulant les '
            'chondrocytes. Les jeunes sportifs pratiquant ces sports ont '
            'souvent une meilleure densité osseuse.',
      },
      {
        'header': 'Meilleurs exercices pour la croissance',
        'body':
            '1. Sauts: corde à sauter, box jumps — stimule les cartilages des jambes.\n'
            '2. Sprint: déclenche de grandes libérations de HGH.\n'
            '3. Natation: étirement complet avec faible impact.\n'
            '4. Suspension & tractions: décompresse la colonne.\n'
            '5. Yoga/étirements dynamiques: améliore la posture.\n'
            '6. Musculation modérée: soutient la croissance osseuse.',
      },
      {
        'header': 'Réponse HGH à l\'exercice',
        'body':
            'L\'exercice intense peut augmenter la HGH de 300–500 % pendant '
            '1–2 heures après l\'entraînement:\n\n'
            '• Intensité > 70 % de l\'effort maximal.\n'
            '• Durée d\'au moins 10–20 minutes.\n'
            '• Repos 60–90 secondes entre les séries.',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Posture et centimètres cachés',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Comment la posture affecte la taille',
        'body':
            'Une mauvaise posture peut faire paraître 2–5 cm plus petit. '
            'Épaules arrondies et tête en avant compriment la colonne. '
            'Se tenir droit peut instantanément «ajouter» des centimètres '
            'à la taille mesurée.',
      },
      {
        'header': 'Compression vertébrale dans la journée',
        'body':
            'La gravité comprime les disques intervertébraux tout au long '
            'de la journée. On est le plus grand le matin et le plus petit '
            'le soir — une différence de 1,5–2,5 cm. Mauvaise posture '
            'et muscles du tronc faibles aggravent cela.',
      },
      {
        'header': 'Exercices de décompression',
        'body':
            '1. Suspension (30–60 sec) — étire la colonne par la gravité.\n'
            '2. Chat-vache — alterner dos creusé et dos rond à quatre pattes.\n'
            '3. Cobra — soulever la poitrine depuis la position ventrale.\n'
            '4. Posture de l\'enfant — se pencher en avant.\n'
            '5. Anges muraux — renforcer les muscles posturaux.',
      },
      {
        'header': 'Habitudes posturales à long terme',
        'body':
            '• Bureau ergonomique — écran à hauteur des yeux.\n'
            '• Pause posture de 2 minutes toutes les 30 minutes.\n'
            '• Renforcer le tronc et le dos (gainage, rowing).\n'
            '• Imaginer un fil tirant le sommet de la tête vers le haut.\n'
            '• Dormir sur le dos avec un oreiller fin.',
      },
    ],
    'references': [
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Croissance: mythes vs. faits',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Mythe: «La génétique, c\'est tout»',
        'body':
            'FAIT: La génétique représente 60–80 % de la taille finale. '
            'Les 20–40 % restants dépendent de l\'alimentation, du sommeil '
            'et du sport. En Corée du Sud et aux Pays-Bas, la taille moyenne '
            'a augmenté de 10–15 cm en quelques générations grâce à '
            'une meilleure nutrition.',
      },
      {
        'header': 'Mythe: «Les étirements font grandir définitivement»',
        'body':
            'FAIT: Les étirements améliorent la posture et réduisent la '
            'compression vertébrale, ce qui peut donner 1–3 cm de plus. '
            'Mais ils n\'allongent pas les os. Les gains viennent de la '
            'correction posturale.',
      },
      {
        'header': 'Mythe: «Le lait seul fait grandir»',
        'body':
            'FAIT: Le lait apporte calcium, protéines et vitamine D. Mais '
            'il faut aussi du zinc, vitamine A, fer et phosphore. '
            'La croissance nécessite une équipe de nutriments.',
      },
      {
        'header': 'Mythe: «On arrête de grandir à 18 ans»',
        'body':
            'FAIT: La plupart des gens finissent de grandir à 18 ans, mais '
            'certains — surtout les garçons à puberté tardive — continuent '
            'jusqu\'à 20–22 ans. La fermeture des cartilages varie.',
      },
      {
        'header': 'Mythe: «Les poids bloquent la croissance»',
        'body':
            'FAIT: La musculation bien supervisée est sûre pour les ados '
            'et soutient la croissance en augmentant la HGH et en '
            'renforçant les os. Le mythe vient de rares blessures '
            'dues à une mauvaise technique.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Maximiser ta fenêtre de croissance',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Comprendre les poussées de croissance',
        'body':
            'La croissance en taille n\'est pas régulière:\n\n'
            '1. Nourrisson à 2 ans (~25 cm la première année).\n'
            '2. Puberté (filles: ~8–10 cm/an; garçons: ~10–12 cm/an).\n\n'
            'Entre les poussées, les enfants grandissent d\'environ 5–6 cm par an.',
      },
      {
        'header': 'Le timing de la puberté compte',
        'body':
            'Les précoces grandissent vite mais s\'arrêtent plus tôt. Les '
            'tardifs grandissent plus lentement au début mais finissent '
            'souvent plus grands. Si tes amis sont plus grands maintenant, '
            'tu n\'as peut-être pas encore eu ta poussée de croissance.',
      },
      {
        'header': 'Que faire à chaque âge',
        'body':
            '8–12 ans: Construire les bases.\n'
            '• Alimentation équilibrée riche en calcium et protéines. 10+ h de sommeil.\n\n'
            '13–16 ans: La fenêtre critique.\n'
            '• 9+ heures de sommeil. Exercices de sprint et de saut.\n'
            '• 1 300 mg de calcium, 1,2–1,5 g/kg de protéines par jour.\n\n'
            '17–20 ans: Dernière chance.\n'
            '• Excellente nutrition, sommeil, exercices de posture.',
      },
      {
        'header': 'Signes d\'une poussée de croissance',
        'body':
            '• La pointure augmente avant la taille.\n'
            '• Mains et pieds paraissent disproportionnés.\n'
            '• Appétit et faim accrus.\n'
            '• Douleurs de croissance (jambes la nuit).\n'
            '• Changement rapide de taille de vêtements.\n\n'
            'Quand tu remarques ces signes, mise encore plus sur le sommeil et la nutrition.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── SPANISH ───────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesEs = [
  {
    'id': 'article_hgh',
    'title': '¿Qué es la hormona del crecimiento?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Tu motor de crecimiento: HGH',
        'body':
            'La hormona de crecimiento humana (HGH) es una pequeña proteína '
            'producida por la glándula pituitaria en la base del cerebro. '
            'Es la hormona más importante para aumentar la estatura durante '
            'la infancia y la adolescencia.',
      },
      {
        'header': 'Cómo funciona la pituitaria',
        'body':
            'La pituitaria libera HGH en pulsos, especialmente durante el '
            'sueño profundo y justo después del ejercicio intenso. '
            'El hipotálamo controla estos pulsos con GHRH (estimula) '
            'y somatostatina (inhibe).',
      },
      {
        'header': '¿Cuándo alcanza su pico la HGH?',
        'body':
            'Los niveles de HGH son más altos durante la pubertad. En chicos, '
            'el pico suele ser entre los 13 y 15 años; en chicas, entre '
            '11 y 13 años. Después, la producción disminuye ~14 % por '
            'década a partir de los 20 años.',
      },
      {
        'header': 'Cómo aumentar la HGH naturalmente',
        'body':
            '1. Dormir 8–10 horas (sueño profundo = mayores pulsos de HGH).\n'
            '2. Ejercicio intenso — sprints y musculación liberan HGH.\n'
            '3. Suficiente proteína — la arginina estimula la HGH.\n'
            '4. Evitar azúcar antes de dormir — el azúcar en sangre suprime la HGH.',
      },
      {
        'header': '¿Qué reduce la HGH?',
        'body':
            '• Falta crónica de sueño.\n'
            '• Exceso de grasa corporal, especialmente abdominal.\n'
            '• Mucha azúcar y alimentos procesados.\n'
            '• Estrés crónico (sube el cortisol, baja la HGH).\n'
            '• Estilo de vida sedentario.',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': '¿Cómo funcionan las placas de crecimiento?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': '¿Qué son las placas de crecimiento?',
        'body':
            'Las placas de crecimiento (epifisarias) son capas delgadas de '
            'cartílago cerca de los extremos de los huesos largos. Solo aquí '
            'se añade nuevo tejido óseo. Mientras permanezcan abiertas, '
            'se puede seguir creciendo.',
      },
      {
        'header': 'Cómo se alargan los huesos',
        'body':
            'Los condrocitos se dividen constantemente en cada placa. Las '
            'nuevas células cartilaginosas empujan a las antiguas hacia la '
            'diáfisis, donde se convierten en hueso duro por osificación.',
      },
      {
        'header': '¿Cuándo se cierran las placas?',
        'body':
            'El cierre es desencadenado por las hormonas sexuales:\n\n'
            '• Chicas: fusión hacia los 14–16 años.\n'
            '• Chicos: fusión hacia los 16–18 años.\n'
            '• Algunas placas no se cierran hasta los 25 años.\n\n'
            'Una radiografía de mano/muñeca muestra el potencial restante.',
      },
      {
        'header': 'Factores que afectan al cierre',
        'body':
            '• Pubertad temprana → cierre temprano, menos tiempo de crecimiento.\n'
            '• Desnutrición → cierre tardío pero crecimiento lento.\n'
            '• Obesidad → más estrógeno puede acelerar el cierre.\n'
            '• Buena nutrición y sueño mantienen la actividad sana.',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Sueño y crecimiento: la ciencia',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Por qué el sueño es imprescindible',
        'body':
            'Hasta el 75 % de la hormona de crecimiento diaria se libera '
            'durante el sueño. Ningún ejercicio ni dieta puede compensar '
            'un sueño deficiente. El cuerpo construye hueso y repara tejidos '
            'mientras dormimos.',
      },
      {
        'header': 'Ciclos de sueño y liberación de HGH',
        'body':
            'Una noche típica tiene 4–6 ciclos de 90 minutos. Los mayores '
            'pulsos de HGH ocurren en el sueño profundo (fase 3) de los '
            'primeros 1–2 ciclos. Acostarse tarde o despertarse frecuentemente '
            'hace perder estos pulsos críticos.',
      },
      {
        'header': '¿Cuánto sueño necesitas?',
        'body':
            '• 6–12 años: 9–12 horas por noche.\n'
            '• 13–15 años: 9–10 horas por noche.\n'
            '• 16–18 años: 8–10 horas por noche.\n'
            '• 19–25 años: 7–9 horas por noche.\n\n'
            'Apunta al extremo superior si estás en pleno crecimiento.',
      },
      {
        'header': 'Consejos para dormir mejor',
        'body':
            '1. Acostarse y levantarse a la misma hora cada día.\n'
            '2. Apagar pantallas 30 minutos antes de dormir (la luz azul suprime la melatonina).\n'
            '3. Habitación fresca (18–20 °C) y oscura.\n'
            '4. Sin cafeína después de las 14h ni comidas pesadas 2h antes de dormir.\n'
            '5. Estiramientos suaves antes de dormir ayudan a relajarse.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Nutrición para el máximo crecimiento',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Por qué la dieta importa para la estatura',
        'body':
            'La genética marca el potencial de altura; la nutrición determina '
            'si se alcanza. Una mejor alimentación ha aumentado la estatura '
            'media hasta 10 cm en muchos países durante el último siglo.',
      },
      {
        'header': 'Calcio — el constructor óseo',
        'body':
            'El calcio constituye ~70 % del tejido óseo. Durante el crecimiento '
            'se necesitan 1.000–1.300 mg/día. Mejores fuentes: leche, yogur, '
            'queso, brócoli, almendras. Combinarlo con vitamina D para mejor absorción.',
      },
      {
        'header': 'Proteínas — el combustible del crecimiento',
        'body':
            'Los adolescentes necesitan 1,0–1,5 g de proteína por kg de peso '
            'corporal al día. La arginina estimula especialmente la HGH. '
            'Mejores fuentes: huevos, pollo, pescado, lentejas, yogur griego.',
      },
      {
        'header': 'Vitaminas y minerales clave',
        'body':
            '• Vitamina D: 600–1.000 UI/día para absorber calcio.\n'
            '• Zinc: 8–11 mg/día para la división celular.\n'
            '• Vitamina A: apoya la remodelación ósea (zanahoria, boniato).\n'
            '• Hierro: 8–15 mg/día, transporta oxígeno a tejidos en crecimiento.\n'
            '• Fósforo y Magnesio: mineralizan el hueso junto al calcio.',
      },
      {
        'header': 'Qué evitar',
        'body':
            '• Exceso de azúcar y refrescos — reduce calcio y suprime HGH.\n'
            '• Dietas extremas — frena el crecimiento.\n'
            '• Demasiada cafeína — interfiere con la absorción de calcio.\n'
            '• Ultraprocesados — pobres en micronutrientes.',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Ejercicio y estatura: la ciencia',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': '¿Puede el ejercicio hacerte más alto?',
        'body':
            'El ejercicio no cambia el techo genético, pero ayuda a alcanzar '
            'tu potencial máximo. La actividad física estimula la HGH, '
            'fortalece los huesos y mejora la postura.',
      },
      {
        'header': 'Ejercicio de impacto y placas de crecimiento',
        'body':
            'Correr, saltar y el baloncesto crean estrés mecánico en las '
            'placas de crecimiento, estimulando los condrocitos. Los jóvenes '
            'deportistas en estos deportes suelen tener mayor densidad ósea.',
      },
      {
        'header': 'Mejores ejercicios para el crecimiento',
        'body':
            '1. Saltos: comba, box jumps — estimula las placas de las piernas.\n'
            '2. Sprints: desencadena grandes liberaciones de HGH.\n'
            '3. Natación: estiramiento completo con bajo impacto.\n'
            '4. Colgarse y dominadas: descomprime la columna.\n'
            '5. Yoga/estiramientos dinámicos: mejora la postura.\n'
            '6. Musculación moderada: apoya el crecimiento óseo.',
      },
      {
        'header': 'Respuesta de la HGH al ejercicio',
        'body':
            'El ejercicio intenso puede aumentar la HGH un 300–500 % durante '
            '1–2 horas post-entrenamiento:\n\n'
            '• Intensidad > 70 % del esfuerzo máximo.\n'
            '• Duración mínima de 10–20 minutos.\n'
            '• Descanso 60–90 segundos entre series.',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Postura y centímetros ocultos',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Cómo la postura afecta a tu estatura',
        'body':
            'Una mala postura puede hacerte parecer 2–5 cm más bajo de tu '
            'altura real. Hombros caídos y cabeza adelantada comprimen '
            'la columna. Pararse erguido puede «añadir» centímetros al instante.',
      },
      {
        'header': 'Compresión vertebral durante el día',
        'body':
            'La gravedad comprime los discos intervertebrales a lo largo del '
            'día. Eres más alto por la mañana y más bajo por la noche — '
            'diferencia de 1,5–2,5 cm. Mala postura y músculos del core '
            'débiles lo empeoran.',
      },
      {
        'header': 'Ejercicios de descompresión',
        'body':
            '1. Colgarse (30–60 seg) — estirar la columna con la gravedad.\n'
            '2. Estiramiento gato-vaca — arqueary redondear la espalda a cuatro patas.\n'
            '3. Cobra — levantar el pecho desde boca abajo.\n'
            '4. Postura del niño — estirarse hacia adelante.\n'
            '5. Ángeles en la pared — fortalecer los músculos posturales.',
      },
      {
        'header': 'Hábitos posturales a largo plazo',
        'body':
            '• Escritorio ergonómico — pantalla a nivel de los ojos.\n'
            '• Pausa postural de 2 minutos cada 30 minutos sentado.\n'
            '• Fortalecer core y espalda (plancha, remo).\n'
            '• Imaginar un hilo que tira hacia arriba de la cabeza.\n'
            '• Dormir boca arriba con almohada fina.',
      },
    ],
    'references': [
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Crecimiento en altura: mitos vs. hechos',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Mito: «La genética lo es todo»',
        'body':
            'HECHO: La genética determina el 60–80 % de la altura final. '
            'El 20–40 % restante depende de nutrición, sueño y ejercicio. '
            'En Corea del Sur y Países Bajos la altura media subió 10–15 cm '
            'en pocas generaciones con mejor alimentación.',
      },
      {
        'header': 'Mito: «Los estiramientos hacen crecer permanentemente»',
        'body':
            'HECHO: Los estiramientos mejoran la postura y reducen la compresión '
            'vertebral, lo que puede dar 1–3 cm más. Pero no alargan huesos. '
            'Las ganancias vienen de la corrección postural.',
      },
      {
        'header': 'Mito: «La leche sola hace crecer»',
        'body':
            'HECHO: La leche aporta calcio, proteínas y vitamina D. Pero '
            'también se necesita zinc, vitamina A, hierro y fósforo. '
            'El crecimiento requiere un equipo de nutrientes.',
      },
      {
        'header': 'Mito: «Se deja de crecer a los 18»',
        'body':
            'HECHO: La mayoría termina de crecer a los 18, pero algunos — '
            'especialmente chicos con pubertad tardía — siguen hasta los 20–22. '
            'El cierre de las placas varía de persona a persona.',
      },
      {
        'header': 'Mito: «Los pesos frenan el crecimiento»',
        'body':
            'HECHO: El entrenamiento de fuerza bien supervisado es seguro para '
            'adolescentes y apoya el crecimiento. El mito viene de lesiones raras '
            'por mala técnica.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Maximiza tu ventana de crecimiento',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Entender los brotes de crecimiento',
        'body':
            'El crecimiento no es uniforme, ocurre en brotes:\n\n'
            '1. Bebé a 2 años (~25 cm en el primer año).\n'
            '2. Pubertad (chicas: ~8–10 cm/año; chicos: ~10–12 cm/año).\n\n'
            'Entre brotes, los niños crecen ~5–6 cm al año.',
      },
      {
        'header': 'El momento de la pubertad importa',
        'body':
            'Los que maduran pronto crecen rápido pero paran antes. Los tardíos '
            'crecen más despacio al principio pero suelen acabar siendo más altos. '
            'Si tus amigos son más altos ahora, quizás aún no has tenido '
            'tu brote de crecimiento.',
      },
      {
        'header': 'Qué hacer en cada edad',
        'body':
            '8–12 años: Construir la base.\n'
            '• Dieta equilibrada rica en calcio y proteínas. 10+ h de sueño.\n\n'
            '13–16 años: La ventana crítica.\n'
            '• 9+ horas de sueño. Ejercicios de sprint y salto.\n'
            '• 1.300 mg calcio, 1,2–1,5 g/kg proteína al día.\n\n'
            '17–20 años: Última oportunidad.\n'
            '• Excelente nutrición, sueño y ejercicios de postura.',
      },
      {
        'header': 'Señales de un brote de crecimiento',
        'body':
            '• El número de zapato sube antes que la estatura.\n'
            '• Manos y pies parecen desproporcionadamente grandes.\n'
            '• Mayor apetito y hambre.\n'
            '• Dolores de crecimiento (piernas por la noche).\n'
            '• Cambio rápido de talla de ropa.\n\n'
            'Al notar estas señales, refuerza el sueño y la nutrición.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── PORTUGUESE ───────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesPt = [
  {
    'id': 'article_hgh',
    'title': 'O que é o hormônio do crescimento?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Seu motor de crescimento: HGH',
        'body':
            'O hormônio de crescimento humano (HGH) é uma pequena proteína '
            'produzida pela glândula pituitária na base do cérebro. É o '
            'hormônio mais importante para o crescimento durante a infância '
            'e adolescência. Sinaliza para ossos, músculos e órgãos crescerem.',
      },
      {
        'header': 'Como a pituitária funciona',
        'body':
            'A pituitária libera HGH em pulsos, especialmente durante o '
            'sono profundo e logo após exercício intenso. O hipotálamo '
            'controla esses pulsos com GHRH (estimula) e somatostatina (inibe).',
      },
      {
        'header': 'Quando o HGH atinge o pico?',
        'body':
            'Os níveis de HGH são mais altos durante a puberdade. Em meninos, '
            'o pico é geralmente entre 13 e 15 anos; em meninas, entre 11 e 13. '
            'Depois, a produção cai ~14 % por década após os 20 anos.',
      },
      {
        'header': 'Como aumentar o HGH naturalmente',
        'body':
            '1. Dormir 8–10 horas (sono profundo = maiores pulsos de HGH).\n'
            '2. Exercício intenso — sprints e musculação liberam HGH.\n'
            '3. Proteína suficiente — a arginina estimula o HGH.\n'
            '4. Evitar açúcar antes de dormir — glicemia alta suprime o HGH.',
      },
      {
        'header': 'O que reduz o HGH?',
        'body':
            '• Privação crônica de sono.\n'
            '• Excesso de gordura corporal, especialmente abdominal.\n'
            '• Muito açúcar e alimentos processados.\n'
            '• Estresse crônico (aumenta cortisol, reduz HGH).\n'
            '• Estilo de vida sedentário.',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'Como funcionam as placas de crescimento?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'O que são placas de crescimento?',
        'body':
            'As placas de crescimento (epifisárias) são camadas finas de '
            'cartilagem perto das extremidades dos ossos longos. Somente aqui '
            'o novo tecido ósseo é adicionado. Enquanto estiverem abertas '
            '(não fundidas), é possível crescer.',
      },
      {
        'header': 'Como os ossos ficam mais longos',
        'body':
            'Os condrócitos se dividem constantemente em cada placa. Novas '
            'células de cartilagem empurram as mais antigas em direção à '
            'diáfise, onde são substituídas por osso duro por ossificação.',
      },
      {
        'header': 'Quando as placas se fecham?',
        'body':
            'O fechamento é desencadeado pelos hormônios sexuais:\n\n'
            '• Meninas: fusão por volta dos 14–16 anos.\n'
            '• Meninos: fusão por volta dos 16–18 anos.\n'
            '• Algumas placas só fecham completamente aos 25 anos.\n\n'
            'Uma radiografia da mão/pulso mostra o potencial restante.',
      },
      {
        'header': 'Fatores que afetam o fechamento',
        'body':
            '• Puberdade precoce → fechamento precoce, menos tempo de crescimento.\n'
            '• Desnutrição → fechamento tardio, mas crescimento lento.\n'
            '• Obesidade → mais estrogênio pode acelerar o fechamento.\n'
            '• Boa nutrição e sono mantêm atividade saudável das placas.',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Sono e crescimento: a ciência',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Por que o sono é indispensável',
        'body':
            'Até 75 % do hormônio de crescimento diário é liberado durante '
            'o sono. Nenhum exercício ou dieta pode compensar um sono ruim. '
            'O corpo constrói ossos e repara tecidos enquanto dormimos.',
      },
      {
        'header': 'Ciclos de sono e liberação de HGH',
        'body':
            'Uma noite típica tem 4–6 ciclos de 90 minutos. Os maiores pulsos '
            'de HGH ocorrem no sono profundo (fase 3) dos primeiros 1–2 ciclos. '
            'Dormir tarde ou acordar com frequência faz perder esses pulsos.',
      },
      {
        'header': 'Quanto sono você precisa?',
        'body':
            '• 6–12 anos: 9–12 horas por noite.\n'
            '• 13–15 anos: 9–10 horas por noite.\n'
            '• 16–18 anos: 8–10 horas por noite.\n'
            '• 19–25 anos: 7–9 horas por noite.\n\n'
            'Mire no extremo superior se estiver em fase de crescimento ativo.',
      },
      {
        'header': 'Dicas para dormir melhor',
        'body':
            '1. Dormir e acordar no mesmo horário todos os dias.\n'
            '2. Desligar telas 30 min antes de dormir (luz azul suprime melatonina).\n'
            '3. Quarto fresco (18–20 °C) e escuro.\n'
            '4. Sem cafeína após 14h nem refeições pesadas 2h antes de dormir.\n'
            '5. Alongamentos leves antes de dormir ajudam a relaxar.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Nutrição para crescimento máximo',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Por que a dieta importa para a altura',
        'body':
            'A genética define o potencial de altura; a nutrição determina '
            'se ele é alcançado. Uma melhor alimentação aumentou a estatura '
            'média em até 10 cm em muitos países no último século.',
      },
      {
        'header': 'Cálcio — o construtor ósseo',
        'body':
            'O cálcio constitui ~70 % do tecido ósseo. Na fase de crescimento '
            'são necessários 1.000–1.300 mg/dia. Melhores fontes: leite, iogurte, '
            'queijo, brócolis, amêndoas. Combinar com vitamina D para melhor absorção.',
      },
      {
        'header': 'Proteínas — o combustível do crescimento',
        'body':
            'Adolescentes precisam de 1,0–1,5 g de proteína por kg de peso '
            'corporal por dia. A arginina estimula especialmente o HGH. '
            'Melhores fontes: ovos, frango, peixe, lentilhas, iogurte grego.',
      },
      {
        'header': 'Vitaminas e minerais essenciais',
        'body':
            '• Vitamina D: 600–1.000 UI/dia para absorção de cálcio.\n'
            '• Zinco: 8–11 mg/dia para divisão celular e crescimento.\n'
            '• Vitamina A: apoia remodelação óssea (cenoura, batata-doce).\n'
            '• Ferro: 8–15 mg/dia, transporta oxigênio para tecidos em crescimento.\n'
            '• Fósforo e Magnésio: mineralizam ossos junto com o cálcio.',
      },
      {
        'header': 'O que evitar',
        'body':
            '• Muito açúcar e refrigerantes — reduz cálcio e suprime HGH.\n'
            '• Dietas extremas — retarda o crescimento.\n'
            '• Excesso de cafeína — interfere na absorção de cálcio.\n'
            '• Ultra-processados — pobres em micronutrientes.',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Exercício e altura: a ciência',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'O exercício pode fazer você crescer?',
        'body':
            'O exercício não muda o teto genético, mas ajuda a alcançar o '
            'potencial máximo. Atividade física estimula HGH, fortalece '
            'ossos e melhora a postura.',
      },
      {
        'header': 'Exercício de impacto e placas de crescimento',
        'body':
            'Corrida, saltos e basquete criam estresse mecânico nas placas '
            'de crescimento, estimulando os condrócitos. Jovens atletas nessas '
            'modalidades costumam ter maior densidade óssea.',
      },
      {
        'header': 'Melhores exercícios para crescimento',
        'body':
            '1. Saltos: corda, box jumps — estimula as placas das pernas.\n'
            '2. Sprint: desencadeia grandes liberações de HGH.\n'
            '3. Natação: alongamento total com baixo impacto.\n'
            '4. Barra fixa e pull-ups: descomprime a coluna.\n'
            '5. Yoga/alongamentos dinâmicos: melhora a postura.\n'
            '6. Musculação moderada: apoia o crescimento ósseo.',
      },
      {
        'header': 'Resposta do HGH ao exercício',
        'body':
            'Exercício intenso pode aumentar o HGH em 300–500 % por 1–2 horas:\n\n'
            '• Intensidade > 70 % do esforço máximo.\n'
            '• Duração mínima de 10–20 minutos.\n'
            '• Descanso de 60–90 segundos entre séries.',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Postura e centímetros ocultos',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Como a postura afeta sua altura',
        'body':
            'Má postura pode fazer você parecer 2–5 cm mais baixo. Ombros '
            'curvados e cabeça para frente comprimem a coluna. Ficar ereto '
            'pode «adicionar» centímetros imediatamente.',
      },
      {
        'header': 'Compressão vertebral durante o dia',
        'body':
            'A gravidade comprime os discos intervertebrais ao longo do dia. '
            'Você é mais alto de manhã e mais baixo à noite — diferença de '
            '1,5–2,5 cm. Má postura e músculos do core fracos pioram isso.',
      },
      {
        'header': 'Exercícios de descompressão',
        'body':
            '1. Suspensão (30–60 seg) — alongar a coluna com a gravidade.\n'
            '2. Gato-vaca — arquear e arredondar as costas de quatro apoios.\n'
            '3. Cobra — levantar o peito de bruços.\n'
            '4. Postura da criança — estender-se para frente.\n'
            '5. Anjos na parede — fortalecer músculos posturais.',
      },
      {
        'header': 'Hábitos posturais de longo prazo',
        'body':
            '• Estação de trabalho ergonômica — tela na altura dos olhos.\n'
            '• Pausa postural de 2 minutos a cada 30 minutos sentado.\n'
            '• Fortalecer core e costas (prancha, remada).\n'
            '• Imaginar um fio puxando o topo da cabeça para cima.\n'
            '• Dormir de costas com travesseiro fino.',
      },
    ],
    'references': [
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Crescimento em altura: mitos vs. fatos',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Mito: «A genética é tudo»',
        'body':
            'FATO: A genética determina 60–80 % da altura final. Os 20–40 % '
            'restantes dependem de nutrição, sono e exercício. Na Coreia do Sul '
            'e Países Baixos, a altura média subiu 10–15 cm em poucas gerações '
            'com melhor alimentação.',
      },
      {
        'header': 'Mito: «Alongamentos fazem crescer permanentemente»',
        'body':
            'FATO: Alongamentos melhoram a postura e reduzem a compressão '
            'vertebral, podendo dar 1–3 cm a mais. Mas não alongam os ossos. '
            'Os ganhos vêm da correção postural.',
      },
      {
        'header': 'Mito: «Leite sozinho faz crescer»',
        'body':
            'FATO: O leite fornece cálcio, proteínas e vitamina D. Mas também '
            'são necessários zinco, vitamina A, ferro e fósforo. O crescimento '
            'requer uma equipe de nutrientes.',
      },
      {
        'header': 'Mito: «Para de crescer aos 18»',
        'body':
            'FATO: A maioria termina de crescer aos 18, mas alguns — especialmente '
            'homens com puberdade tardia — continuam até 20–22 anos. '
            'O fechamento das placas varia de pessoa para pessoa.',
      },
      {
        'header': 'Mito: «Pesos travam o crescimento»',
        'body':
            'FATO: Musculação bem orientada é segura para adolescentes e apoia '
            'o crescimento. O mito vem de lesões raras por técnica incorreta.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Maximize sua janela de crescimento',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Entendendo os surtos de crescimento',
        'body':
            'O crescimento não é constante, ocorre em surtos:\n\n'
            '1. Bebê até 2 anos (~25 cm no primeiro ano).\n'
            '2. Puberdade (meninas: ~8–10 cm/ano; meninos: ~10–12 cm/ano).\n\n'
            'Entre surtos, crianças crescem ~5–6 cm por ano.',
      },
      {
        'header': 'O timing da puberdade importa',
        'body':
            'Os precoces crescem rápido mas param mais cedo. Os tardios '
            'crescem mais devagar no início mas geralmente ficam mais altos. '
            'Se seus amigos são mais altos agora, talvez você ainda não '
            'teve seu surto de crescimento.',
      },
      {
        'header': 'O que fazer em cada idade',
        'body':
            '8–12 anos: Construir a base.\n'
            '• Alimentação equilibrada rica em cálcio e proteínas. 10+ h de sono.\n\n'
            '13–16 anos: A janela crítica.\n'
            '• 9+ horas de sono. Exercícios de sprint e salto.\n'
            '• 1.300 mg cálcio, 1,2–1,5 g/kg proteína por dia.\n\n'
            '17–20 anos: Última oportunidade.\n'
            '• Excelente nutrição, sono e exercícios de postura.',
      },
      {
        'header': 'Sinais de um surto de crescimento',
        'body':
            '• Número do calçado sobe antes da altura.\n'
            '• Mãos e pés parecem desproporcionalmente grandes.\n'
            '• Aumento de apetite e fome.\n'
            '• Dores de crescimento (pernas à noite).\n'
            '• Mudança rápida no tamanho das roupas.\n\n'
            'Ao notar esses sinais, dobre a aposta em sono e nutrição.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── ITALIAN ───────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesIt = [
  {
    'id': 'article_hgh',
    'title': 'Cos\'è l\'ormone della crescita?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Il tuo motore di crescita: HGH',
        'body':
            'L\'ormone della crescita umano (HGH) è una piccola proteina '
            'prodotta dall\'ipofisi alla base del cervello. È l\'ormone più '
            'importante per la crescita in altezza durante l\'infanzia e '
            'l\'adolescenza. Segnala a ossa, muscoli e organi di crescere.',
      },
      {
        'header': 'Come funziona l\'ipofisi',
        'body':
            'L\'ipofisi rilascia HGH in impulsi, specialmente durante il '
            'sonno profondo e subito dopo l\'esercizio intenso. L\'ipotalamo '
            'controlla questi impulsi con GHRH (stimola) e somatostatina (inibisce).',
      },
      {
        'header': 'Quando l\'HGH raggiunge il picco?',
        'body':
            'I livelli di HGH sono massimi durante la pubertà. Nei maschi il '
            'picco è tipicamente tra 13 e 15 anni; nelle femmine tra 11 e 13. '
            'Dopo questa fase la produzione scende ~14 % per decennio dopo i 20 anni.',
      },
      {
        'header': 'Come aumentare l\'HGH naturalmente',
        'body':
            '1. Dormire 8–10 ore (sonno profondo = impulsi HGH maggiori).\n'
            '2. Allenamento intenso — sprint e muscolazione rilasciano HGH.\n'
            '3. Abbastanza proteine — l\'arginina stimola l\'HGH.\n'
            '4. Evitare zuccheri prima di dormire — glicemia alta sopprime l\'HGH.',
      },
      {
        'header': 'Cosa riduce l\'HGH?',
        'body':
            '• Privazione cronica di sonno.\n'
            '• Eccesso di grasso corporeo, soprattutto addominale.\n'
            '• Molto zucchero e cibo trasformato.\n'
            '• Stress cronico (cortisolo alto sopprime l\'HGH).\n'
            '• Stile di vita sedentario.',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'Come funzionano le cartilagini di crescita?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'Cosa sono le cartilagini di crescita?',
        'body':
            'Le cartilagini di crescita (fisi) sono sottili strati di '
            'cartilagine vicino alle estremità delle ossa lunghe. Solo qui '
            'si aggiunge nuovo tessuto osseo. Finché rimangono aperte '
            '(non fuse), si può continuare a crescere.',
      },
      {
        'header': 'Come le ossa si allungano',
        'body':
            'I condrociti si dividono costantemente in ogni fisi. Le nuove '
            'cellule cartilaginee spingono le vecchie verso la diafisi, '
            'dove vengono sostituite da osso duro attraverso l\'ossificazione.',
      },
      {
        'header': 'Quando si chiudono le cartilagini?',
        'body':
            'La chiusura è innescata dagli ormoni sessuali:\n\n'
            '• Femmine: fusione intorno ai 14–16 anni.\n'
            '• Maschi: fusione intorno ai 16–18 anni.\n'
            '• Alcune fisi si chiudono completamente solo a 25 anni.\n\n'
            'Una radiografia del polso (età ossea) rivela il potenziale residuo.',
      },
      {
        'header': 'Fattori che influenzano la chiusura',
        'body':
            '• Pubertà precoce → chiusura precoce, meno tempo di crescita.\n'
            '• Malnutrizione → chiusura ritardata ma crescita lenta.\n'
            '• Obesità → più estrogeni possono accelerare la chiusura.\n'
            '• Buona nutrizione e sonno mantengono un\'attività sana delle fisi.',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Sonno e crescita: la scienza',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Perché il sonno è indispensabile',
        'body':
            'Fino al 75 % dell\'ormone della crescita giornaliero viene '
            'rilasciato durante il sonno. Nessun esercizio o dieta può '
            'compensare un sonno insufficiente. Il corpo costruisce ossa '
            'e ripara i tessuti mentre dormiamo.',
      },
      {
        'header': 'Cicli di sonno e rilascio di HGH',
        'body':
            'Una notte tipica ha 4–6 cicli di 90 minuti. I picchi di HGH '
            'più elevati avvengono nel sonno profondo (fase 3) dei primi '
            '1–2 cicli. Andare a letto tardi o svegliarsi spesso fa perdere '
            'questi impulsi critici.',
      },
      {
        'header': 'Quanto sonno ti serve?',
        'body':
            '• 6–12 anni: 9–12 ore per notte.\n'
            '• 13–15 anni: 9–10 ore per notte.\n'
            '• 16–18 anni: 8–10 ore per notte.\n'
            '• 19–25 anni: 7–9 ore per notte.\n\n'
            'Punta al valore più alto se sei in fase di crescita attiva.',
      },
      {
        'header': 'Consigli per dormire meglio',
        'body':
            '1. Andare a letto e alzarsi alla stessa ora ogni giorno.\n'
            '2. Spegnere gli schermi 30 minuti prima (la luce blu sopprime la melatonina).\n'
            '3. Camera fresca (18–20 °C) e buia.\n'
            '4. No caffeina dopo le 14 né pasti pesanti 2h prima di dormire.\n'
            '5. Leggeri allungamenti prima di dormire aiutano a rilassarsi.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Nutrizione per la massima crescita',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Perché la dieta conta per l\'altezza',
        'body':
            'La genetica fissa il potenziale di altezza; la nutrizione '
            'determina se lo si raggiunge. Una migliore alimentazione ha '
            'aumentato l\'altezza media di 10 cm in molti paesi nel '
            'secolo scorso.',
      },
      {
        'header': 'Calcio — il costruttore osseo',
        'body':
            'Il calcio costituisce ~70 % del tessuto osseo. Nella fase di '
            'crescita servono 1.000–1.300 mg/giorno. Fonti migliori: latte, '
            'yogurt, formaggio, broccoli, mandorle. Abbinare con la vitamina D.',
      },
      {
        'header': 'Proteine — il carburante della crescita',
        'body':
            'Gli adolescenti hanno bisogno di 1,0–1,5 g di proteine per kg '
            'di peso corporeo al giorno. L\'arginina stimola particolarmente '
            'l\'HGH. Fonti migliori: uova, pollo, pesce, lenticchie, yogurt greco.',
      },
      {
        'header': 'Vitamine e minerali chiave',
        'body':
            '• Vitamina D: 600–1.000 UI/giorno per assorbire il calcio.\n'
            '• Zinco: 8–11 mg/giorno per la divisione cellulare.\n'
            '• Vitamina A: supporta il rimodellamento osseo (carote, patate dolci).\n'
            '• Ferro: 8–15 mg/giorno, trasporta ossigeno ai tessuti in crescita.\n'
            '• Fosforo e Magnesio: mineralizzano le ossa con il calcio.',
      },
      {
        'header': 'Cosa evitare',
        'body':
            '• Troppo zucchero e bevande gassate — riducono il calcio e sopprimono l\'HGH.\n'
            '• Diete estreme — ostacolano la crescita.\n'
            '• Troppa caffeina — interferisce con l\'assorbimento del calcio.\n'
            '• Ultra-lavorati — poveri di micronutrienti.',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Esercizio e altezza: la scienza',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'L\'esercizio può farmi crescere?',
        'body':
            'L\'esercizio non cambia il tetto genetico, ma aiuta a raggiungere '
            'il pieno potenziale. L\'attività fisica stimola l\'HGH, rafforza '
            'le ossa e migliora la postura.',
      },
      {
        'header': 'Esercizi d\'impatto e cartilagini di crescita',
        'body':
            'Corsa, salti e pallacanestro creano stress meccanico sulle '
            'cartilagini di crescita, stimolando i condrociti. I giovani '
            'sportivi in questi sport hanno spesso una maggiore densità ossea.',
      },
      {
        'header': 'Migliori esercizi per la crescita',
        'body':
            '1. Salti: corda, box jump — stimola le cartilagini delle gambe.\n'
            '2. Sprint: scatena grandi rilasci di HGH.\n'
            '3. Nuoto: allungamento totale con basso impatto.\n'
            '4. Trazioni e sbarra: decomprime la colonna.\n'
            '5. Yoga/allungamenti dinamici: migliora la postura.\n'
            '6. Muscolazione moderata: supporta la crescita ossea.',
      },
      {
        'header': 'Risposta dell\'HGH all\'esercizio',
        'body':
            'L\'esercizio ad alta intensità può aumentare l\'HGH del '
            '300–500 % per 1–2 ore dopo:\n\n'
            '• Intensità > 70 % dello sforzo massimo.\n'
            '• Durata minima di 10–20 minuti.\n'
            '• Riposo 60–90 secondi tra le serie.',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Postura e centimetri nascosti',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Come la postura influenza la tua altezza',
        'body':
            'Una cattiva postura può farti sembrare 2–5 cm più basso. Spalle '
            'curve e testa in avanti comprimono la colonna. Stare eretti può '
            'aggiungere immediatamente centimetri all\'altezza misurata.',
      },
      {
        'header': 'Compressione vertebrale durante il giorno',
        'body':
            'La gravità comprime i dischi intervertebrali nel corso della '
            'giornata. Sei più alto la mattina e più basso la sera — '
            'differenza di 1,5–2,5 cm. Cattiva postura e muscoli del core '
            'deboli peggiorano questo effetto.',
      },
      {
        'header': 'Esercizi di decompressione',
        'body':
            '1. Appendendersi (30–60 sec) — allungare la colonna con la gravità.\n'
            '2. Gatto-mucca — alternare schiena concava e convessa a quattro zampe.\n'
            '3. Cobra — sollevare il petto da prono.\n'
            '4. Posizione del bambino — allungarsi in avanti.\n'
            '5. Angeli al muro — rafforzare i muscoli posturali.',
      },
      {
        'header': 'Abitudini posturali a lungo termine',
        'body':
            '• Postazione ergonomica — schermo all\'altezza degli occhi.\n'
            '• Pausa posturale di 2 minuti ogni 30 minuti seduto.\n'
            '• Rafforzare core e schiena (plank, remata).\n'
            '• Immaginare un filo che tira la testa verso l\'alto.\n'
            '• Dormire sulla schiena con un cuscino sottile.',
      },
    ],
    'references': [
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Crescita: miti vs. fatti',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Mito: «La genetica è tutto»',
        'body':
            'FATTO: La genetica determina il 60–80 % dell\'altezza finale. '
            'Il restante 20–40 % dipende da nutrizione, sonno ed esercizio. '
            'In Corea del Sud e nei Paesi Bassi l\'altezza media è aumentata '
            'di 10–15 cm in poche generazioni grazie a una migliore alimentazione.',
      },
      {
        'header': 'Mito: «Gli allungamenti fanno crescere permanentemente»',
        'body':
            'FATTO: Gli allungamenti migliorano la postura e riducono la '
            'compressione vertebrale, il che può dare 1–3 cm in più. '
            'Ma non allungano le ossa. I guadagni derivano dalla '
            'correzione posturale.',
      },
      {
        'header': 'Mito: «Solo il latte fa crescere»',
        'body':
            'FATTO: Il latte fornisce calcio, proteine e vitamina D. Ma '
            'servono anche zinco, vitamina A, ferro e fosforo. La crescita '
            'richiede un team di nutrienti.',
      },
      {
        'header': 'Mito: «Si smette di crescere a 18 anni»',
        'body':
            'FATTO: La maggior parte delle persone finisce di crescere a 18 anni, '
            'ma alcuni — specialmente maschi con pubertà tardiva — continuano '
            'fino ai 20–22 anni. La chiusura delle cartilagini varia.',
      },
      {
        'header': 'Mito: «I pesi bloccano la crescita»',
        'body':
            'FATTO: Il sollevamento pesi ben supervisionato è sicuro per '
            'gli adolescenti e supporta la crescita aumentando l\'HGH. '
            'Il mito deriva da rari infortuni per tecnica scorretta.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Massimizza la tua finestra di crescita',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Capire gli scatti di crescita',
        'body':
            'La crescita in altezza non è uniforme, avviene a scatti:\n\n'
            '1. Neonato fino a 2 anni (~25 cm nel primo anno).\n'
            '2. Pubertà (femmine: ~8–10 cm/anno; maschi: ~10–12 cm/anno).\n\n'
            'Tra gli scatti, i bambini crescono ~5–6 cm all\'anno.',
      },
      {
        'header': 'Il timing della pubertà conta',
        'body':
            'Chi matura prima cresce in fretta ma si ferma prima. Chi matura '
            'tardi cresce più lentamente all\'inizio ma spesso finisce più alto. '
            'Se i tuoi amici sono ora più alti, potresti non aver ancora '
            'raggiunto il tuo picco di crescita.',
      },
      {
        'header': 'Cosa fare ad ogni età',
        'body':
            '8–12 anni: Costruire le basi.\n'
            '• Dieta equilibrata ricca di calcio e proteine. 10+ ore di sonno.\n\n'
            '13–16 anni: La finestra critica.\n'
            '• 9+ ore di sonno. Sprint ed esercizi di salto.\n'
            '• 1.300 mg calcio, 1,2–1,5 g/kg proteine al giorno.\n\n'
            '17–20 anni: Ultima opportunità.\n'
            '• Eccellente nutrizione, sonno, esercizi posturali.',
      },
      {
        'header': 'Segnali di uno scatto di crescita in arrivo',
        'body':
            '• Il numero di scarpe aumenta prima dell\'altezza.\n'
            '• Mani e piedi sembrano sproporzionatamente grandi.\n'
            '• Aumento di appetito e fame.\n'
            '• Dolori di crescita (gambe di notte).\n'
            '• Cambio rapido della taglia dei vestiti.\n\n'
            'Quando noti questi segnali, punta di più su sonno e nutrizione.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── HINDI ─────────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesHi = [
  {
    'id': 'article_hgh',
    'title': 'ग्रोथ हार्मोन क्या है?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'आपका विकास इंजन: HGH',
        'body':
            'मानव विकास हार्मोन (HGH) एक छोटा प्रोटीन है जो मस्तिष्क के '
            'आधार पर पिट्यूटरी ग्रंथि द्वारा निर्मित होता है। यह बचपन और '
            'किशोरावस्था में लंबाई बढ़ाने के लिए सबसे महत्वपूर्ण हार्मोन है। '
            'यह हड्डियों, मांसपेशियों और अंगों को बढ़ने का संकेत देता है।',
      },
      {
        'header': 'पिट्यूटरी ग्रंथि कैसे काम करती है',
        'body':
            'पिट्यूटरी ग्रंथि दिन भर HGH को दालों में छोड़ती है, खासकर '
            'गहरी नींद के दौरान और तीव्र व्यायाम के तुरंत बाद। '
            'हाइपोथैलेमस GHRH (उत्तेजित) और सोमैटोस्टैटिन (रोकता) से '
            'इन दालों को नियंत्रित करता है।',
      },
      {
        'header': 'HGH का चरम कब होता है?',
        'body':
            'HGH का स्तर यौवन के दौरान सबसे अधिक होता है। लड़कों में '
            'चरम आमतौर पर 13–15 साल के बीच होता है; लड़कियों में 11–13 '
            'साल के बीच। इसके बाद HGH उत्पादन 20 साल के बाद प्रति दशक '
            'लगभग 14% कम होता जाता है।',
      },
      {
        'header': 'HGH को स्वाभाविक रूप से कैसे बढ़ाएं',
        'body':
            '1. हर रात 8–10 घंटे सोएं (गहरी नींद = सबसे बड़ी HGH दालें)।\n'
            '2. तीव्र व्यायाम करें — स्प्रिंट और वेट ट्रेनिंग HGH छोड़ते हैं।\n'
            '3. पर्याप्त प्रोटीन खाएं — आर्जिनिन HGH को उत्तेजित करता है।\n'
            '4. सोने से पहले चीनी से बचें — रक्त शर्करा HGH को दबाती है।',
      },
      {
        'header': 'HGH को क्या कम करता है?',
        'body':
            '• नींद की पुरानी कमी।\n'
            '• अत्यधिक शरीर की चर्बी, विशेषकर पेट के आसपास।\n'
            '• अधिक चीनी और प्रसंस्कृत खाना।\n'
            '• पुराना तनाव (कोर्टिसोल बढ़ता है, HGH दबती है)।\n'
            '• निष्क्रिय जीवनशैली।',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'ग्रोथ प्लेट्स कैसे काम करती हैं?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'ग्रोथ प्लेट्स क्या हैं?',
        'body':
            'ग्रोथ प्लेट्स (एपिफिसियल प्लेट्स) लंबी हड्डियों के सिरों के '
            'पास उपास्थि की पतली परतें हैं। केवल यहीं नया हड्डी ऊतक जोड़ा '
            'जाता है। जब तक ये खुली रहती हैं, लंबाई बढ़ सकती है।',
      },
      {
        'header': 'हड्डियां कैसे लंबी होती हैं',
        'body':
            'प्रत्येक प्लेट में कोंड्रोसाइट कोशिकाएं लगातार विभाजित होती हैं। '
            'नई उपास्थि कोशिकाएं पुरानी को हड्डी की शाफ्ट की ओर धकेलती हैं '
            'जहां ऑसिफिकेशन द्वारा उन्हें कठोर हड्डी से बदल दिया जाता है।',
      },
      {
        'header': 'ग्रोथ प्लेट्स कब बंद होती हैं?',
        'body':
            'बंद होना मुख्य रूप से सेक्स हार्मोन द्वारा शुरू होता है:\n\n'
            '• लड़कियां: 14–16 साल के आसपास फ्यूजन शुरू।\n'
            '• लड़के: 16–18 साल के आसपास फ्यूजन शुरू।\n'
            '• कुछ प्लेट्स 25 साल तक पूरी तरह बंद नहीं होतीं।\n\n'
            'हाथ/कलाई का X-ray शेष संभावना दिखा सकता है।',
      },
      {
        'header': 'बंद होने को प्रभावित करने वाले कारक',
        'body':
            '• जल्दी यौवन → जल्दी बंद, कम विकास समय।\n'
            '• कुपोषण → देर से बंद लेकिन धीमी वृद्धि।\n'
            '• मोटापा → अधिक एस्ट्रोजन बंद होने में तेजी ला सकता है।\n'
            '• अच्छा पोषण और नींद स्वस्थ प्लेट गतिविधि बनाए रखती है।',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'नींद और विकास: विज्ञान',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'नींद क्यों जरूरी है',
        'body':
            'दैनिक विकास हार्मोन का 75% तक नींद के दौरान छोड़ा जाता है। '
            'कोई भी व्यायाम या आहार खराब नींद की पूरी तरह भरपाई नहीं कर '
            'सकता। शरीर सोते समय हड्डियां बनाता है और ऊतकों की मरम्मत करता है।',
      },
      {
        'header': 'नींद के चक्र और HGH रिलीज',
        'body':
            'एक सामान्य रात में 90 मिनट के 4–6 नींद चक्र होते हैं। '
            'सबसे बड़ी HGH दालें पहले 1–2 चक्रों के गहरी नींद (चरण 3) में '
            'होती हैं। देर से सोना या बार-बार जागना इन महत्वपूर्ण दालों '
            'को चूकने का कारण बनता है।',
      },
      {
        'header': 'आपको कितनी नींद चाहिए?',
        'body':
            '• 6–12 साल: प्रति रात 9–12 घंटे।\n'
            '• 13–15 साल: प्रति रात 9–10 घंटे।\n'
            '• 16–18 साल: प्रति रात 8–10 घंटे।\n'
            '• 19–25 साल: प्रति रात 7–9 घंटे।\n\n'
            'सक्रिय विकास के दौरान ऊपरी सीमा तक सोने का लक्ष्य रखें।',
      },
      {
        'header': 'बेहतर नींद के लिए टिप्स',
        'body':
            '1. हर दिन एक ही समय पर सोएं और उठें।\n'
            '2. सोने से 30 मिनट पहले स्क्रीन बंद करें (नीली रोशनी मेलाटोनिन को दबाती है)।\n'
            '3. कमरा ठंडा (18–20 °C) और अंधेरा रखें।\n'
            '4. दोपहर 2 बजे के बाद कैफीन नहीं और सोने से 2 घंटे पहले भारी खाना नहीं।\n'
            '5. सोने से पहले हल्की स्ट्रेचिंग आराम में मदद करती है।',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'अधिकतम विकास के लिए पोषण',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'लंबाई के लिए आहार क्यों मायने रखता है',
        'body':
            'जीन लंबाई की क्षमता तय करते हैं; पोषण तय करता है कि क्या आप '
            'उसे हासिल करते हैं। पिछली सदी में बेहतर पोषण ने कई देशों में '
            'औसत लंबाई 10 सेमी तक बढ़ाई है।',
      },
      {
        'header': 'कैल्शियम — हड्डी का निर्माता',
        'body':
            'कैल्शियम हड्डी के ऊतक का लगभग 70% बनाता है। तेज विकास के '
            'दौरान प्रतिदिन 1,000–1,300 मिलीग्राम की जरूरत होती है। '
            'मुख्य स्रोत: दूध, दही, पनीर, ब्रोकली, बादाम। '
            'सबसे अच्छे अवशोषण के लिए विटामिन D के साथ लें।',
      },
      {
        'header': 'प्रोटीन — विकास का ईंधन',
        'body':
            'किशोरों को प्रति किलो शरीर वजन पर प्रतिदिन 1.0–1.5 ग्राम '
            'प्रोटीन चाहिए। आर्जिनिन विशेष रूप से HGH को उत्तेजित करता है। '
            'मुख्य स्रोत: अंडे, चिकन, मछली, दाल, ग्रीक दही।',
      },
      {
        'header': 'मुख्य विटामिन और खनिज',
        'body':
            '• विटामिन D: कैल्शियम अवशोषण के लिए 600–1,000 IU/दिन।\n'
            '• जिंक: कोशिका विभाजन के लिए 8–11 मिलीग्राम/दिन।\n'
            '• विटामिन A: हड्डी पुनर्निर्माण का समर्थन करता है (गाजर, शकरकंद)।\n'
            '• आयरन: 8–15 मिलीग्राम/दिन, ऊतकों में ऑक्सीजन ले जाता है।\n'
            '• फॉस्फोरस और मैग्नीशियम: कैल्शियम के साथ हड्डी को खनिज बनाते हैं।',
      },
      {
        'header': 'क्या न खाएं',
        'body':
            '• अधिक चीनी और सोडा — कैल्शियम कम करता है और HGH दबाता है।\n'
            '• अत्यधिक डाइटिंग — विकास रोकती है।\n'
            '• बहुत अधिक कैफीन — कैल्शियम अवशोषण को बाधित करता है।\n'
            '• अत्यधिक प्रसंस्कृत खाना — सूक्ष्म पोषक तत्वों में कम।',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'व्यायाम और लंबाई: विज्ञान',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'क्या व्यायाम वास्तव में लंबा कर सकता है?',
        'body':
            'व्यायाम अकेले आनुवंशिक लंबाई सीमा नहीं बदल सकता, लेकिन '
            'पूर्ण क्षमता तक पहुंचने में मदद करता है। शारीरिक गतिविधि '
            'HGH उत्तेजित करती है, हड्डियां मजबूत करती है और मुद्रा सुधारती है।',
      },
      {
        'header': 'प्रभाव व्यायाम और ग्रोथ प्लेट्स',
        'body':
            'दौड़ना, कूदना और बास्केटबॉल ग्रोथ प्लेट्स पर यांत्रिक तनाव '
            'बनाता है, जो कोंड्रोसाइट गतिविधि को उत्तेजित करता है। इन '
            'खेलों में युवा एथलीटों में अक्सर अधिक हड्डी खनिज घनत्व होता है।',
      },
      {
        'header': 'विकास के लिए सबसे अच्छे व्यायाम',
        'body':
            '1. कूदना: रस्सी कूदना, बॉक्स जंप — पैरों की प्लेट्स को उत्तेजित करता है।\n'
            '2. स्प्रिंट: बड़ी HGH रिलीज को ट्रिगर करता है।\n'
            '3. तैराकी: कम प्रभाव के साथ पूर्ण शरीर खिंचाव।\n'
            '4. लटकना और पुल-अप: रीढ़ को डिकंप्रेस करता है।\n'
            '5. योग/डायनेमिक स्ट्रेचिंग: मुद्रा सुधारता है।\n'
            '6. मध्यम वेट ट्रेनिंग: हड्डी के विकास का समर्थन करता है।',
      },
      {
        'header': 'व्यायाम के प्रति HGH की प्रतिक्रिया',
        'body':
            'उच्च-तीव्रता वाला व्यायाम कसरत के बाद 1–2 घंटे के लिए '
            'HGH को 300–500% तक बढ़ा सकता है:\n\n'
            '• अधिकतम प्रयास का 70% से अधिक तीव्रता।\n'
            '• कम से कम 10–20 मिनट की अवधि।\n'
            '• सेट्स के बीच 60–90 सेकंड आराम।',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'मुद्रा और छिपे सेंटीमीटर',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'मुद्रा आपकी लंबाई को कैसे प्रभावित करती है',
        'body':
            'खराब मुद्रा आपको वास्तविक ऊंचाई से 2–5 सेमी छोटा दिखा सकती है। '
            'झुके हुए कंधे और आगे की ओर सिर रीढ़ को संकुचित करते हैं। '
            'सीधे खड़े होना तुरंत सेंटीमीटर जोड़ सकता है।',
      },
      {
        'header': 'दिन भर रीढ़ का संपीड़न',
        'body':
            'गुरुत्वाकर्षण दिन भर कशेरुकाओं के बीच डिस्क को संकुचित करता है। '
            'आप सुबह सबसे लंबे और शाम को सबसे छोटे होते हैं — '
            'अंतर 1.5–2.5 सेमी हो सकता है। खराब मुद्रा इसे और बढ़ा देती है।',
      },
      {
        'header': 'डिकंप्रेशन व्यायाम',
        'body':
            '1. डेड हैंग (30–60 सेकंड) — गुरुत्वाकर्षण से रीढ़ को खींचें।\n'
            '2. कैट-काउ स्ट्रेच — चारों तरफ पीठ को आगे-पीछे झुकाएं।\n'
            '3. कोबरा स्ट्रेच — पेट के बल लेट कर छाती उठाएं।\n'
            '4. चाइल्ड पोज — आगे की तरफ झुकें।\n'
            '5. वॉल एंजेल — पोस्चरल मांसपेशियों को मजबूत करें।',
      },
      {
        'header': 'दीर्घकालिक मुद्रा आदतें',
        'body':
            '• एर्गोनोमिक डेस्क सेटअप — स्क्रीन आंखों के स्तर पर।\n'
            '• हर 30 मिनट बैठने पर 2 मिनट पोस्चर ब्रेक।\n'
            '• कोर और पीठ मजबूत करें (प्लैंक, रोइंग)।\n'
            '• कल्पना करें एक धागा आपके सिर को ऊपर खींच रहा है।\n'
            '• पतले तकिए के साथ पीठ के बल सोएं।',
      },
    ],
    'references': [
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'लंबाई वृद्धि: मिथक बनाम तथ्य',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'मिथक: "जीन सब कुछ हैं"',
        'body':
            'तथ्य: जीन अंतिम लंबाई का 60–80% निर्धारित करते हैं। शेष 20–40% '
            'पोषण, नींद और व्यायाम से तय होता है। दक्षिण कोरिया और नीदरलैंड्स '
            'में बेहतर पोषण से कुछ पीढ़ियों में औसत लंबाई 10–15 सेमी बढ़ी।',
      },
      {
        'header': 'मिथक: "स्ट्रेचिंग स्थायी रूप से लंबा करती है"',
        'body':
            'तथ्य: स्ट्रेचिंग मुद्रा सुधारती है और रीढ़ का संपीड़न कम करती है, '
            'जिससे 1–3 सेमी अधिक माप सकता है। लेकिन यह हड्डियां नहीं बढ़ाती। '
            'लाभ मुद्रा सुधार से आते हैं।',
      },
      {
        'header': 'मिथक: "केवल दूध पीने से लंबाई बढ़ेगी"',
        'body':
            'तथ्य: दूध कैल्शियम, प्रोटीन और विटामिन D प्रदान करता है। लेकिन '
            'जिंक, विटामिन A, आयरन और फॉस्फोरस भी जरूरी हैं। विकास के लिए '
            'पोषक तत्वों की पूरी टीम चाहिए।',
      },
      {
        'header': 'मिथक: "18 साल में बढ़ना बंद हो जाता है"',
        'body':
            'तथ्य: अधिकांश लोग 18 तक बढ़ना पूरा करते हैं, लेकिन कुछ — '
            'खासकर देर से यौवन पाने वाले लड़के — 20–22 साल तक बढ़ते रहते हैं। '
            'ग्रोथ प्लेट बंद होना व्यक्ति से व्यक्ति में भिन्न होता है।',
      },
      {
        'header': 'मिथक: "वजन उठाने से विकास रुक जाता है"',
        'body':
            'तथ्य: उचित तकनीक से किया गया वेट ट्रेनिंग किशोरों के लिए सुरक्षित '
            'है और HGH बढ़ाकर विकास का समर्थन करता है। मिथक गलत तकनीक से '
            'हुई दुर्लभ चोटों से उत्पन्न हुआ।',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'अपनी विकास खिड़की को अधिकतम करें',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'विकास की दौड़ को समझना',
        'body':
            'लंबाई की वृद्धि समान नहीं होती, यह दौड़ों में होती है:\n\n'
            '1. शिशु से 2 साल तक (~पहले साल में 25 सेमी)।\n'
            '2. यौवन (लड़कियां: ~8–10 सेमी/साल; लड़के: ~10–12 सेमी/साल)।\n\n'
            'दौड़ों के बीच बच्चे प्रति वर्ष लगभग 5–6 सेमी बढ़ते हैं।',
      },
      {
        'header': 'यौवन का समय मायने रखता है',
        'body':
            'जल्दी परिपक्व होने वाले तेजी से बढ़ते हैं लेकिन जल्दी रुक जाते हैं। '
            'देर से परिपक्व होने वाले शुरू में धीरे बढ़ते हैं लेकिन अक्सर '
            'अधिक लंबे होते हैं। यदि दोस्त अभी लंबे हैं, तो हो सकता है '
            'आपकी विकास दौड़ अभी न आई हो।',
      },
      {
        'header': 'हर उम्र में क्या करें',
        'body':
            '8–12 साल: नींव बनाएं।\n'
            '• कैल्शियम और प्रोटीन युक्त संतुलित आहार। 10+ घंटे नींद।\n\n'
            '13–16 साल: महत्वपूर्ण खिड़की।\n'
            '• 9+ घंटे नींद। स्प्रिंट और जंपिंग व्यायाम।\n'
            '• 1,300 मिलीग्राम कैल्शियम, 1.2–1.5 ग्राम/किलो प्रोटीन प्रतिदिन।\n\n'
            '17–20 साल: अंतिम अवसर।\n'
            '• उत्कृष्ट पोषण, नींद, मुद्रा व्यायाम।',
      },
      {
        'header': 'विकास दौड़ के आने के संकेत',
        'body':
            '• जूते का नंबर लंबाई से पहले बढ़ता है।\n'
            '• हाथ और पैर असमान रूप से बड़े दिखते हैं।\n'
            '• भूख और खाने की इच्छा बढ़ जाती है।\n'
            '• बढ़ने का दर्द (विशेषकर रात में पैर में दर्द)।\n'
            '• कपड़ों का साइज तेजी से बदलता है।\n\n'
            'ये संकेत देखने पर नींद और पोषण पर दोगुना ध्यान दें।',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── DUTCH ───────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesNl = [
  {
    'id': 'article_hgh',
    'title': 'Wat is groeihormoon?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Maak kennis met je groeimotor: HGH',
        'body':
            'Menselijk groeihormoon (HGH) is een klein eiwit dat wordt aangemaakt door de hypofyse, onderaan je hersenen. HGH is het allerbelangrijkste hormoon voor lengtegroei tijdens je kindertijd en puberteit. Het geeft je botten, spieren en organen het signaal om te groeien.',
      },
      {
        'header': 'Hoe de hypofyse werkt',
        'body':
            'De hypofyse geeft HGH de hele dag door in pulsen af, maar de grootste pieken komen tijdens je diepe slaap en direct na intensief sporten. De hypothalamus stuurt deze pulsen aan met GHRH (stimuleert HGH) en somatostatine (remt HGH).',
      },
      {
        'header': 'Wanneer piekt HGH?',
        'body':
            'Je HGH-gehalte is het hoogst in de puberteit. Bij jongens ligt de piek meestal tussen 13 en 15 jaar, bij meisjes tussen 11 en 13 jaar. Na de groeispurtjaren daalt de aanmaak van HGH geleidelijk, met ongeveer 14% per tien jaar vanaf je twintigste.',
      },
      {
        'header': 'HGH op een natuurlijke manier stimuleren',
        'body':
            '1. Slaap elke nacht 8–10 uur (diepe slaap = de grootste HGH-pulsen).\n'
            '2. Sport intensief — sprints en krachttraining zorgen voor een flinke afgifte van HGH.\n'
            '3. Eet genoeg eiwit — arginine en ornithine stimuleren HGH.\n'
            '4. Vermijd suikerpieken voor het slapengaan — een hoge bloedsuiker remt de afgifte van HGH tijdens je slaap.',
      },
      {
        'header': 'Wat verlaagt HGH?',
        'body':
            '• Langdurig slaaptekort.\n'
            '• Te veel lichaamsvet, vooral rond je buik.\n'
            '• Veel suiker en bewerkt eten.\n'
            '• Langdurige stress (verhoogt cortisol, remt HGH).\n'
            '• Een zittende leefstijl met weinig beweging.',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
      'Takahashi Y et al. J Clin Invest. 1968;47(9):2079-90.',
      'Wideman L et al. Sports Med. 2002;32(15):987-1004.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'Hoe werken groeischijven?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'Wat zijn groeischijven?',
        'body':
            'Groeischijven (epifysairschijven) zijn dunne laagjes kraakbeen vlak bij de uiteinden van je lange botten. Alleen hier komt er nieuw botweefsel bij waardoor je botten langer worden. Zolang ze open zijn (nog niet vergroeid), kun je nog langer worden.',
      },
      {
        'header': 'Hoe botten langer worden',
        'body':
            'In elke groeischijf delen kraakbeencellen (chondrocyten) zich voortdurend. Nieuwe kraakbeencellen duwen oudere cellen richting de botschacht, waar ze door verbening worden vervangen door hard botweefsel. Door deze cyclus worden je benen en wervelkolom na verloop van tijd langer.',
      },
      {
        'header': 'Wanneer sluiten groeischijven?',
        'body':
            'Het sluiten van de groeischijven wordt vooral in gang gezet door geslachtshormonen:\n'
            '\n'
            '• Meisjes: de schijven beginnen rond 14–16 jaar te vergroeien.\n'
            '• Jongens: de schijven beginnen rond 16–18 jaar te vergroeien.\n'
            '• Sommige schijven zijn mogelijk pas rond je 25e helemaal gesloten.\n'
            '\n'
            'Een röntgenfoto van hand en pols (botleeftijdtest) kan laten zien hoeveel groei er nog in zit.',
      },
      {
        'header': 'Wat het sluiten beïnvloedt',
        'body':
            '• Vroege puberteit → schijven sluiten eerder (minder tijd om te groeien).\n'
            '• Ondervoeding → schijven sluiten later, maar je groeit ook langzamer.\n'
            '• Overgewicht → meer oestrogeen kan het sluiten versnellen.\n'
            '• Goede voeding en genoeg slaap houden je groeischijven gezond en actief.',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
      'Weise M et al. PNAS. 2001;98(12):6871-6.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Slaap en groei: de wetenschap',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Waarom slaap onmisbaar is',
        'body':
            'Tot 75% van je dagelijkse groeihormoon komt vrij tijdens je slaap. Geen enkele hoeveelheid sport of goede voeding kan slecht slapen volledig goedmaken. Je lichaam bouwt letterlijk bot op en herstelt weefsel terwijl je slaapt.',
      },
      {
        'header': 'Slaapcycli en de afgifte van GH',
        'body':
            'Een gemiddelde nacht bestaat uit 4–6 slaapcycli van ongeveer 90 minuten. De grootste HGH-pulsen komen in de diepe slaap (fase 3), vooral in de eerste 1–2 cycli. Laat naar bed gaan of vaak wakker worden betekent dat je deze belangrijke pulsen mist.',
      },
      {
        'header': 'Hoeveel slaap heb je nodig?',
        'body':
            '• 6–12 jaar: 9–12 uur per nacht.\n'
            '• 13–15 jaar: 9–10 uur per nacht.\n'
            '• 16–18 jaar: 8–10 uur per nacht.\n'
            '• 19–25 jaar: 7–9 uur per nacht.\n'
            '\n'
            'Mik op de bovenkant als je nog flink groeit.',
      },
      {
        'header': 'Tips voor betere slaap',
        'body':
            '1. Ga elke dag op dezelfde tijd naar bed en sta op dezelfde tijd op.\n'
            '2. Stop 30 minuten voor bedtijd met schermen (blauw licht remt melatonine).\n'
            '3. Houd je kamer koel (18–20 °C) en donker.\n'
            '4. Vermijd cafeïne na 14:00 en zware maaltijden 2 uur voor bedtijd.\n'
            '5. Lichte stretches voor het slapengaan helpen je lichaam te ontspannen.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
      'Paruthi S et al. J Clin Sleep Med. 2016;12(6):785-786.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Voeding voor maximale groei',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Waarom voeding telt voor je lengte',
        'body':
            'Je genen bepalen je lengtepotentieel, maar voeding bepaalt of je dat ook haalt. Door betere voeding is de gemiddelde lengte in de afgelopen eeuw in veel landen met wel 10 cm gestegen.',
      },
      {
        'header': 'Calcium — de botbouwer',
        'body':
            'Calcium vormt ongeveer 70% van je botweefsel. In je belangrijkste groeijaren heb je 1.000–1.300 mg per dag nodig. Beste bronnen: melk, yoghurt, kaas, broccoli, amandelen. Combineer het met vitamine D voor de beste opname.',
      },
      {
        'header': 'Eiwit — brandstof voor groei',
        'body':
            'Tieners hebben per dag ongeveer 1,0–1,5 g eiwit per kg lichaamsgewicht nodig. Vooral arginine stimuleert de afgifte van HGH. Goede bronnen: eieren, kip, vis, mager rundvlees, linzen, Griekse yoghurt, tofu.',
      },
      {
        'header': 'Belangrijke vitamines en mineralen',
        'body':
            '• Vitamine D: 600–1.000 IU per dag voor de opname van calcium.\n'
            '• Zink: 8–11 mg per dag voor celdeling en groei.\n'
            '• Vitamine A: ondersteunt botombouw (wortels, zoete aardappel).\n'
            '• IJzer: 8–15 mg per dag, vervoert zuurstof naar groeiend weefsel.\n'
            '• Fosfor en magnesium: mineraliseren je botten samen met calcium.',
      },
      {
        'header': 'Wat je beter kunt vermijden',
        'body':
            '• Te veel suiker en frisdrank — onttrekt calcium en remt HGH.\n'
            '• Extreem lijnen — remt je groei.\n'
            '• Te veel cafeïne — verstoort de opname van calcium.\n'
            '• Sterk bewerkt eten — bevat weinig micronutriënten.',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
      'Prentice A. Public Health Nutr. 2004;7(1A):227-243.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Sport en lengte: de wetenschap',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Kun je langer worden door te sporten?',
        'body':
            'Sporten alleen kan je genetische maximale lengte niet veranderen, maar het helpt je wel om je volledige potentieel te bereiken. Beweging stimuleert de afgifte van HGH, maakt je botten sterker en verbetert je houding.',
      },
      {
        'header': 'Impactsport en groeischijven',
        'body':
            'Rennen, springen en basketbal zorgen voor mechanische belasting op je groeischijven. Dat stimuleert de kraakbeencellen en bevordert botgroei. Sporters in springsporten hebben vaak een hogere botdichtheid.',
      },
      {
        'header': 'Beste oefeningen voor groei',
        'body':
            '1. Springen: touwtjespringen, box jumps — stimuleert de groeischijven in je benen.\n'
            '2. Sprinten: zorgt voor een flinke afgifte van HGH.\n'
            '3. Zwemmen: strekt je hele lichaam met weinig belasting.\n'
            '4. Hangen en optrekken: ontlast je wervelkolom.\n'
            '5. Yoga/dynamisch stretchen: verbetert je houding.\n'
            '6. Gematigde krachttraining: ondersteunt botgroei.',
      },
      {
        'header': 'HGH-reactie op sporten',
        'body':
            'Intensief sporten kan je HGH-gehalte tot 1–2 uur na je training met 300–500% verhogen. Belangrijke factoren:\n'
            '\n'
            '• Intensiteit > 70% van je maximale inspanning.\n'
            '• Duur van minstens 10–20 minuten.\n'
            '• 60–90 seconden rust tussen de sets.',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
      'Behringer M et al. Pediatrics. 2014;133(5):e1121.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Houding en verborgen centimeters',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Hoe je houding je lengte beïnvloedt',
        'body':
            'Door een slechte houding kun je 2–5 cm kleiner lijken dan je echte lengte. Afhangende schouders en een naar voren gestoken hoofd drukken je wervelkolom samen. Door goed te staan kun je er bij het meten meteen centimeters "bij krijgen".',
      },
      {
        'header': 'Je wervelkolom zakt overdag in',
        'body':
            'De zwaartekracht drukt de hele dag de schijven tussen je wervels samen. \'s Ochtends ben je het langst en \'s avonds het kortst — het verschil kan 1,5–2,5 cm zijn. Een slechte houding en zwakke corespieren maken het erger.',
      },
      {
        'header': 'Oefeningen die je rug ontlasten',
        'body':
            '1. Hangen aan een stang (30–60 sec) — laat de zwaartekracht je wervelkolom strekken.\n'
            '2. Kat-koe — maak op handen en knieën je rug afwisselend hol en bol.\n'
            '3. Cobrastretch — duw vanuit buiklig je borst omhoog.\n'
            '4. Kindhouding — kniel en reik naar voren.\n'
            '5. Wall angels — versterken je houdingsspieren.',
      },
      {
        'header': 'Houdingsgewoontes voor de lange termijn',
        'body':
            '• Ergonomische werkplek — scherm op ooghoogte.\n'
            '• Na elke 30 minuten zitten een houdingspauze van 2 minuten.\n'
            '• Versterk je core en rug (planken, roeioefeningen).\n'
            '• Stel je voor dat een touwtje je kruin omhoogtrekt.\n'
            '• Slaap op je rug met een dun kussen.',
      },
    ],
    'references': [
      'Kim D et al. J Phys Ther Sci. 2015;27(6):1791-4.',
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Lengtegroei: mythes en feiten',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Mythe: "Genen bepalen alles"',
        'body':
            'FEIT: Genen bepalen 60–80% van je uiteindelijke lengte. De overige 20–40% hangt af van voeding, slaap en beweging. In Zuid-Korea en Nederland steeg de gemiddelde lengte in maar een paar generaties met 10–15 cm door betere voeding.',
      },
      {
        'header': 'Mythe: "Stretchen maakt je blijvend langer"',
        'body':
            'FEIT: Stretchen verbetert je houding en vermindert de druk op je wervelkolom, waardoor je bij het meten 1–3 cm langer kunt zijn. Maar je botten worden er niet langer van. De winst komt van een betere houding, niet van botgroei.',
      },
      {
        'header': 'Mythe: "Alleen melk maakt je lang"',
        'body':
            'FEIT: Melk levert calcium, eiwit en vitamine D — allemaal top. Maar je hebt ook zink, vitamine A, ijzer en fosfor nodig. Groeien vraagt om een heel team aan voedingsstoffen, niet om één voedingsmiddel.',
      },
      {
        'header': 'Mythe: "Na je 18e groei je niet meer"',
        'body':
            'FEIT: De meeste mensen zijn rond hun 18e uitgegroeid, maar sommigen — vooral jongens die laat in de puberteit komen — groeien door tot 20–22 jaar. Wanneer de groeischijven sluiten, verschilt per persoon. Een röntgenfoto voor je botleeftijd kan laten zien hoeveel groei er nog in zit.',
      },
      {
        'header': 'Mythe: "Gewichten remmen de groei van tieners"',
        'body':
            'FEIT: Krachttraining onder goede begeleiding is veilig voor tieners en ondersteunt de groei doordat het HGH verhoogt en je botten sterker maakt. De mythe komt van zeldzame blessures door verkeerd zwaar tillen.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
      'Faigenbaum AD et al. J Strength Cond Res. 2009;23(5):S60-79.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Haal alles uit je groeiperiode',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Groeispurts begrijpen',
        'body':
            'Lengtegroei gaat met vlagen. Er zijn twee grote groeispurts:\n'
            '\n'
            '1. Van baby tot 2 jaar (~25 cm in het eerste jaar).\n'
            '2. Puberteit (meisjes: piek van ~8–10 cm per jaar; jongens: ~10–12 cm per jaar).\n'
            '\n'
            'Tussen de spurts door groeien kinderen ongeveer 5–6 cm per jaar.',
      },
      {
        'header': 'De timing van je puberteit telt',
        'body':
            'Wie vroeg in de puberteit komt, groeit snel maar stopt eerder. Wie laat is, groeit eerst langzamer, maar wordt vaak uiteindelijk langer door meer groeijaren. Zijn je vrienden nu langer? Dan heb je je grootste groeispurt misschien nog niet gehad — en groei je uiteindelijk misschien zelfs meer.',
      },
      {
        'header': 'Wat je op elke leeftijd kunt doen',
        'body':
            '8–12 jaar: leg de basis.\n'
            '• Gevarieerd eten met calcium en eiwit. 10+ uur slaap.\n'
            '\n'
            '13–16 jaar: de belangrijkste periode.\n'
            '• Maak 9+ uur slaap je prioriteit. Sprint- en springoefeningen.\n'
            '• 1.300 mg calcium en 1,2–1,5 g/kg eiwit per dag.\n'
            '\n'
            '17–20 jaar: de laatste kans.\n'
            '• Uitstekende voeding, slaap en houdingsoefeningen.',
      },
      {
        'header': 'Signalen dat er een groeispurt aankomt',
        'body':
            '• Je schoenmaat groeit eerder dan je lengte.\n'
            '• Je handen en voeten lijken onevenredig groot.\n'
            '• Meer trek en honger.\n'
            '• Groeipijn (zeurende benen \'s nachts).\n'
            '• Je kleren passen snel anders.\n'
            '\n'
            'Merk je deze signalen? Zet dan extra in op slaap en voeding.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
      'Rogol AD et al. J Adolesc Health. 2002;31(6):192-200.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── POLISH ──────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesPl = [
  {
    'id': 'article_hgh',
    'title': 'Czym jest hormon wzrostu?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Poznaj swój silnik wzrostu: HGH',
        'body':
            'Ludzki hormon wzrostu (HGH) to małe białko wytwarzane przez przysadkę mózgową u podstawy mózgu. HGH to najważniejszy hormon odpowiadający za wzrost w dzieciństwie i okresie dojrzewania. Daje sygnał kościom, mięśniom i narządom, by rosły.',
      },
      {
        'header': 'Jak działa przysadka mózgowa',
        'body':
            'Przysadka wydziela HGH falami przez cały dzień, ale największe wyrzuty zdarzają się w głębokim śnie i tuż po intensywnym wysiłku. Podwzgórze steruje tymi falami za pomocą GHRH (pobudza HGH) i somatostatyny (hamuje HGH).',
      },
      {
        'header': 'Kiedy HGH osiąga szczyt?',
        'body':
            'Poziom HGH jest najwyższy w okresie dojrzewania. U chłopców szczyt zwykle przypada na wiek 13–15 lat, a u dziewczyn na 11–13 lat. Po latach skoku wzrostowego produkcja HGH stopniowo spada — po 20. roku życia o około 14% na dekadę.',
      },
      {
        'header': 'Jak naturalnie zwiększyć HGH',
        'body':
            '1. Śpij 8–10 godzin każdej nocy (głęboki sen = największe wyrzuty HGH).\n'
            '2. Ćwicz intensywnie — sprinty i trening siłowy wywołują duże wyrzuty HGH.\n'
            '3. Jedz wystarczająco dużo białka — arginina i ornityna pobudzają HGH.\n'
            '4. Unikaj skoków cukru przed snem — wysoki poziom cukru we krwi hamuje wydzielanie HGH podczas snu.',
      },
      {
        'header': 'Co obniża HGH?',
        'body':
            '• Przewlekły niedobór snu.\n'
            '• Nadmiar tkanki tłuszczowej, zwłaszcza na brzuchu.\n'
            '• Dużo cukru i przetworzonego jedzenia.\n'
            '• Przewlekły stres (podnosi kortyzol, hamuje HGH).\n'
            '• Siedzący tryb życia z małą ilością ruchu.',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
      'Takahashi Y et al. J Clin Invest. 1968;47(9):2079-90.',
      'Wideman L et al. Sports Med. 2002;32(15):987-1004.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'Jak działają chrząstki wzrostowe?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'Czym są chrząstki wzrostowe?',
        'body':
            'Chrząstki wzrostowe (płytki nasadowe) to cienkie warstwy chrząstki w pobliżu końców kości długich. Tylko w tych miejscach przybywa nowej tkanki kostnej, dzięki której kości się wydłużają. Dopóki pozostają otwarte (niezrośnięte), możesz jeszcze urosnąć.',
      },
      {
        'header': 'Jak kości się wydłużają',
        'body':
            'W każdej chrząstce wzrostowej stale dzielą się chondrocyty. Nowe komórki chrząstki spychają starsze w stronę trzonu kości, gdzie w procesie kostnienia zastępuje je twarda tkanka kostna. Dzięki temu cyklowi nogi i kręgosłup z czasem się wydłużają.',
      },
      {
        'header': 'Kiedy zamykają się chrząstki wzrostowe?',
        'body':
            'Zamykanie chrząstek wzrostowych wywołują głównie hormony płciowe:\n'
            '\n'
            '• Dziewczyny: chrząstki zaczynają się zrastać w wieku około 14–16 lat.\n'
            '• Chłopcy: chrząstki zaczynają się zrastać w wieku około 16–18 lat.\n'
            '• Niektóre chrząstki mogą zamknąć się w pełni dopiero około 25 roku życia.\n'
            '\n'
            'RTG dłoni i nadgarstka (badanie wieku kostnego) może pokazać pozostały potencjał.',
      },
      {
        'header': 'Co wpływa na zamykanie chrząstek',
        'body':
            '• Wczesne dojrzewanie → wcześniejsze zamknięcie (mniej czasu na wzrost).\n'
            '• Niedożywienie → opóźnione zamknięcie, ale też wolniejsze tempo wzrostu.\n'
            '• Otyłość → więcej estrogenu może przyspieszyć zamknięcie.\n'
            '• Odpowiednie odżywianie i sen wspierają zdrową pracę chrząstek.',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
      'Weise M et al. PNAS. 2001;98(12):6871-6.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Sen i wzrost: co mówi nauka',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Dlaczego sen to podstawa',
        'body':
            'Nawet 75% dobowej ilości hormonu wzrostu wydziela się podczas snu. Żadne ćwiczenia ani dieta nie zrekompensują w pełni słabego snu. Twoje ciało dosłownie buduje kości i naprawia tkanki, kiedy śpisz.',
      },
      {
        'header': 'Cykle snu a wydzielanie GH',
        'body':
            'Typowa noc to 4–6 cykli snu, każdy po około 90 minut. Największe wyrzuty HGH pojawiają się w 3. fazie snu, czyli w śnie głębokim, zwłaszcza w pierwszych 1–2 cyklach. Późne chodzenie spać lub częste budzenie się oznacza utratę tych ważnych wyrzutów.',
      },
      {
        'header': 'Ile snu potrzebujesz?',
        'body':
            '• Wiek 6–12 lat: 9–12 godzin na dobę.\n'
            '• Wiek 13–15 lat: 9–10 godzin na dobę.\n'
            '• Wiek 16–18 lat: 8–10 godzin na dobę.\n'
            '• Wiek 19–25 lat: 7–9 godzin na dobę.\n'
            '\n'
            'Celuj w górną granicę, jeśli wciąż intensywnie rośniesz.',
      },
      {
        'header': 'Jak lepiej spać',
        'body':
            '1. Kładź się i wstawaj codziennie o tej samej porze.\n'
            '2. Odłóż ekrany 30 minut przed snem (niebieskie światło hamuje melatoninę).\n'
            '3. Zadbaj, by w pokoju było chłodno (18–20 °C) i ciemno.\n'
            '4. Unikaj kofeiny po 14:00 i ciężkich posiłków 2 godziny przed snem.\n'
            '5. Lekkie rozciąganie przed snem pomaga rozluźnić ciało.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
      'Paruthi S et al. J Clin Sleep Med. 2016;12(6):785-786.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Odżywianie dla maksymalnego wzrostu',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Dlaczego dieta ma znaczenie dla wzrostu',
        'body':
            'Geny wyznaczają twój potencjał wzrostu, ale to odżywianie decyduje, czy go osiągniesz. Dzięki lepszemu odżywianiu w ciągu ostatniego stulecia średni wzrost w wielu krajach zwiększył się nawet o 10 cm.',
      },
      {
        'header': 'Wapń — budulec kości',
        'body':
            'Wapń stanowi około 70% tkanki kostnej. W latach najszybszego wzrostu potrzebujesz 1000–1300 mg dziennie. Najlepsze źródła: mleko, jogurt, ser, brokuły, migdały. Łącz go z witaminą D, by lepiej się wchłaniał.',
      },
      {
        'header': 'Białko — paliwo wzrostu',
        'body':
            'Nastolatki potrzebują około 1,0–1,5 g białka na kg masy ciała dziennie. Szczególnie arginina pobudza wydzielanie HGH. Świetne źródła: jajka, kurczak, ryby, chuda wołowina, soczewica, jogurt grecki, tofu.',
      },
      {
        'header': 'Najważniejsze witaminy i minerały',
        'body':
            '• Witamina D: 600–1000 IU dziennie dla wchłaniania wapnia.\n'
            '• Cynk: 8–11 mg dziennie dla podziału komórek i wzrostu.\n'
            '• Witamina A: wspiera przebudowę kości (marchewka, bataty).\n'
            '• Żelazo: 8–15 mg dziennie, transportuje tlen do rosnących tkanek.\n'
            '• Fosfor i magnez: razem z wapniem mineralizują kości.',
      },
      {
        'header': 'Czego unikać',
        'body':
            '• Nadmiaru cukru i słodkich napojów gazowanych — wypłukują wapń i hamują HGH.\n'
            '• Drastycznych diet — hamują wzrost.\n'
            '• Zbyt dużej ilości kofeiny — utrudnia wchłanianie wapnia.\n'
            '• Mocno przetworzonego jedzenia — ma mało mikroskładników.',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
      'Prentice A. Public Health Nutr. 2004;7(1A):227-243.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Ruch i wzrost: co mówi nauka',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Czy ćwiczenia sprawią, że urośniesz?',
        'body':
            'Same ćwiczenia nie zmienią twojego genetycznego limitu wzrostu, ale pomagają w pełni wykorzystać potencjał. Aktywność fizyczna pobudza wydzielanie HGH, wzmacnia kości i poprawia postawę.',
      },
      {
        'header': 'Ćwiczenia udarowe a chrząstki wzrostowe',
        'body':
            'Bieganie, skakanie i koszykówka tworzą mechaniczne obciążenie chrząstek wzrostowych, pobudzając aktywność chondrocytów i sprzyjając wzrostowi kości. Sportowcy z dyscyplin skocznych mają zwykle większą gęstość mineralną kości.',
      },
      {
        'header': 'Najlepsze ćwiczenia na wzrost',
        'body':
            '1. Skoki: skakanka, wskoki na skrzynię — pobudzają chrząstki wzrostowe w nogach.\n'
            '2. Sprinty: wywołują duże wyrzuty HGH.\n'
            '3. Pływanie: rozciąga całe ciało przy małym obciążeniu stawów.\n'
            '4. Zwisy i podciąganie: odciążają kręgosłup.\n'
            '5. Joga / rozciąganie dynamiczne: poprawiają postawę.\n'
            '6. Umiarkowany trening siłowy: wspiera wzrost kości.',
      },
      {
        'header': 'Reakcja HGH na wysiłek',
        'body':
            'Intensywny wysiłek może podnieść poziom HGH o 300–500% na 1–2 godziny po treningu. Kluczowe czynniki:\n'
            '\n'
            '• Intensywność > 70% maksymalnego wysiłku.\n'
            '• Czas trwania co najmniej 10–20 minut.\n'
            '• Przerwy 60–90 sekund między seriami.',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
      'Behringer M et al. Pediatrics. 2014;133(5):e1121.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Postawa i ukryte centymetry',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Jak postawa wpływa na twój wzrost',
        'body':
            'Zła postawa może sprawić, że wyglądasz o 2–5 cm niżej, niż wynika z budowy twojego szkieletu. Zaokrąglone barki i wysunięta do przodu głowa uciskają kręgosłup. Prawidłowa postawa może od razu „dodać” centymetrów w pomiarze.',
      },
      {
        'header': 'Ucisk kręgosłupa w ciągu dnia',
        'body':
            'W ciągu dnia grawitacja uciska krążki międzykręgowe. Rano twój wzrost jest największy, a wieczorem najmniejszy — różnica może wynosić 1,5–2,5 cm. Zła postawa i słabe mięśnie core pogłębiają ten efekt.',
      },
      {
        'header': 'Ćwiczenia odciążające kręgosłup',
        'body':
            '1. Zwis na drążku (30–60 s) — grawitacja rozciąga kręgosłup.\n'
            '2. Koci grzbiet — wyginaj i zaokrąglaj plecy w klęku podpartym.\n'
            '3. Pozycja kobry — z leżenia na brzuchu unieś klatkę piersiową.\n'
            '4. Pozycja dziecka — uklęknij i sięgnij rękami do przodu.\n'
            '5. Anioły przy ścianie — wzmacniają mięśnie posturalne.',
      },
      {
        'header': 'Nawyki dla dobrej postawy na dłużej',
        'body':
            '• Ergonomiczne biurko — ekran na wysokości oczu.\n'
            '• 2-minutowa przerwa na postawę co 30 minut siedzenia.\n'
            '• Wzmacniaj brzuch i plecy (deska, wiosłowanie).\n'
            '• Wyobraź sobie nitkę, która ciągnie czubek głowy w górę.\n'
            '• Śpij na plecach z cienką poduszką.',
      },
    ],
    'references': [
      'Kim D et al. J Phys Ther Sci. 2015;27(6):1791-4.',
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Wzrost: mity i fakty',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Mit: „Geny decydują o wszystkim”',
        'body':
            'FAKT: Geny odpowiadają za 60–80% wzrostu docelowego. Pozostałe 20–40% zależy od odżywiania, snu i ruchu. W Korei Południowej i Holandii średni wzrost zwiększył się o 10–15 cm w ciągu zaledwie kilku pokoleń dzięki lepszemu odżywianiu.',
      },
      {
        'header': 'Mit: „Rozciąganie trwale dodaje wzrostu”',
        'body':
            'FAKT: Rozciąganie poprawia postawę i zmniejsza ucisk kręgosłupa, przez co pomiar może pokazać 1–3 cm więcej. Nie wydłuża jednak kości. Zysk wynika z korekty postawy, a nie ze wzrostu kości.',
      },
      {
        'header': 'Mit: „Samo mleko sprawi, że urośniesz”',
        'body':
            'FAKT: Mleko dostarcza wapnia, białka i witaminy D — i to świetnie. Ale potrzebujesz też cynku, witaminy A, żelaza i fosforu. Wzrost wymaga całej drużyny składników odżywczych, a nie jednego produktu.',
      },
      {
        'header': 'Mit: „Po 18 latach już się nie rośnie”',
        'body':
            'FAKT: Większość osób kończy rosnąć do 18. roku życia, ale niektórzy — zwłaszcza chłopcy, którzy później weszli w okres dojrzewania — rosną aż do 20–22 lat. Moment zamknięcia chrząstek wzrostowych jest różny. RTG wieku kostnego może pokazać pozostały potencjał.',
      },
      {
        'header': 'Mit: „Ciężary hamują wzrost nastolatków”',
        'body':
            'FAKT: Trening siłowy pod odpowiednim nadzorem jest bezpieczny dla nastolatków i wspiera wzrost, zwiększając HGH i wzmacniając kości. Mit wziął się z rzadkich kontuzji przy nieprawidłowym dźwiganiu dużych ciężarów.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
      'Faigenbaum AD et al. J Strength Cond Res. 2009;23(5):S60-79.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Wykorzystaj swoje okno wzrostu',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Jak działają skoki wzrostowe',
        'body':
            'Wzrost następuje skokami. Dwa główne skoki wzrostowe:\n'
            '\n'
            '1. Od urodzenia do 2 lat (~25 cm w pierwszym roku).\n'
            '2. Dojrzewanie (dziewczyny: szczyt ~8–10 cm/rok; chłopcy: ~10–12 cm/rok).\n'
            '\n'
            'Między skokami dzieci rosną o około 5–6 cm rocznie.',
      },
      {
        'header': 'Moment dojrzewania ma znaczenie',
        'body':
            'Osoby, które dojrzewają wcześnie, rosną szybko, ale wcześniej kończą. Te, które dojrzewają później, na początku rosną wolniej, ale dzięki dłuższemu okresowi wzrostu często są w końcu wyższe. Jeśli znajomi są teraz wyżsi, twój największy skok może być jeszcze przed tobą — i ostatecznie możesz urosnąć więcej.',
      },
      {
        'header': 'Co robić w każdym wieku',
        'body':
            'Wiek 8–12 lat: zbuduj fundament.\n'
            '• Zbilansowana dieta z wapniem i białkiem. Ponad 10 godzin snu.\n'
            '\n'
            'Wiek 13–16 lat: kluczowe okno.\n'
            '• Postaw na ponad 9 godzin snu. Sprinty i skoki.\n'
            '• 1300 mg wapnia, 1,2–1,5 g/kg białka dziennie.\n'
            '\n'
            'Wiek 17–20 lat: ostatnia szansa.\n'
            '• Świetne odżywianie, sen, ćwiczenia na postawę.',
      },
      {
        'header': 'Oznaki zbliżającego się skoku wzrostowego',
        'body':
            '• Rozmiar buta rośnie szybciej niż wzrost.\n'
            '• Dłonie i stopy wydają się nieproporcjonalnie duże.\n'
            '• Większy apetyt i głód.\n'
            '• Bóle wzrostowe (bolące nogi w nocy).\n'
            '• Ubrania szybko robią się za małe.\n'
            '\n'
            'Gdy zauważysz te oznaki, jeszcze bardziej postaw na sen i odżywianie.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
      'Rogol AD et al. J Adolesc Health. 2002;31(6):192-200.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];

// ── SWEDISH ─────────────────────────────────────────────────────
const List<Map<String, dynamic>> _articlesSv = [
  {
    'id': 'article_hgh',
    'title': 'Vad är tillväxthormon?',
    'icon': '🧬',
    'category': 'science',
    'sections': [
      {
        'header': 'Möt din tillväxtmotor: HGH',
        'body':
            'Tillväxthormon (HGH, human growth hormone) är ett litet protein som bildas i hypofysen vid basen av hjärnan. HGH är det viktigaste hormonet för att du ska växa på längden under barndomen och tonåren. Det signalerar till ditt skelett, dina muskler och organ att växa.',
      },
      {
        'header': 'Så fungerar hypofysen',
        'body':
            'Hypofysen frisätter HGH i pulser under hela dygnet, men de största pulserna kommer under djupsömn och direkt efter intensiv träning. Hypotalamus styr pulserna med hjälp av GHRH (stimulerar HGH) och somatostatin (hämmar HGH).',
      },
      {
        'header': 'När är HGH som högst?',
        'body':
            'HGH-nivåerna är som högst under puberteten. För killar kommer toppen oftast vid 13–15 års ålder, för tjejer vid 11–13 år. Efter åren med tillväxtspurt minskar produktionen av HGH gradvis, med cirka 14 % per decennium efter 20 års ålder.',
      },
      {
        'header': 'Så kan du öka HGH naturligt',
        'body':
            '1. Sov 8–10 timmar varje natt (djupsömn = störst HGH-pulser).\n'
            '2. Träna intensivt – sprinter och styrketräning ger stora HGH-pulser.\n'
            '3. Ät tillräckligt med protein – arginin och ornitin stimulerar HGH.\n'
            '4. Undvik blodsockertoppar före läggdags – högt blodsocker hämmar frisättningen av HGH under sömnen.',
      },
      {
        'header': 'Vad sänker HGH?',
        'body':
            '• Långvarig sömnbrist.\n'
            '• För mycket kroppsfett, särskilt runt magen.\n'
            '• Mycket socker och processad mat.\n'
            '• Långvarig stress (höjer kortisol och hämmar HGH).\n'
            '• Stillasittande livsstil med lite fysisk aktivitet.',
      },
    ],
    'references': [
      'Veldhuis JD et al. J Neuroendocrinol. 2012;24(12):1365-71.',
      'Takahashi Y et al. J Clin Invest. 1968;47(9):2079-90.',
      'Wideman L et al. Sports Med. 2002;32(15):987-1004.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'quality_sleep'],
  },
  {
    'id': 'article_growth_plates',
    'title': 'Hur fungerar tillväxtzonerna?',
    'icon': '🦴',
    'category': 'science',
    'sections': [
      {
        'header': 'Vad är tillväxtzoner?',
        'body':
            'Tillväxtzonerna (epifysplattorna) är tunna lager av brosk nära ändarna på dina långa rörben. De är de enda ställena där ny benvävnad läggs till så att benen blir längre. Så länge de är öppna (inte sammanväxta) kan du fortfarande växa på längden.',
      },
      {
        'header': 'Så blir skelettet längre',
        'body':
            'Inne i varje tillväxtzon delar sig broskceller (kondrocyter) hela tiden. Nya broskceller trycker de äldre mot benets skaft, där de ersätts av hård benvävnad genom förbening. Den här cykeln gör att dina ben och din ryggrad blir längre med tiden.',
      },
      {
        'header': 'När sluts tillväxtzonerna?',
        'body':
            'Att tillväxtzonerna sluts styrs främst av könshormonerna:\n'
            '\n'
            '• Tjejer: zonerna börjar växa ihop runt 14–16 års ålder.\n'
            '• Killar: zonerna börjar växa ihop runt 16–18 års ålder.\n'
            '• Vissa zoner sluts inte helt förrän vid 25 års ålder.\n'
            '\n'
            'En röntgen av hand och handled (skelettålder) kan visa hur mycket tillväxt som kan återstå.',
      },
      {
        'header': 'Det här påverkar när zonerna sluts',
        'body':
            '• Tidig pubertet → tidigare slutning (kortare tid att växa totalt).\n'
            '• Undernäring → senare slutning men också långsammare tillväxt.\n'
            '• Fetma → högre östrogennivåer kan påskynda slutningen.\n'
            '• Tillräckligt med näring och sömn håller tillväxtzonerna aktiva och friska.',
      },
    ],
    'references': [
      'Nilsson O et al. Horm Res. 2005;64(4):157-65.',
      'Weise M et al. PNAS. 2001;98(12):6871-6.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_sleep_growth',
    'title': 'Sömn & tillväxt: vetenskapen',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Därför är sömnen inte förhandlingsbar',
        'body':
            'Upp till 75 % av dygnets tillväxthormon frisätts under sömnen. Ingen mängd träning eller bra kost kan helt väga upp dålig sömn. Kroppen bygger bokstavligen skelett och reparerar vävnad medan du sover.',
      },
      {
        'header': 'Sömncykler och frisättning av GH',
        'body':
            'En vanlig natt består av 4–6 sömncykler på cirka 90 minuter vardera. De största HGH-pulserna kommer i djupsömnen (steg 3), särskilt under de första 1–2 cyklerna. Lägger du dig sent eller vaknar ofta missar du de här viktiga pulserna.',
      },
      {
        'header': 'Hur mycket sömn behöver du?',
        'body':
            '• 6–12 år: 9–12 timmar per natt.\n'
            '• 13–15 år: 9–10 timmar per natt.\n'
            '• 16–18 år: 8–10 timmar per natt.\n'
            '• 19–25 år: 7–9 timmar per natt.\n'
            '\n'
            'Sikta på den övre gränsen om du växer just nu.',
      },
      {
        'header': 'Tips för bättre sömn',
        'body':
            '1. Lägg dig och vakna vid samma tid varje dag.\n'
            '2. Lägg undan skärmar 30 minuter före läggdags (blått ljus hämmar melatonin).\n'
            '3. Håll rummet svalt (18–20 °C) och mörkt.\n'
            '4. Undvik koffein efter kl. 14 och tunga måltider 2 timmar före läggdags.\n'
            '5. Lätt stretch före läggdags hjälper kroppen att slappna av.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. J Pediatr. 1996;128(5):S32-7.',
      'Paruthi S et al. J Clin Sleep Med. 2016;12(6):785-786.',
    ],
    'relatedRoutineIds': ['quality_sleep'],
  },
  {
    'id': 'article_nutrition',
    'title': 'Kost för maximal tillväxt',
    'icon': '🥗',
    'category': 'nutrition',
    'sections': [
      {
        'header': 'Därför spelar kosten roll för längden',
        'body':
            'Generna sätter din längdpotential, men kosten avgör om du når den. Bättre kost under det senaste århundradet har ökat medellängden med upp till 10 cm i många länder.',
      },
      {
        'header': 'Kalcium – skelettets byggsten',
        'body':
            'Kalcium utgör cirka 70 % av benvävnaden. Under åren med snabbast tillväxt behöver du 1 000–1 300 mg per dag. Bästa källor: mjölk, yoghurt, ost, broccoli, mandlar. Kombinera med D-vitamin för bästa upptag.',
      },
      {
        'header': 'Protein – tillväxtens bränsle',
        'body':
            'Tonåringar behöver cirka 1,0–1,5 g protein per kg kroppsvikt och dag. Särskilt arginin stimulerar utsöndringen av HGH. Bra källor: ägg, kyckling, fisk, magert nötkött, linser, grekisk yoghurt, tofu.',
      },
      {
        'header': 'Viktiga vitaminer och mineraler',
        'body':
            '• D-vitamin: 600–1 000 IU per dag för kalciumupptaget.\n'
            '• Zink: 8–11 mg/dag för celldelning och tillväxt.\n'
            '• A-vitamin: stödjer skelettets ombyggnad (morötter, sötpotatis).\n'
            '• Järn: 8–15 mg/dag, transporterar syre till växande vävnader.\n'
            '• Fosfor & magnesium: mineraliserar skelettet tillsammans med kalcium.',
      },
      {
        'header': 'Det här bör du undvika',
        'body':
            '• För mycket socker och läsk – drar ut kalcium och hämmar HGH.\n'
            '• Extrema dieter – hämmar tillväxten.\n'
            '• För mycket koffein – försämrar kalciumupptaget.\n'
            '• Kraftigt processad mat – innehåller lite mikronäringsämnen.',
      },
    ],
    'references': [
      'Golden NH et al. Pediatrics. 2014;134(4):e1229-43.',
      'Prentice A. Public Health Nutr. 2004;7(1A):227-243.',
    ],
    'relatedRoutineIds': ['protein'],
  },
  {
    'id': 'article_exercise_height',
    'title': 'Träning & längd: vetenskapen',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Kan träning göra dig längre?',
        'body':
            'Träning i sig kan inte ändra den längd dina gener sätter som tak, men den hjälper dig att nå din fulla potential. Fysisk aktivitet stimulerar frisättningen av HGH, stärker skelettet och förbättrar hållningen.',
      },
      {
        'header': 'Stötbelastning och tillväxtzoner',
        'body':
            'Löpning, hopp och basket ger mekanisk belastning på tillväxtzonerna, vilket stimulerar broskcellernas aktivitet och främjar mer benbildning. Idrottare i hoppsporter har ofta högre bentäthet.',
      },
      {
        'header': 'Bästa övningarna för tillväxt',
        'body':
            '1. Hopp: hopprep, boxhopp – stimulerar tillväxtzonerna i benen.\n'
            '2. Sprint: ger stora HGH-pulser.\n'
            '3. Simning: stretchar hela kroppen med låg belastning.\n'
            '4. Häng & chins: avlastar ryggraden.\n'
            '5. Yoga/dynamisk stretch: förbättrar hållningen.\n'
            '6. Måttlig styrketräning: stödjer skelettets tillväxt.',
      },
      {
        'header': 'Så svarar HGH på träning',
        'body':
            'Högintensiv träning kan höja HGH med 300–500 % i 1–2 timmar efter passet. Viktiga faktorer:\n'
            '\n'
            '• Intensitet > 70 % av maxansträngning.\n'
            '• Minst 10–20 minuters träning.\n'
            '• Vila 60–90 sekunder mellan seten.',
      },
    ],
    'references': [
      'Godfrey RJ et al. Sports Med. 2003;33(8):599-613.',
      'Behringer M et al. Pediatrics. 2014;133(5):e1121.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'posture_check'],
  },
  {
    'id': 'article_posture',
    'title': 'Hållning & dolda centimeter',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Så påverkar hållningen din längd',
        'body':
            'Dålig hållning kan få dig att se 2–5 cm kortare ut än din faktiska skelettlängd. Framåtrullade axlar och framskjutet huvud trycker ihop ryggraden. Att stå rätt kan direkt ”lägga till” centimeter till din uppmätta längd.',
      },
      {
        'header': 'Ryggraden trycks ihop under dagen',
        'body':
            'Tyngdkraften trycker ihop diskarna mellan kotorna under dagen. Du är längst på morgonen och kortast på kvällen – skillnaden kan vara 1,5–2,5 cm. Dålig hållning och svaga bålmuskler gör det värre.',
      },
      {
        'header': 'Avlastande övningar',
        'body':
            '1. Stånghäng (30–60 sek) – sträck ryggraden med tyngdkraftens hjälp.\n'
            '2. Katt-ko – svanka och runda ryggen på alla fyra.\n'
            '3. Kobrastretch – pressa upp bröstet från magliggande.\n'
            '4. Barnets position – sitt på knä och sträck dig framåt.\n'
            '5. Väggänglar – stärker hållningsmusklerna.',
      },
      {
        'header': 'Hållningsvanor på lång sikt',
        'body':
            '• Ergonomisk skrivplats – skärmen i ögonhöjd.\n'
            '• 2 minuters hållningspaus var 30:e minut du sitter.\n'
            '• Stärk bål och rygg (plankan, rodd).\n'
            '• Tänk dig ett snöre som drar hjässan uppåt.\n'
            '• Sov på rygg med en tunn kudde.',
      },
    ],
    'references': [
      'Kim D et al. J Phys Ther Sci. 2015;27(6):1791-4.',
      'Reilly T et al. Ergonomics. 1984;27(1):11-16.',
    ],
    'relatedRoutineIds': ['posture_check', 'morning_stretch'],
  },
  {
    'id': 'article_myths',
    'title': 'Längdtillväxt: myter och fakta',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Myt: ”Generna avgör allt”',
        'body':
            'FAKTA: Generna står för 60–80 % av slutlängden. Resterande 20–40 % beror på kost, sömn och träning. I Sydkorea och Nederländerna ökade medellängden med 10–15 cm på bara några generationer tack vare bättre kost.',
      },
      {
        'header': 'Myt: ”Stretch gör dig permanent längre”',
        'body':
            'FAKTA: Stretch förbättrar hållningen och minskar kompressionen av ryggraden, vilket kan göra att du mäter 1–3 cm mer. Men skelettet blir inte längre. Ökningen kommer från bättre hållning, inte från benväxt.',
      },
      {
        'header': 'Myt: ”Mjölk räcker för att bli lång”',
        'body':
            'FAKTA: Mjölk ger kalcium, protein och D-vitamin – allt bra. Men du behöver också zink, A-vitamin, järn och fosfor. Tillväxt kräver ett helt lag av näringsämnen, inte ett enda livsmedel.',
      },
      {
        'header': 'Myt: ”Man slutar växa vid 18”',
        'body':
            'FAKTA: De flesta har vuxit klart vid 18, men vissa – särskilt killar med sen pubertet – fortsätter till 20–22 års ålder. När tillväxtzonerna sluts varierar. En röntgen av skelettåldern kan visa om det finns tillväxt kvar.',
      },
      {
        'header': 'Myt: ”Vikter hämmar tonåringars tillväxt”',
        'body':
            'FAKTA: Styrketräning med rätt handledning är säker för tonåringar och stödjer tillväxten genom att öka HGH och stärka skelettet. Myten kommer från sällsynta skador orsakade av felaktiga tunga lyft.',
      },
    ],
    'references': [
      'Silventoinen K. J Biosoc Sci. 2003;35(2):263-85.',
      'Faigenbaum AD et al. J Strength Cond Res. 2009;23(5):S60-79.',
    ],
    'relatedRoutineIds': ['morning_stretch', 'protein'],
  },
  {
    'id': 'article_growth_window',
    'title': 'Ta vara på ditt tillväxtfönster',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Så fungerar tillväxtspurter',
        'body':
            'Längdtillväxt sker i skov. Två stora tillväxtspurter:\n'
            '\n'
            '1. Från födseln till 2 års ålder (~25 cm första året).\n'
            '2. Puberteten (tjejer: topp ~8–10 cm/år; killar: ~10–12 cm/år).\n'
            '\n'
            'Mellan spurterna växer barn cirka 5–6 cm per år.',
      },
      {
        'header': 'Pubertetens timing spelar roll',
        'body':
            'Den som kommer tidigt i puberteten växer snabbt men slutar tidigare. Den som kommer sent växer långsammare i början men blir ofta längre, tack vare fler år av tillväxt. Om dina kompisar är längre nu har du kanske inte nått din största spurt än – och kan i slutändan växa mer.',
      },
      {
        'header': 'Det här kan du göra i varje ålder',
        'body':
            '8–12 år: Bygg grunden.\n'
            '• Balanserad kost med kalcium och protein. 10+ timmars sömn.\n'
            '\n'
            '13–16 år: Det avgörande fönstret.\n'
            '• Prioritera 9+ timmars sömn. Sprint- och hoppövningar.\n'
            '• 1 300 mg kalcium, 1,2–1,5 g/kg protein per dag.\n'
            '\n'
            '17–20 år: Sista chansen.\n'
            '• Riktigt bra kost, sömn och hållningsövningar.',
      },
      {
        'header': 'Tecken på att en tillväxtspurt är på väg',
        'body':
            '• Skostorleken ökar före längden.\n'
            '• Händer och fötter verkar oproportionerligt stora.\n'
            '• Större aptit och mer hunger.\n'
            '• Växtvärk (värk i benen på natten).\n'
            '• Kläderna blir snabbt för små.\n'
            '\n'
            'När du märker de här tecknen: satsa extra på sömn och kost.',
      },
    ],
    'references': [
      'Tanner JM. Growth at Adolescence. Blackwell, 1962.',
      'Rogol AD et al. J Adolesc Health. 2002;31(6):192-200.',
    ],
    'relatedRoutineIds': ['quality_sleep', 'protein', 'morning_stretch'],
  },
];
