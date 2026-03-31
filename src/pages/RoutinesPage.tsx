import { useApp } from '../context/AppContext';
import { CheckCircle2, Circle, Dumbbell, Apple, Moon, PersonStanding } from 'lucide-react';
import Layout from '../components/Layout';

const categoryLabels: Record<string, { label: string; color: string; bg: string; icon: typeof Dumbbell }> = {
  exercise: { label: 'Egzersiz', color: 'text-blue-600', bg: 'bg-blue-50', icon: Dumbbell },
  nutrition: { label: 'Beslenme', color: 'text-green-600', bg: 'bg-green-50', icon: Apple },
  sleep: { label: 'Uyku', color: 'text-violet-600', bg: 'bg-violet-50', icon: Moon },
  posture: { label: 'Duruş', color: 'text-orange-600', bg: 'bg-orange-50', icon: PersonStanding },
};

export default function RoutinesPage() {
  const { routines, toggleRoutine } = useApp();

  const completedCount = routines.filter(r => r.completed).length;
  const totalCount = routines.length;
  const percent = totalCount > 0 ? Math.round((completedCount / totalCount) * 100) : 0;

  const categories = ['exercise', 'nutrition', 'sleep', 'posture'];

  return (
    <Layout title="Günlük Rutinler">
      <div className="space-y-4">
        {/* Progress Header */}
        <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
          <div className="flex items-center justify-between mb-2">
            <span className="text-sm font-medium text-gray-600">Bugünkü İlerleme</span>
            <span className="text-sm font-bold text-emerald-600">{completedCount}/{totalCount}</span>
          </div>
          <div className="w-full bg-gray-100 rounded-full h-2.5">
            <div
              className="bg-gradient-to-r from-emerald-400 to-teal-500 h-2.5 rounded-full transition-all duration-500"
              style={{ width: `${percent}%` }}
            />
          </div>
          {percent === 100 && (
            <p className="text-xs text-emerald-600 font-medium mt-2 text-center">
              🎉 Tüm rutinler tamamlandı! Harika iş!
            </p>
          )}
        </div>

        {/* Routines by Category */}
        {categories.map(cat => {
          const catRoutines = routines.filter(r => r.category === cat);
          if (catRoutines.length === 0) return null;
          const catInfo = categoryLabels[cat];
          const CatIcon = catInfo.icon;

          return (
            <div key={cat}>
              <div className="flex items-center gap-2 mb-2 px-1">
                <div className={`w-6 h-6 ${catInfo.bg} rounded-lg flex items-center justify-center`}>
                  <CatIcon size={14} className={catInfo.color} />
                </div>
                <h3 className={`text-sm font-semibold ${catInfo.color}`}>{catInfo.label}</h3>
              </div>

              <div className="space-y-2">
                {catRoutines.map(routine => (
                  <button
                    key={routine.id}
                    onClick={() => toggleRoutine(routine.id)}
                    className={`w-full text-left bg-white rounded-2xl p-4 shadow-sm border transition-all ${
                      routine.completed
                        ? 'border-emerald-200 bg-emerald-50/50'
                        : 'border-gray-100 hover:border-gray-200'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className="mt-0.5">
                        {routine.completed ? (
                          <CheckCircle2 size={22} className="text-emerald-500" />
                        ) : (
                          <Circle size={22} className="text-gray-300" />
                        )}
                      </div>
                      <div className="flex-1">
                        <div className="flex items-center justify-between">
                          <h4 className={`font-semibold text-sm ${routine.completed ? 'text-emerald-700 line-through' : 'text-gray-800'}`}>
                            {routine.icon} {routine.title}
                          </h4>
                          <span className="text-[10px] text-gray-400 bg-gray-50 px-2 py-0.5 rounded-full">
                            {routine.duration}
                          </span>
                        </div>
                        <p className="text-xs text-gray-400 mt-1 leading-relaxed">
                          {routine.description}
                        </p>
                      </div>
                    </div>
                  </button>
                ))}
              </div>
            </div>
          );
        })}
      </div>
    </Layout>
  );
}
