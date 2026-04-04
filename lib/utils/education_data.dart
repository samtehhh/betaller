// Education articles about height growth for the BeTaller app.
// Each article is a Map with structured sections and scientific references.

const List<Map<String, dynamic>> educationArticles = [
  // ── 1. What is Growth Hormone? ─────────────────────────────────
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
            'pituitary gland, a pea-sized gland sitting at the base of your '
            'brain. HGH is the single most important hormone for increasing '
            'your height during childhood and adolescence. It tells your '
            'bones, muscles, and organs to grow bigger and stronger.',
      },
      {
        'header': 'How the Pituitary Gland Works',
        'body':
            'The pituitary gland releases HGH in pulses throughout the day, '
            'but the largest bursts happen during deep sleep (especially in '
            'the first 2 hours after falling asleep) and right after intense '
            'exercise. A region of the brain called the hypothalamus controls '
            'these pulses using two chemical signals: GHRH (which tells the '
            'pituitary to release more HGH) and somatostatin (which tells it '
            'to slow down).',
      },
      {
        'header': 'When Does HGH Peak?',
        'body':
            'HGH levels are highest during puberty. For boys, the peak '
            'typically occurs between ages 13 and 15; for girls, between ages '
            '11 and 13. After the growth-spurt years, HGH production '
            'gradually declines — by about 14% per decade after age 20. This '
            'is why your teenage years are the golden window for height gain.',
      },
      {
        'header': 'How to Boost HGH Naturally',
        'body':
            'You can maximize your natural HGH output with four key habits:\n\n'
            '1. Sleep 8–10 hours every night (deep sleep = biggest HGH pulses).\n'
            '2. Exercise intensely — sprints, jump rope, and resistance '
            'training trigger large HGH releases.\n'
            '3. Eat enough protein — amino acids like arginine and ornithine '
            'stimulate HGH secretion.\n'
            '4. Avoid sugar spikes before bed — high blood sugar suppresses '
            'HGH release during sleep.',
      },
      {
        'header': 'What Lowers HGH?',
        'body':
            'Several lifestyle factors can reduce HGH output:\n\n'
            '• Chronic sleep deprivation (fewer deep-sleep cycles).\n'
            '• Excess body fat, especially around the belly.\n'
            '• High sugar and processed food intake.\n'
            '• Chronic stress, which raises cortisol and suppresses HGH.\n'
            '• Sedentary lifestyle with little physical activity.',
      },
    ],
    'references': [
      'Veldhuis JD et al. "Neuroendocrine control of pulsatile growth hormone release." J Neuroendocrinol. 2012;24(12):1365-71.',
      'Takahashi Y et al. "Growth hormone secretion during sleep." J Clin Invest. 1968;47(9):2079-90.',
      'Wideman L et al. "Growth hormone release during acute and chronic aerobic and resistance exercise." Sports Med. 2002;32(15):987-1004.',
    ],
    'relatedRoutineIds': ['routine_sleep', 'routine_sprint', 'routine_jump_rope'],
  },

  // ── 2. How Do Growth Plates Work? ──────────────────────────────
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
            'located near the ends of your long bones — such as your femur '
            '(thigh bone) and tibia (shin bone). These plates are the only '
            'areas where new bone tissue is added to increase length. As long '
            'as they remain open (unfused), you can still grow taller.',
      },
      {
        'header': 'How Bones Get Longer',
        'body':
            'Inside each growth plate, cells called chondrocytes are constantly '
            'dividing. New cartilage cells push older ones toward the bone '
            'shaft, where they are gradually replaced by hard bone tissue '
            'through a process called ossification. This cycle of cartilage '
            'formation and bone replacement is what makes your legs and spine '
            'longer over time.',
      },
      {
        'header': 'When Do Growth Plates Close?',
        'body':
            'Growth plate closure is triggered mainly by sex hormones '
            '(estrogen in both sexes). Timing varies:\n\n'
            '• Girls: plates typically begin fusing around age 14–16.\n'
            '• Boys: plates typically begin fusing around age 16–18.\n'
            '• Some plates (e.g., the collarbone) may not fully close until '
            'age 25.\n\n'
            'A hand/wrist X-ray (bone age test) can show how much growth '
            'potential remains.',
      },
      {
        'header': 'Factors That Affect Plate Closure',
        'body':
            'Several factors can speed up or slow down closure:\n\n'
            '• Early puberty → earlier closure (less total growth time).\n'
            '• Malnutrition or chronic illness → delayed closure but also '
            'slower growth rate.\n'
            '• Obesity → higher estrogen levels can accelerate closure.\n'
            '• Adequate nutrition and sleep help maintain a healthy pace of '
            'growth and plate activity.',
      },
    ],
    'references': [
      'Nilsson O et al. "Endocrine regulation of the growth plate." Horm Res. 2005;64(4):157-65.',
      'Weise M et al. "Effects of estrogen on growth plate senescence and epiphyseal fusion." PNAS. 2001;98(12):6871-6.',
      'Greulich WW, Pyle SI. "Radiographic Atlas of Skeletal Development of the Hand and Wrist." Stanford University Press, 1959.',
    ],
    'relatedRoutineIds': ['routine_stretch', 'routine_nutrition'],
  },

  // ── 3. The Science of Sleep & Growth ───────────────────────────
  {
    'id': 'article_sleep_growth',
    'title': 'The Science of Sleep & Growth',
    'icon': '🌙',
    'category': 'sleep',
    'sections': [
      {
        'header': 'Why Sleep Is Non-Negotiable for Height',
        'body':
            'Up to 75% of daily growth hormone is released during sleep. '
            'This is not a small detail — it means that no amount of exercise '
            'or nutrition can fully compensate for poor sleep. Your body '
            'literally builds bone and repairs tissue while you are asleep.',
      },
      {
        'header': 'Sleep Cycles and GH Release',
        'body':
            'A typical night contains 4–6 sleep cycles, each lasting about '
            '90 minutes. Each cycle moves through light sleep (stages 1–2), '
            'deep sleep (stage 3, also called slow-wave sleep), and REM '
            'sleep. The largest HGH pulses occur during stage 3 deep sleep, '
            'especially in the first 1–2 cycles of the night. If you go to '
            'bed late or wake up frequently, you miss these critical pulses.',
      },
      {
        'header': 'How Much Sleep Do You Need?',
        'body':
            'Recommended sleep by age for optimal growth:\n\n'
            '• Ages 6–12: 9–12 hours per night.\n'
            '• Ages 13–15: 9–10 hours per night.\n'
            '• Ages 16–18: 8–10 hours per night.\n'
            '• Ages 19–25: 7–9 hours per night.\n\n'
            'Aim for the higher end of these ranges if you are actively '
            'growing.',
      },
      {
        'header': 'Tips for Better Sleep',
        'body':
            '1. Go to bed and wake up at the same time every day, even on '
            'weekends.\n'
            '2. Stop screens (phone, tablet, TV) at least 30 minutes before '
            'bed — blue light suppresses melatonin.\n'
            '3. Keep your room cool (18–20 °C / 65–68 °F) and dark.\n'
            '4. Avoid caffeine after 2 PM and heavy meals within 2 hours of '
            'bedtime.\n'
            '5. Do light stretching or deep breathing before bed to relax '
            'your body.',
      },
      {
        'header': 'Sleep Position and Spinal Health',
        'body':
            'Sleeping on your back with a thin pillow allows your spine to '
            'fully decompress after a day of gravity. This can restore 1–2 cm '
            'of height that was lost during the day. Avoid sleeping on your '
            'stomach, which forces your neck into an unnatural twist and can '
            'compress the spine.',
      },
    ],
    'references': [
      'Van Cauter E, Plat L. "Physiology of growth hormone secretion during sleep." J Pediatr. 1996;128(5 Pt 2):S32-7.',
      'Paruthi S et al. "Recommended amount of sleep for pediatric populations." J Clin Sleep Med. 2016;12(6):785-786.',
      'Knutson KL. "Sleep duration and cardiometabolic risk." Best Pract Res Clin Endocrinol Metab. 2010;24(5):731-43.',
    ],
    'relatedRoutineIds': ['routine_sleep', 'routine_evening_stretch'],
  },

  // ── 4. Nutrition for Maximum Growth ────────────────────────────
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
            'whether you reach it. Studies show that improved nutrition over '
            'the past century has increased average height by up to 10 cm in '
            'many countries. Without the right building blocks, your body '
            'simply cannot construct new bone and muscle tissue.',
      },
      {
        'header': 'Calcium — The Bone Builder',
        'body':
            'Calcium is the primary mineral in bones, making up about 70% of '
            'bone tissue by weight. During peak growth years, your body needs '
            '1,000–1,300 mg of calcium daily. Top sources include milk, '
            'yogurt, cheese, fortified plant milks, broccoli, and almonds. '
            'Pair calcium with vitamin D for maximum absorption.',
      },
      {
        'header': 'Protein — The Growth Fuel',
        'body':
            'Protein provides amino acids that build every tissue in your '
            'body. Teenagers need about 1.0–1.5 g of protein per kg of body '
            'weight daily. The amino acid arginine is especially important '
            'because it stimulates HGH secretion. Great sources: eggs, '
            'chicken, fish, lean beef, lentils, Greek yogurt, and tofu.',
      },
      {
        'header': 'Key Vitamins and Minerals',
        'body':
            '• Vitamin D: Helps absorb calcium and directly supports bone '
            'growth. Get 600–1,000 IU daily from sunlight, fortified foods, '
            'or supplements.\n'
            '• Zinc: Essential for cell division and growth. Found in red '
            'meat, pumpkin seeds, and chickpeas. Aim for 8–11 mg/day.\n'
            '• Vitamin A: Supports bone remodeling. Found in carrots, sweet '
            'potatoes, and liver.\n'
            '• Iron: Carries oxygen to growing tissues. Found in spinach, '
            'red meat, and beans. Aim for 8–15 mg/day.\n'
            '• Phosphorus and Magnesium: Both work with calcium to '
            'mineralize bone. Found in nuts, seeds, whole grains, and fish.',
      },
      {
        'header': 'What to Avoid',
        'body':
            '• Excess sugar and soda — can leach calcium from bones and '
            'suppress HGH.\n'
            '• Extreme dieting or calorie restriction — stunts growth.\n'
            '• Too much caffeine — may interfere with calcium absorption.\n'
            '• Highly processed food — often low in the micronutrients '
            'your body needs to grow.',
      },
    ],
    'references': [
      'Golden NH et al. "Optimizing bone health in children and adolescents." Pediatrics. 2014;134(4):e1229-43.',
      'Millward DJ. "Nutrition, infection and stunting: the roles of deficiencies of individual nutrients and foods." Am J Clin Nutr. 2017;106(Suppl 1):343S-347S.',
      'Prentice A. "Diet, nutrition and the prevention of osteoporosis." Public Health Nutr. 2004;7(1A):227-243.',
    ],
    'relatedRoutineIds': ['routine_nutrition', 'routine_meal_plan'],
  },

  // ── 5. Exercise & Height: What Science Says ────────────────────
  {
    'id': 'article_exercise_height',
    'title': 'Exercise & Height: What Science Says',
    'icon': '🏃',
    'category': 'exercise',
    'sections': [
      {
        'header': 'Can Exercise Actually Make You Taller?',
        'body':
            'Exercise alone cannot change your genetic height ceiling, but it '
            'can help you reach your full potential. Regular physical activity '
            'stimulates growth hormone release, strengthens bones, and '
            'improves posture — all of which contribute to maximizing your '
            'height. Sedentary teens are more likely to fall short of their '
            'genetic potential.',
      },
      {
        'header': 'Impact Exercise and Growth Plates',
        'body':
            'Moderate impact activities — like running, jumping, and '
            'basketball — create mechanical stress on growth plates. This '
            'stress actually stimulates chondrocyte (cartilage cell) '
            'activity, encouraging more bone growth. Studies on young '
            'athletes show that those in jumping and running sports tend to '
            'have greater bone mineral density and, in some cases, slightly '
            'greater height than sedentary peers.',
      },
      {
        'header': 'Best Exercises for Growth',
        'body':
            '1. Jumping exercises: Jump rope, box jumps, basketball — the '
            'repetitive impact stimulates growth plates in the legs.\n'
            '2. Sprinting: Short, intense bursts trigger large HGH releases.\n'
            '3. Swimming: Full-body stretch and low-impact resistance.\n'
            '4. Hanging and pull-ups: Decompress the spine and strengthen '
            'the back.\n'
            '5. Yoga and dynamic stretching: Improve flexibility and '
            'posture.\n'
            '6. Resistance training (moderate): Builds muscle that supports '
            'bone growth (do not go excessively heavy before age 16).',
      },
      {
        'header': 'HGH Response to Exercise',
        'body':
            'High-intensity exercise can increase HGH levels by 300–500% '
            'for 1–2 hours post-workout. The key factors are:\n\n'
            '• Intensity > 70% of max effort.\n'
            '• Duration of at least 10–20 minutes.\n'
            '• Rest intervals of 60–90 seconds (for resistance training).\n\n'
            'Sprinting intervals (e.g., 8 × 20-second sprints) are among '
            'the most effective HGH-boosting exercises.',
      },
      {
        'header': 'Exercise Myths',
        'body':
            '• "Weight lifting stunts growth" — This is mostly a myth. '
            'Moderate resistance training with proper form is safe and '
            'beneficial for teens. Only extreme, improper heavy lifting with '
            'poor form poses a risk to growth plates.\n'
            '• "Stretching alone makes you taller" — Stretching improves '
            'flexibility and posture but does not lengthen bones.\n'
            '• "You need to exercise for hours" — Quality matters more '
            'than quantity. 30–60 minutes of focused exercise is plenty.',
      },
    ],
    'references': [
      'Godfrey RJ et al. "The exercise-induced growth hormone response in athletes." Sports Med. 2003;33(8):599-613.',
      'Daly RM. "The effect of exercise on bone mass and structural geometry during growth." Med Sport Sci. 2007;51:33-49.',
      'Behringer M et al. "Effects of resistance training on bone mineral density in children and adolescents." Pediatrics. 2014;133(5):e1121-e1131.',
    ],
    'relatedRoutineIds': ['routine_sprint', 'routine_jump_rope', 'routine_hanging', 'routine_swim'],
  },

  // ── 6. Posture & Height: The Hidden Centimeters ────────────────
  {
    'id': 'article_posture',
    'title': 'Posture & Height: The Hidden Centimeters',
    'icon': '🧍',
    'category': 'exercise',
    'sections': [
      {
        'header': 'How Posture Affects Your Measured Height',
        'body':
            'Poor posture can make you appear 2–5 cm shorter than your actual '
            'skeletal height. Rounded shoulders, forward head position, and '
            'excessive spinal curvature compress the natural curves of your '
            'spine. Simply standing properly can instantly "add" centimeters '
            'to your measured height.',
      },
      {
        'header': 'Spinal Compression Throughout the Day',
        'body':
            'Gravity compresses the fluid-filled discs between your '
            'vertebrae throughout the day. You are tallest in the morning '
            '(after lying down all night) and shortest in the evening. The '
            'difference can be 1.5–2.5 cm. This is normal, but chronic '
            'poor posture and weak core muscles make it worse.',
      },
      {
        'header': 'Common Posture Problems in Teens',
        'body':
            '• "Tech neck" — forward head posture from looking at phones '
            'and laptops.\n'
            '• Rounded shoulders — from hunching over desks or carrying '
            'heavy backpacks.\n'
            '• Anterior pelvic tilt — from sitting too long, which tightens '
            'hip flexors.\n'
            '• Thoracic kyphosis — excessive rounding of the upper back.\n\n'
            'These issues compress your spine and steal centimeters from '
            'your height.',
      },
      {
        'header': 'Decompression Exercises',
        'body':
            '1. Dead hang (30–60 seconds) — hang from a bar to let gravity '
            'stretch your spine.\n'
            '2. Cat-cow stretch — alternately arch and round your back on '
            'all fours.\n'
            '3. Cobra stretch — lie face-down, push your chest up to extend '
            'the spine.\n'
            '4. Child\'s pose — kneel and reach forward to lengthen the back.\n'
            '5. Wall angels — stand with your back against a wall and slide '
            'your arms up and down to strengthen postural muscles.\n'
            '6. Foam rolling the thoracic spine — roll your upper back over '
            'a foam roller to release tension.',
      },
      {
        'header': 'Building Long-Term Posture Habits',
        'body':
            '• Set up your desk ergonomically — screen at eye level, feet '
            'flat on the floor.\n'
            '• Take a 2-minute posture break every 30 minutes of sitting.\n'
            '• Strengthen your core and back muscles (planks, rows, '
            'deadlifts).\n'
            '• Be mindful of your posture — imagine a string pulling the '
            'top of your head toward the ceiling.\n'
            '• Sleep on your back with a thin pillow for overnight spinal '
            'decompression.',
      },
    ],
    'references': [
      'Kim D et al. "Effect of an exercise program for posture correction on musculoskeletal pain." J Phys Ther Sci. 2015;27(6):1791-4.',
      'Reilly T et al. "Investigation of diurnal variation in stature." Ergonomics. 1984;27(1):11-16.',
      'Korakakis V et al. "Physiotherapist perceptions of optimal sitting and standing posture." Musculoskelet Sci Pract. 2019;39:24-31.',
    ],
    'relatedRoutineIds': ['routine_posture', 'routine_hanging', 'routine_stretch'],
  },

  // ── 7. Myths vs Facts About Height Growth ──────────────────────
  {
    'id': 'article_myths',
    'title': 'Myths vs Facts About Height Growth',
    'icon': '❓',
    'category': 'myths',
    'sections': [
      {
        'header': 'Myth: "Genetics Is Everything"',
        'body':
            'FACT: Genetics accounts for about 60–80% of your final height. '
            'The remaining 20–40% is determined by nutrition, sleep, exercise, '
            'and overall health. In populations where nutrition improved '
            'dramatically (like South Korea and the Netherlands), average '
            'height increased by 10–15 cm in just a few generations — same '
            'gene pool, different nutrition.',
      },
      {
        'header': 'Myth: "Stretching Makes You Permanently Taller"',
        'body':
            'FACT: Stretching improves flexibility, reduces spinal '
            'compression, and helps posture — all of which can make you '
            'measure 1–3 cm taller. However, stretching does not lengthen '
            'your actual bones. The gains are real but come from posture '
            'correction and spinal decompression, not from bone growth.',
      },
      {
        'header': 'Myth: "Drinking Milk Alone Will Make You Tall"',
        'body':
            'FACT: Milk is a great source of calcium, protein, and vitamin D, '
            'all of which support bone growth. But milk alone is not enough. '
            'You also need zinc, vitamin A, iron, phosphorus, and adequate '
            'calories from a balanced diet. Growth requires a team of '
            'nutrients, not a single food.',
      },
      {
        'header': 'Myth: "You Stop Growing at 18"',
        'body':
            'FACT: While most people complete the majority of their height '
            'growth by age 18, some individuals — especially males who hit '
            'puberty later — continue growing until age 20–22. Growth plate '
            'closure varies from person to person. A bone age X-ray can '
            'reveal whether your plates are still open.',
      },
      {
        'header': 'Myth: "Weight Lifting Stunts Growth in Teens"',
        'body':
            'FACT: Properly supervised resistance training is safe for '
            'adolescents and can actually support growth by increasing HGH '
            'and strengthening bones. The myth originated from rare injuries '
            'caused by improper form and excessive loads. Moderate weight '
            'training with good technique is recommended by the American '
            'Academy of Pediatrics for teens.',
      },
    ],
    'references': [
      'Silventoinen K. "Determinants of variation in adult body height." J Biosoc Sci. 2003;35(2):263-85.',
      'Perkins JM et al. "Adult height, nutrition, and population health." Nutr Rev. 2016;74(3):149-65.',
      'Faigenbaum AD et al. "Youth resistance training: updated position statement from the National Strength and Conditioning Association." J Strength Cond Res. 2009;23(5 Suppl):S60-79.',
    ],
    'relatedRoutineIds': ['routine_nutrition', 'routine_stretch', 'routine_resistance'],
  },

  // ── 8. Maximizing Your Growth Window ───────────────────────────
  {
    'id': 'article_growth_window',
    'title': 'Maximizing Your Growth Window',
    'icon': '📈',
    'category': 'science',
    'sections': [
      {
        'header': 'Understanding Growth Spurts',
        'body':
            'Height growth is not steady — it happens in bursts. There are '
            'two major growth spurts in life:\n\n'
            '1. Infancy to age 2 (rapid growth of ~25 cm in year one).\n'
            '2. Puberty (girls: ~8–10 cm/year peak; boys: ~10–12 cm/year '
            'peak).\n\n'
            'Between these spurts, children grow about 5–6 cm per year. '
            'Recognizing where you are in this timeline helps you make the '
            'most of it.',
      },
      {
        'header': 'Puberty Timing Makes a Huge Difference',
        'body':
            'Early bloomers grow fast but stop sooner because their growth '
            'plates close earlier. Late bloomers grow slower initially but '
            'often end up taller because they have more years of growth. If '
            'you feel like your friends are taller than you right now, it '
            'may simply mean you have not hit your peak growth spurt yet — '
            'and you may ultimately grow more than they do.',
      },
      {
        'header': 'What to Do at Each Age',
        'body':
            'Ages 8–12: Build the foundation.\n'
            '• Focus on a balanced diet rich in calcium and protein.\n'
            '• Get 10+ hours of sleep.\n'
            '• Stay active with sports and play.\n\n'
            'Ages 13–16: The critical window.\n'
            '• Prioritize sleep (9+ hours) — this is when HGH peaks.\n'
            '• Add jump-based and sprint exercises.\n'
            '• Ensure 1,300 mg calcium and 1.2–1.5 g/kg protein daily.\n'
            '• Fix posture habits now.\n\n'
            'Ages 17–20: Final opportunity.\n'
            '• Maintain excellent nutrition and sleep.\n'
            '• Focus on posture and spinal decompression exercises.\n'
            '• Consider a bone age X-ray to check remaining potential.',
      },
      {
        'header': 'Signs Your Growth Spurt Is Coming',
        'body':
            'Common signs that a growth spurt is approaching or underway:\n\n'
            '• Shoe size increases before height.\n'
            '• Hands and feet seem disproportionately large.\n'
            '• Increased appetite and hunger.\n'
            '• Growing pains (aching legs, especially at night).\n'
            '• Rapid changes in clothing fit.\n\n'
            'If you notice these signs, double down on sleep, nutrition, '
            'and exercise to maximize the spurt.',
      },
      {
        'header': 'The 90-Day Growth Challenge',
        'body':
            'Commit to this plan for 90 days and track your progress:\n\n'
            '• Sleep: Bed by 10 PM, wake at the same time daily.\n'
            '• Nutrition: Hit daily protein, calcium, and vitamin D targets.\n'
            '• Exercise: 30 minutes of growth-focused exercise 5 days/week.\n'
            '• Posture: 5 minutes of decompression stretches morning and '
            'evening.\n'
            '• Hydration: Drink 2+ liters of water daily.\n\n'
            'While you cannot change your genetics, consistently following '
            'these habits gives you the best possible chance of reaching '
            'your maximum height.',
      },
    ],
    'references': [
      'Tanner JM. "Growth at Adolescence." 2nd ed. Blackwell Scientific, 1962.',
      'Rogol AD et al. "Growth at puberty." J Adolesc Health. 2002;31(6 Suppl):192-200.',
      'Cole TJ et al. "SITAR — a useful instrument for growth curve analysis." Int J Epidemiol. 2010;39(6):1558-66.',
    ],
    'relatedRoutineIds': ['routine_sleep', 'routine_nutrition', 'routine_sprint', 'routine_posture'],
  },
];
