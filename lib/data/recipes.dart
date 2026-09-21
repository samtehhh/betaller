/// Recipes for growth: the numbers live here, the words live per language.
///
/// Recipe copy is bulk content, so it sits in a Dart table keyed by language
/// rather than in the ARB files. Languages that are not translated yet fall
/// back to English, and adding one later means adding one map.
library;

class Recipe {
  final String id;

  /// breakfast | lunch | dinner | snack
  final String category;

  /// what it is rich in: protein, calcium, vitamin_d, zinc, magnesium,
  /// omega3, iron
  final List<String> nutrients;

  /// where the dish comes from, shown as a chip
  final String cuisine;

  final String icon;
  final int protein; // grams
  final int calories;
  final int minutes;
  final String difficulty; // easy | medium | hard

  const Recipe({
    required this.id,
    required this.category,
    required this.nutrients,
    required this.cuisine,
    required this.icon,
    required this.protein,
    required this.calories,
    required this.minutes,
    required this.difficulty,
  });
}

class RecipeCopy {
  final String name;
  final List<String> ingredients;
  final String steps;
  const RecipeCopy(this.name, this.ingredients, this.steps);
}

const List<Recipe> kRecipes = [
  // ── Breakfast ─────────────────────────────────────────────────────────────
  Recipe(id: 'protein_oatmeal', category: 'breakfast', nutrients: ['protein', 'magnesium'], cuisine: 'global', icon: '🥣', protein: 32, calories: 480, minutes: 10, difficulty: 'easy'),
  Recipe(id: 'menemen', category: 'breakfast', nutrients: ['protein', 'iron'], cuisine: 'turkish', icon: '🍳', protein: 22, calories: 380, minutes: 15, difficulty: 'easy'),
  Recipe(id: 'yogurt_parfait', category: 'breakfast', nutrients: ['calcium', 'protein'], cuisine: 'greek', icon: '🥛', protein: 20, calories: 280, minutes: 5, difficulty: 'easy'),
  Recipe(id: 'egg_avocado_toast', category: 'breakfast', nutrients: ['protein', 'magnesium'], cuisine: 'global', icon: '🥑', protein: 24, calories: 420, minutes: 10, difficulty: 'easy'),
  Recipe(id: 'huevos_rancheros', category: 'breakfast', nutrients: ['protein', 'iron'], cuisine: 'mexican', icon: '🌶️', protein: 26, calories: 450, minutes: 20, difficulty: 'medium'),
  Recipe(id: 'tofu_scramble', category: 'breakfast', nutrients: ['protein', 'calcium', 'iron'], cuisine: 'asian', icon: '🍲', protein: 25, calories: 340, minutes: 15, difficulty: 'easy'),
  Recipe(id: 'cheese_omelette_mushroom', category: 'breakfast', nutrients: ['protein', 'vitamin_d', 'calcium'], cuisine: 'french', icon: '🍄', protein: 28, calories: 400, minutes: 12, difficulty: 'easy'),
  Recipe(id: 'sardine_toast', category: 'breakfast', nutrients: ['omega3', 'vitamin_d', 'calcium'], cuisine: 'mediterranean', icon: '🐟', protein: 27, calories: 390, minutes: 8, difficulty: 'easy'),

  // ── Lunch ─────────────────────────────────────────────────────────────────
  Recipe(id: 'salmon_quinoa_bowl', category: 'lunch', nutrients: ['omega3', 'protein', 'vitamin_d'], cuisine: 'nordic', icon: '🍣', protein: 38, calories: 620, minutes: 25, difficulty: 'medium'),
  Recipe(id: 'lentil_soup', category: 'lunch', nutrients: ['iron', 'protein', 'magnesium'], cuisine: 'turkish', icon: '🍜', protein: 18, calories: 320, minutes: 30, difficulty: 'easy'),
  Recipe(id: 'chicken_bulgur_pilaf', category: 'lunch', nutrients: ['protein', 'zinc'], cuisine: 'turkish', icon: '🍚', protein: 40, calories: 580, minutes: 30, difficulty: 'medium'),
  Recipe(id: 'tuna_chickpea_salad', category: 'lunch', nutrients: ['omega3', 'protein', 'iron'], cuisine: 'mediterranean', icon: '🥗', protein: 34, calories: 430, minutes: 10, difficulty: 'easy'),
  Recipe(id: 'paneer_spinach', category: 'lunch', nutrients: ['calcium', 'iron', 'protein'], cuisine: 'indian', icon: '🥬', protein: 29, calories: 460, minutes: 25, difficulty: 'medium'),
  Recipe(id: 'beef_soba', category: 'lunch', nutrients: ['protein', 'zinc', 'iron'], cuisine: 'japanese', icon: '🍝', protein: 36, calories: 560, minutes: 20, difficulty: 'medium'),
  Recipe(id: 'falafel_bowl', category: 'lunch', nutrients: ['protein', 'magnesium', 'iron'], cuisine: 'middle_eastern', icon: '🧆', protein: 24, calories: 520, minutes: 25, difficulty: 'medium'),
  Recipe(id: 'tuna_rice_bowl', category: 'lunch', nutrients: ['omega3', 'protein'], cuisine: 'japanese', icon: '🍱', protein: 33, calories: 540, minutes: 15, difficulty: 'easy'),

  // ── Dinner ────────────────────────────────────────────────────────────────
  Recipe(id: 'chicken_sweet_potato', category: 'dinner', nutrients: ['protein', 'zinc'], cuisine: 'global', icon: '🍗', protein: 45, calories: 550, minutes: 35, difficulty: 'medium'),
  Recipe(id: 'baked_mackerel', category: 'dinner', nutrients: ['omega3', 'vitamin_d', 'protein'], cuisine: 'turkish', icon: '🐠', protein: 42, calories: 520, minutes: 30, difficulty: 'medium'),
  Recipe(id: 'beef_stir_fry', category: 'dinner', nutrients: ['zinc', 'protein', 'iron'], cuisine: 'chinese', icon: '🥢', protein: 41, calories: 590, minutes: 20, difficulty: 'medium'),
  Recipe(id: 'salmon_teriyaki', category: 'dinner', nutrients: ['omega3', 'vitamin_d', 'protein'], cuisine: 'japanese', icon: '🍥', protein: 39, calories: 600, minutes: 25, difficulty: 'medium'),
  Recipe(id: 'dal_tadka', category: 'dinner', nutrients: ['iron', 'protein', 'magnesium'], cuisine: 'indian', icon: '🍛', protein: 22, calories: 410, minutes: 35, difficulty: 'medium'),
  Recipe(id: 'turkey_meatballs', category: 'dinner', nutrients: ['protein', 'zinc'], cuisine: 'italian', icon: '🍖', protein: 43, calories: 560, minutes: 30, difficulty: 'medium'),
  Recipe(id: 'shrimp_broccoli', category: 'dinner', nutrients: ['protein', 'calcium', 'zinc'], cuisine: 'mediterranean', icon: '🍤', protein: 37, calories: 430, minutes: 20, difficulty: 'easy'),
  Recipe(id: 'stuffed_peppers', category: 'dinner', nutrients: ['protein', 'iron'], cuisine: 'turkish', icon: '🫑', protein: 26, calories: 470, minutes: 45, difficulty: 'hard'),

  // ── Snacks ────────────────────────────────────────────────────────────────
  Recipe(id: 'cheese_walnut_plate', category: 'snack', nutrients: ['calcium', 'omega3', 'magnesium'], cuisine: 'turkish', icon: '🧀', protein: 18, calories: 300, minutes: 5, difficulty: 'easy'),
  Recipe(id: 'milk_banana_smoothie', category: 'snack', nutrients: ['calcium', 'protein', 'magnesium'], cuisine: 'global', icon: '🥤', protein: 21, calories: 320, minutes: 5, difficulty: 'easy'),
  Recipe(id: 'pumpkin_seed_mix', category: 'snack', nutrients: ['zinc', 'magnesium', 'iron'], cuisine: 'global', icon: '🎃', protein: 14, calories: 260, minutes: 3, difficulty: 'easy'),
  Recipe(id: 'hummus_veggies', category: 'snack', nutrients: ['protein', 'magnesium', 'iron'], cuisine: 'middle_eastern', icon: '🥕', protein: 12, calories: 240, minutes: 8, difficulty: 'easy'),
  Recipe(id: 'cottage_cheese_fruit', category: 'snack', nutrients: ['calcium', 'protein'], cuisine: 'global', icon: '🍓', protein: 22, calories: 230, minutes: 4, difficulty: 'easy'),
  Recipe(id: 'dark_choc_almonds', category: 'snack', nutrients: ['magnesium', 'iron'], cuisine: 'global', icon: '🍫', protein: 9, calories: 280, minutes: 2, difficulty: 'easy'),
  Recipe(id: 'boiled_eggs_salt', category: 'snack', nutrients: ['protein', 'vitamin_d'], cuisine: 'global', icon: '🥚', protein: 19, calories: 210, minutes: 10, difficulty: 'easy'),
  Recipe(id: 'kefir_oat_cup', category: 'snack', nutrients: ['calcium', 'protein', 'magnesium'], cuisine: 'turkish', icon: '🥛', protein: 17, calories: 250, minutes: 5, difficulty: 'easy'),
];

/// Recipe copy per language. English is the fallback for anything missing.
const Map<String, Map<String, RecipeCopy>> kRecipeCopy = {
  'en': {
    'protein_oatmeal': RecipeCopy('Power Protein Oatmeal', ['1 cup oats', '1 cup milk', '2 scoops whey protein', '1 banana', '20 g almonds', '1 tbsp honey'], 'Cook the oats in milk over low heat. Stir the protein in off the heat so it stays smooth. Top with sliced banana, almonds and honey.'),
    'menemen': RecipeCopy('Turkish Menemen', ['3 eggs', '2 tomatoes', '1 green pepper', '1 tbsp butter', 'Salt, pepper, chilli flakes'], 'Soften the pepper in butter, add the diced tomatoes and cook until thick. Pour in the beaten eggs and fold gently until just set.'),
    'yogurt_parfait': RecipeCopy('Greek Yogurt Parfait', ['1 cup Greek yogurt', '1/4 cup granola', '1/2 cup berries', '1 tbsp honey'], 'Layer yogurt, granola and berries in a glass. Finish with honey.'),
    'egg_avocado_toast': RecipeCopy('Egg and Avocado Toast', ['2 slices wholegrain bread', '2 eggs', '1/2 avocado', 'Lemon juice', 'Salt, pepper'], 'Toast the bread and mash the avocado onto it with lemon and salt. Top with fried or poached eggs.'),
    'huevos_rancheros': RecipeCopy('Huevos Rancheros', ['2 corn tortillas', '2 eggs', '1/2 cup black beans', 'Tomato salsa', '30 g cheese'], 'Warm the tortillas, spread the beans and top with fried eggs. Spoon salsa over and scatter the cheese.'),
    'tofu_scramble': RecipeCopy('Tofu Scramble', ['200 g firm tofu', '1/2 onion', 'Handful spinach', 'Turmeric, salt, pepper', '1 tbsp olive oil'], 'Crumble the tofu into softened onion. Season with turmeric and cook three minutes, then fold the spinach through.'),
    'cheese_omelette_mushroom': RecipeCopy('Mushroom Cheese Omelette', ['3 eggs', '100 g mushrooms', '40 g cheese', '1 tbsp butter', 'Parsley'], 'Brown the mushrooms in butter. Pour the beaten eggs over, add the cheese, fold once the base is set.'),
    'sardine_toast': RecipeCopy('Sardine Toast', ['1 tin sardines', '2 slices sourdough', '1 tomato', 'Lemon, olive oil', 'Black pepper'], 'Toast the bread, layer tomato slices and sardines on top. Finish with lemon, oil and pepper.'),
    'salmon_quinoa_bowl': RecipeCopy('Salmon Quinoa Bowl', ['150 g salmon fillet', '1 cup cooked quinoa', 'Avocado', 'Cucumber', 'Lemon, olive oil'], 'Pan-sear the salmon skin-side down. Build the bowl on quinoa with avocado and cucumber, dress with lemon and oil.'),
    'lentil_soup': RecipeCopy('Red Lentil Soup', ['1 cup red lentils', '1 onion', '1 carrot', '1 tbsp butter', 'Cumin, salt, lemon'], 'Soften the onion and carrot, add the lentils and water and simmer until soft. Blend, then serve with cumin and lemon.'),
    'chicken_bulgur_pilaf': RecipeCopy('Chicken Bulgur Pilaf', ['200 g chicken breast', '1 cup bulgur', '1 onion', '1 tomato', 'Olive oil, salt'], 'Brown the chicken, set aside and cook the bulgur with onion and tomato. Return the chicken and steam together five minutes.'),
    'tuna_chickpea_salad': RecipeCopy('Tuna Chickpea Salad', ['1 tin tuna', '1 cup chickpeas', 'Red onion', 'Parsley', 'Lemon, olive oil'], 'Fold everything together and dress with lemon and olive oil. Rest it ten minutes before eating.'),
    'paneer_spinach': RecipeCopy('Palak Paneer', ['200 g paneer', '300 g spinach', 'Garlic, ginger', 'Yogurt', 'Garam masala'], 'Blanch and blend the spinach. Cook it with garlic, ginger and spices, then fold the cubed paneer through.'),
    'beef_soba': RecipeCopy('Beef Soba Noodles', ['150 g beef strips', '100 g soba noodles', 'Spring onion', 'Soy sauce, sesame oil', 'Sesame seeds'], 'Boil the noodles. Sear the beef hard and fast, add soy and sesame, then toss the noodles through.'),
    'falafel_bowl': RecipeCopy('Falafel Bowl', ['6 falafel', '1 cup bulgur', 'Tomato, cucumber', 'Tahini sauce', 'Parsley'], 'Build the bowl on bulgur, add the falafel and chopped salad, then spoon tahini over.'),
    'tuna_rice_bowl': RecipeCopy('Tuna Rice Bowl', ['150 g tuna', '1 cup rice', 'Avocado', 'Nori', 'Soy sauce, sesame'], 'Season the warm rice, top with tuna and avocado, and finish with nori and sesame.'),
    'chicken_sweet_potato': RecipeCopy('Chicken and Sweet Potato', ['250 g chicken breast', '1 sweet potato', 'Broccoli', 'Olive oil', 'Paprika, salt'], 'Roast the cubed sweet potato twenty minutes. Add the chicken and broccoli and roast fifteen more.'),
    'baked_mackerel': RecipeCopy('Baked Mackerel', ['1 mackerel', 'Lemon', 'Onion', 'Olive oil', 'Thyme, salt'], 'Stuff the fish with lemon and onion, oil it well and bake at 200°C for 25 minutes.'),
    'beef_stir_fry': RecipeCopy('Beef Stir Fry', ['200 g beef', 'Pepper, broccoli, carrot', 'Garlic, ginger', 'Soy sauce', 'Sesame oil'], 'Sear the beef in a very hot pan and remove it. Stir-fry the vegetables, return the beef and sauce for one minute.'),
    'salmon_teriyaki': RecipeCopy('Salmon Teriyaki', ['180 g salmon', 'Soy sauce, mirin, honey', 'Rice', 'Spring onion', 'Sesame seeds'], 'Sear the salmon, pour the sauce in and reduce until it glazes. Serve on rice with sesame.'),
    'dal_tadka': RecipeCopy('Dal Tadka', ['1 cup yellow lentils', 'Onion, tomato', 'Garlic, cumin', 'Ghee or butter', 'Coriander'], 'Simmer the lentils until soft. Fry cumin and garlic in ghee and pour that over the dal.'),
    'turkey_meatballs': RecipeCopy('Turkey Meatballs', ['300 g turkey mince', '1 egg', 'Breadcrumbs', 'Tomato sauce', 'Oregano, garlic'], 'Shape the mince with egg and breadcrumbs, brown the balls, then simmer in tomato sauce fifteen minutes.'),
    'shrimp_broccoli': RecipeCopy('Garlic Shrimp and Broccoli', ['200 g shrimp', 'Broccoli', 'Garlic', 'Olive oil', 'Lemon, chilli'], 'Blanch the broccoli. Cook the shrimp with garlic two minutes a side, toss together with lemon.'),
    'stuffed_peppers': RecipeCopy('Stuffed Peppers', ['4 peppers', '200 g mince', '1/2 cup rice', 'Onion, tomato', 'Mint, salt'], 'Mix the filling raw, stuff the peppers, and simmer covered for 40 minutes.'),
    'cheese_walnut_plate': RecipeCopy('Cheese and Walnut Plate', ['60 g white cheese', '30 g walnuts', 'Tomato, cucumber', 'Olives', 'Olive oil'], 'Plate everything and finish with olive oil. Best with wholegrain bread.'),
    'milk_banana_smoothie': RecipeCopy('Milk Banana Smoothie', ['1 cup milk', '1 banana', '1 tbsp peanut butter', '1 tbsp oats', 'Cinnamon'], 'Blend everything for thirty seconds and drink it cold.'),
    'pumpkin_seed_mix': RecipeCopy('Pumpkin Seed Mix', ['30 g pumpkin seeds', '20 g sunflower seeds', '20 g raisins', '10 g dark chocolate'], 'Mix and keep a portion in a jar for the day.'),
    'hummus_veggies': RecipeCopy('Hummus and Veggies', ['1 cup hummus', 'Carrot, cucumber, pepper', 'Olive oil', 'Paprika'], 'Spread the hummus, dust with paprika and dip the raw vegetables.'),
    'cottage_cheese_fruit': RecipeCopy('Cottage Cheese and Fruit', ['150 g cottage cheese', 'Strawberries', '1 tbsp honey', '10 g walnuts'], 'Spoon the fruit over the cheese, add honey and walnuts.'),
    'dark_choc_almonds': RecipeCopy('Dark Chocolate and Almonds', ['20 g dark chocolate (70%)', '20 g almonds'], 'Eat together, slowly. Magnesium without the sugar crash.'),
    'boiled_eggs_salt': RecipeCopy('Boiled Eggs', ['3 eggs', 'Salt, pepper', 'Cumin (optional)'], 'Boil eight minutes for a firm yolk, cool under water and season.'),
    'kefir_oat_cup': RecipeCopy('Kefir Oat Cup', ['1 cup kefir', '3 tbsp oats', '1 tsp honey', 'Cinnamon'], 'Stir the oats into the kefir and rest it ten minutes so they soften.'),
  },
  'tr': {
    'protein_oatmeal': RecipeCopy('Proteinli Yulaf', ['1 su bardağı yulaf', '1 su bardağı süt', '2 ölçek whey protein', '1 muz', '20 g badem', '1 yemek kaşığı bal'], 'Yulafı sütle kısık ateşte pişir. Proteini ocaktan aldıktan sonra karıştır ki pürüzsüz kalsın. Üzerine muz, badem ve bal ekle.'),
    'menemen': RecipeCopy('Menemen', ['3 yumurta', '2 domates', '1 sivri biber', '1 yemek kaşığı tereyağı', 'Tuz, karabiber, pul biber'], 'Biberi tereyağında yumuşat, doğranmış domatesi ekleyip suyunu çektir. Çırpılmış yumurtayı dök ve hafifçe karıştırarak pişir.'),
    'yogurt_parfait': RecipeCopy('Yoğurtlu Parfe', ['1 su bardağı süzme yoğurt', '1/4 su bardağı granola', '1/2 su bardağı orman meyvesi', '1 yemek kaşığı bal'], 'Bardağa sırayla yoğurt, granola ve meyveleri diz. Üzerine bal gezdir.'),
    'egg_avocado_toast': RecipeCopy('Avokadolu Yumurtalı Tost', ['2 dilim tam buğday ekmek', '2 yumurta', '1/2 avokado', 'Limon suyu', 'Tuz, karabiber'], 'Ekmeği kızart, avokadoyu limon ve tuzla ezerek sür. Üzerine sahanda veya poşe yumurta koy.'),
    'huevos_rancheros': RecipeCopy('Meksika Usulü Yumurta', ['2 mısır tortilla', '2 yumurta', '1/2 su bardağı siyah fasulye', 'Domates salsa', '30 g peynir'], 'Tortillaları ısıt, fasulyeyi yay ve üzerine sahanda yumurta koy. Salsayı gezdirip peyniri serp.'),
    'tofu_scramble': RecipeCopy('Tofu Kavurma', ['200 g sert tofu', '1/2 soğan', 'Bir avuç ıspanak', 'Zerdeçal, tuz, karabiber', '1 yemek kaşığı zeytinyağı'], 'Tofuyu ufalayıp yumuşamış soğanın üzerine ekle. Zerdeçalla üç dakika kavur, sonra ıspanağı karıştır.'),
    'cheese_omelette_mushroom': RecipeCopy('Mantarlı Peynirli Omlet', ['3 yumurta', '100 g mantar', '40 g peynir', '1 yemek kaşığı tereyağı', 'Maydanoz'], 'Mantarları tereyağında kavur. Çırpılmış yumurtayı dök, peyniri ekle, altı tutunca katla.'),
    'sardine_toast': RecipeCopy('Sardalyalı Ekmek', ['1 kutu sardalya', '2 dilim ekşi maya ekmek', '1 domates', 'Limon, zeytinyağı', 'Karabiber'], 'Ekmeği kızart, domates dilimleri ve sardalyayı diz. Limon, yağ ve karabiberle bitir.'),
    'salmon_quinoa_bowl': RecipeCopy('Somonlu Kinoa Kase', ['150 g somon fileto', '1 su bardağı haşlanmış kinoa', 'Avokado', 'Salatalık', 'Limon, zeytinyağı'], 'Somonu derili tarafından tavada mühürle. Kinoanın üzerine avokado ve salatalıkla diz, limon ve yağla soslar.'),
    'lentil_soup': RecipeCopy('Mercimek Çorbası', ['1 su bardağı kırmızı mercimek', '1 soğan', '1 havuç', '1 yemek kaşığı tereyağı', 'Kimyon, tuz, limon'], 'Soğan ve havucu kavur, mercimek ve suyu ekleyip yumuşayana kadar pişir. Blenderdan geçir, kimyon ve limonla servis et.'),
    'chicken_bulgur_pilaf': RecipeCopy('Tavuklu Bulgur Pilavı', ['200 g tavuk göğsü', '1 su bardağı bulgur', '1 soğan', '1 domates', 'Zeytinyağı, tuz'], 'Tavuğu mühürleyip al, bulguru soğan ve domatesle pişir. Tavuğu geri koyup beş dakika birlikte demle.'),
    'tuna_chickpea_salad': RecipeCopy('Ton Balıklı Nohut Salatası', ['1 kutu ton balığı', '1 su bardağı haşlanmış nohut', 'Kırmızı soğan', 'Maydanoz', 'Limon, zeytinyağı'], 'Hepsini karıştır, limon ve zeytinyağıyla soslar. On dakika dinlendirdikten sonra ye.'),
    'paneer_spinach': RecipeCopy('Ispanaklı Peynir (Palak Paneer)', ['200 g paneer veya lor', '300 g ıspanak', 'Sarımsak, zencefil', 'Yoğurt', 'Garam masala'], 'Ispanağı haşlayıp blenderdan geçir. Sarımsak, zencefil ve baharatla pişir, sonra küp peyniri karıştır.'),
    'beef_soba': RecipeCopy('Etli Soba Erişte', ['150 g dana eti şeritleri', '100 g soba erişte', 'Yeşil soğan', 'Soya sosu, susam yağı', 'Susam'], 'Erişteyi haşla. Eti çok kızgın tavada hızlıca mühürle, soya ve susamı ekle, erişteyi karıştır.'),
    'falafel_bowl': RecipeCopy('Falafel Kase', ['6 falafel', '1 su bardağı bulgur', 'Domates, salatalık', 'Tahin sosu', 'Maydanoz'], 'Kasenin altına bulguru koy, falafel ve doğranmış salatayı ekle, üzerine tahin sosu gezdir.'),
    'tuna_rice_bowl': RecipeCopy('Ton Balıklı Pirinç Kase', ['150 g ton balığı', '1 su bardağı pirinç', 'Avokado', 'Nori', 'Soya sosu, susam'], 'Ilık pirinci baharatla, üzerine ton balığı ve avokado koy, nori ve susamla bitir.'),
    'chicken_sweet_potato': RecipeCopy('Tavuk ve Tatlı Patates', ['250 g tavuk göğsü', '1 tatlı patates', 'Brokoli', 'Zeytinyağı', 'Kırmızı biber, tuz'], 'Küp doğranmış tatlı patatesi 20 dakika fırınla. Tavuk ve brokoliyi ekleyip 15 dakika daha pişir.'),
    'baked_mackerel': RecipeCopy('Fırında Uskumru', ['1 uskumru', 'Limon', 'Soğan', 'Zeytinyağı', 'Kekik, tuz'], 'Balığın içini limon ve soğanla doldur, yağla, 200°C fırında 25 dakika pişir.'),
    'beef_stir_fry': RecipeCopy('Sebzeli Dana Sote', ['200 g dana eti', 'Biber, brokoli, havuç', 'Sarımsak, zencefil', 'Soya sosu', 'Susam yağı'], 'Eti kızgın tavada mühürleyip al. Sebzeleri sote et, eti ve sosu ekleyip bir dakika daha çevir.'),
    'salmon_teriyaki': RecipeCopy('Teriyaki Somon', ['180 g somon', 'Soya sosu, mirin, bal', 'Pirinç', 'Yeşil soğan', 'Susam'], 'Somonu mühürle, sosu dök ve koyulaşana kadar kaynat. Pirinçle, susam serperek servis et.'),
    'dal_tadka': RecipeCopy('Baharatlı Mercimek (Dal)', ['1 su bardağı sarı mercimek', 'Soğan, domates', 'Sarımsak, kimyon', 'Sadeyağ veya tereyağı', 'Kişniş'], 'Mercimeği yumuşayana kadar pişir. Kimyon ve sarımsağı yağda kavurup üzerine dök.'),
    'turkey_meatballs': RecipeCopy('Hindi Köfte', ['300 g hindi kıyma', '1 yumurta', 'Galeta unu', 'Domates sosu', 'Kekik, sarımsak'], 'Kıymayı yumurta ve galeta unuyla yoğur, köfteleri mühürle, domates sosunda 15 dakika pişir.'),
    'shrimp_broccoli': RecipeCopy('Sarımsaklı Karides ve Brokoli', ['200 g karides', 'Brokoli', 'Sarımsak', 'Zeytinyağı', 'Limon, pul biber'], 'Brokoliyi haşla. Karidesi sarımsakla iki dakika çevir, limonla birleştir.'),
    'stuffed_peppers': RecipeCopy('Biber Dolması', ['4 dolmalık biber', '200 g kıyma', '1/2 su bardağı pirinç', 'Soğan, domates', 'Nane, tuz'], 'İç harcı çiğ olarak karıştır, biberleri doldur, kapağı kapalı 40 dakika pişir.'),
    'cheese_walnut_plate': RecipeCopy('Peynir Ceviz Tabağı', ['60 g beyaz peynir', '30 g ceviz', 'Domates, salatalık', 'Zeytin', 'Zeytinyağı'], 'Hepsini tabağa diz, zeytinyağı gezdir. Tam buğday ekmekle çok iyi gider.'),
    'milk_banana_smoothie': RecipeCopy('Muzlu Süt Smoothie', ['1 su bardağı süt', '1 muz', '1 yemek kaşığı fıstık ezmesi', '1 yemek kaşığı yulaf', 'Tarçın'], 'Hepsini otuz saniye blenderdan geçir ve soğuk iç.'),
    'pumpkin_seed_mix': RecipeCopy('Kabak Çekirdekli Karışım', ['30 g kabak çekirdeği', '20 g ay çekirdeği', '20 g kuru üzüm', '10 g bitter çikolata'], 'Karıştır ve günlük porsiyonu kavanozda taşı.'),
    'hummus_veggies': RecipeCopy('Humus ve Sebze', ['1 su bardağı humus', 'Havuç, salatalık, biber', 'Zeytinyağı', 'Kırmızı biber'], 'Humusu tabağa yay, biber serp ve çiğ sebzeleri batırarak ye.'),
    'cottage_cheese_fruit': RecipeCopy('Lor Peyniri ve Meyve', ['150 g lor peyniri', 'Çilek', '1 yemek kaşığı bal', '10 g ceviz'], 'Meyveyi peynirin üzerine koy, bal ve cevizle tamamla.'),
    'dark_choc_almonds': RecipeCopy('Bitter Çikolata ve Badem', ['20 g bitter çikolata (%70)', '20 g badem'], 'Birlikte, yavaşça ye. Şeker çöküşü olmadan magnezyum.'),
    'boiled_eggs_salt': RecipeCopy('Haşlanmış Yumurta', ['3 yumurta', 'Tuz, karabiber', 'Kimyon (isteğe bağlı)'], 'Sekiz dakika haşla, soğuk suya al ve baharatla.'),
    'kefir_oat_cup': RecipeCopy('Kefirli Yulaf', ['1 su bardağı kefir', '3 yemek kaşığı yulaf', '1 tatlı kaşığı bal', 'Tarçın'], 'Yulafı kefire karıştır ve yumuşaması için on dakika beklet.'),
  },
};

RecipeCopy recipeCopy(String languageCode, String id) {
  final table = kRecipeCopy[languageCode] ?? kRecipeCopy['en']!;
  return table[id] ?? kRecipeCopy['en']![id]!;
}
