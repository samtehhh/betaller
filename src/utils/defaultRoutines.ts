import type { Routine } from './types';

export const defaultRoutines: Routine[] = [
  {
    id: 'stretch-morning',
    title: 'Sabah Germe Egzersizleri',
    description: 'Omurga ve bacak kaslarını esnetmek için 15 dakikalık germe rutini. Cobra, kedi-deve ve hamstring germeleri.',
    category: 'exercise',
    duration: '15 dk',
    icon: '🧘',
    completed: false
  },
  {
    id: 'hanging',
    title: 'Bar Asılma',
    description: 'Omurgayı dekomprese etmek için bara asılma. Günde 2-3 set, her set 30-60 saniye.',
    category: 'exercise',
    duration: '5 dk',
    icon: '💪',
    completed: false
  },
  {
    id: 'swimming',
    title: 'Yüzme / Basketbol',
    description: 'Vücudu uzatan sporlar: yüzme, basketbol veya voleybol. Haftada en az 3 gün.',
    category: 'exercise',
    duration: '45 dk',
    icon: '🏊',
    completed: false
  },
  {
    id: 'posture-check',
    title: 'Duruş Kontrolü',
    description: 'Duvar testi yaparak duruşunu kontrol et. Sırt, omuzlar ve baş duvarla temas etmeli.',
    category: 'posture',
    duration: '5 dk',
    icon: '🧍',
    completed: false
  },
  {
    id: 'nutrition-protein',
    title: 'Protein Alımı',
    description: 'Günlük protein hedefini karşıla: yumurta, süt, tavuk, balık, baklagiller. Kilo başına 1.2-1.5g protein.',
    category: 'nutrition',
    duration: 'Gün boyu',
    icon: '🥩',
    completed: false
  },
  {
    id: 'nutrition-calcium',
    title: 'Kalsiyum & D Vitamini',
    description: 'Kemik gelişimi için süt, peynir, yoğurt tüket. D vitamini için güneşe çık veya takviye al.',
    category: 'nutrition',
    duration: 'Gün boyu',
    icon: '🥛',
    completed: false
  },
  {
    id: 'sleep',
    title: 'Kaliteli Uyku',
    description: 'Büyüme hormonu uykuda salgılanır. 22:00-23:00 arası yatağa gir, 8-10 saat uyu.',
    category: 'sleep',
    duration: '8-10 saat',
    icon: '😴',
    completed: false
  },
  {
    id: 'stretch-evening',
    title: 'Akşam Esneme Rutini',
    description: 'Yatmadan önce hafif esneme hareketleri. Pilates veya yoga pozları ile omurgayı uzat.',
    category: 'exercise',
    duration: '10 dk',
    icon: '🌙',
    completed: false
  },
  {
    id: 'water',
    title: 'Su İçme Hedefi',
    description: 'Vücut ağırlığının kg başına 33ml su iç. Metabolizma ve büyüme için hidrasyon şart.',
    category: 'nutrition',
    duration: 'Gün boyu',
    icon: '💧',
    completed: false
  },
  {
    id: 'no-junkfood',
    title: 'Zararlı Gıdalardan Kaçın',
    description: 'Fast food, gazlı içecek ve aşırı şekerden uzak dur. Bunlar büyümeyi olumsuz etkiler.',
    category: 'nutrition',
    duration: 'Gün boyu',
    icon: '🚫',
    completed: false
  }
];
