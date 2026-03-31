export interface UserProfile {
  name: string;
  age: number;
  gender: 'male' | 'female';
  currentHeight: number;
  weight: number;
  fatherHeight: number;
  motherHeight: number;
  birthDate: string;
}

export interface HeightRecord {
  date: string;
  height: number;
}

export interface Routine {
  id: string;
  title: string;
  description: string;
  category: 'exercise' | 'nutrition' | 'sleep' | 'posture';
  duration: string;
  icon: string;
  completed: boolean;
}

export interface DailyLog {
  date: string;
  completedRoutines: string[];
  sleepHours: number;
  waterLiters: number;
  notes: string;
}
