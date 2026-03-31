import { createContext, useContext, useState, useEffect } from 'react';
import type { ReactNode } from 'react';
import type { UserProfile, HeightRecord, DailyLog, Routine } from '../utils/types';
import { defaultRoutines } from '../utils/defaultRoutines';

interface AppState {
  profile: UserProfile | null;
  heightRecords: HeightRecord[];
  dailyLogs: DailyLog[];
  routines: Routine[];
  todayLog: DailyLog | null;
}

interface AppContextType extends AppState {
  setProfile: (profile: UserProfile) => void;
  addHeightRecord: (record: HeightRecord) => void;
  toggleRoutine: (routineId: string) => void;
  resetDailyRoutines: () => void;
  updateTodayLog: (log: Partial<DailyLog>) => void;
  deleteHeightRecord: (date: string) => void;
}

const AppContext = createContext<AppContextType | undefined>(undefined);

const STORAGE_KEY = 'boyuzatma_app_data';

function getToday(): string {
  return new Date().toISOString().split('T')[0];
}

function loadState(): AppState {
  const saved = localStorage.getItem(STORAGE_KEY);
  if (saved) {
    const parsed = JSON.parse(saved);
    // Her gün rutinleri sıfırla
    const today = getToday();
    const lastDate = parsed.todayLog?.date;
    if (lastDate !== today) {
      parsed.routines = (parsed.routines || defaultRoutines).map((r: Routine) => ({
        ...r,
        completed: false
      }));
      parsed.todayLog = { date: today, completedRoutines: [], sleepHours: 0, waterLiters: 0, notes: '' };
    }
    return parsed;
  }
  return {
    profile: null,
    heightRecords: [],
    dailyLogs: [],
    routines: defaultRoutines,
    todayLog: { date: getToday(), completedRoutines: [], sleepHours: 0, waterLiters: 0, notes: '' }
  };
}

export function AppProvider({ children }: { children: ReactNode }) {
  const [state, setState] = useState<AppState>(loadState);

  useEffect(() => {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
  }, [state]);

  const setProfile = (profile: UserProfile) => {
    setState(prev => ({ ...prev, profile }));
  };

  const addHeightRecord = (record: HeightRecord) => {
    setState(prev => {
      const existing = prev.heightRecords.findIndex(r => r.date === record.date);
      const records = [...prev.heightRecords];
      if (existing >= 0) {
        records[existing] = record;
      } else {
        records.push(record);
      }
      records.sort((a, b) => a.date.localeCompare(b.date));
      return { ...prev, heightRecords: records };
    });
  };

  const deleteHeightRecord = (date: string) => {
    setState(prev => ({
      ...prev,
      heightRecords: prev.heightRecords.filter(r => r.date !== date)
    }));
  };

  const toggleRoutine = (routineId: string) => {
    setState(prev => {
      const routines = prev.routines.map(r =>
        r.id === routineId ? { ...r, completed: !r.completed } : r
      );
      const completedRoutines = routines.filter(r => r.completed).map(r => r.id);
      const todayLog = { ...prev.todayLog!, completedRoutines };
      return { ...prev, routines, todayLog };
    });
  };

  const resetDailyRoutines = () => {
    setState(prev => ({
      ...prev,
      routines: prev.routines.map(r => ({ ...r, completed: false })),
      todayLog: { date: getToday(), completedRoutines: [], sleepHours: 0, waterLiters: 0, notes: '' }
    }));
  };

  const updateTodayLog = (log: Partial<DailyLog>) => {
    setState(prev => ({
      ...prev,
      todayLog: { ...prev.todayLog!, ...log }
    }));
  };

  return (
    <AppContext.Provider value={{
      ...state,
      setProfile,
      addHeightRecord,
      toggleRoutine,
      resetDailyRoutines,
      updateTodayLog,
      deleteHeightRecord
    }}>
      {children}
    </AppContext.Provider>
  );
}

export function useApp() {
  const context = useContext(AppContext);
  if (!context) throw new Error('useApp must be used within AppProvider');
  return context;
}
