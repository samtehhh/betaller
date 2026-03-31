import type { UserProfile } from './types';

// Khamis-Roche yöntemi ile tahmini yetişkin boyu
export function calculatePotentialHeight(profile: UserProfile): number {
  const { gender, fatherHeight, motherHeight } = profile;

  if (gender === 'male') {
    // Erkek: (Anne boyu + Baba boyu + 13) / 2
    return Math.round(((motherHeight + fatherHeight + 13) / 2) * 10) / 10;
  } else {
    // Kadın: (Anne boyu + Baba boyu - 13) / 2
    return Math.round(((motherHeight + fatherHeight - 13) / 2) * 10) / 10;
  }
}

// Kalan büyüme potansiyeli yüzdesi (yaşa göre tahmini)
export function getRemainingGrowthPercent(age: number, gender: string): number {
  const growthData: Record<string, Record<number, number>> = {
    male: {
      10: 78, 11: 81, 12: 84, 13: 88, 14: 92, 15: 95,
      16: 97, 17: 98.5, 18: 99.5, 19: 100, 20: 100
    },
    female: {
      10: 84, 11: 88, 12: 92, 13: 95, 14: 97, 15: 98.5,
      16: 99.5, 17: 100, 18: 100, 19: 100, 20: 100
    }
  };

  const data = growthData[gender] || growthData.male;
  if (age < 10) return 70;
  if (age >= 20) return 100;
  return data[Math.floor(age)] || 100;
}

// BMI hesaplama
export function calculateBMI(weight: number, heightCm: number): number {
  const heightM = heightCm / 100;
  return Math.round((weight / (heightM * heightM)) * 10) / 10;
}

// BMI kategorisi
export function getBMICategory(bmi: number): { label: string; color: string } {
  if (bmi < 18.5) return { label: 'Zayıf', color: '#3b82f6' };
  if (bmi < 25) return { label: 'Normal', color: '#10b981' };
  if (bmi < 30) return { label: 'Fazla Kilolu', color: '#f59e0b' };
  return { label: 'Obez', color: '#ef4444' };
}

// Yaş hesaplama
export function calculateAge(birthDate: string): number {
  const birth = new Date(birthDate);
  const today = new Date();
  let age = today.getFullYear() - birth.getFullYear();
  const monthDiff = today.getMonth() - birth.getMonth();
  if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
    age--;
  }
  return age;
}

// Günlük su ihtiyacı (litre)
export function dailyWaterNeed(weight: number): number {
  return Math.round((weight * 0.033) * 10) / 10;
}

// Günlük uyku ihtiyacı (saat)
export function dailySleepNeed(age: number): number {
  if (age <= 13) return 10;
  if (age <= 17) return 9;
  return 8;
}
