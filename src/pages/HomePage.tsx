import { useNavigate } from 'react-router-dom';
import { useApp } from '../context/AppContext';
import { calculatePotentialHeight, getRemainingGrowthPercent, calculateBMI, getBMICategory } from '../utils/calculations';
import { Target, TrendingUp, ListChecks, User, Ruler, Activity } from 'lucide-react';
import Layout from '../components/Layout';

export default function HomePage() {
  const { profile, routines, heightRecords } = useApp();
  const navigate = useNavigate();

  const completedToday = routines.filter(r => r.completed).length;
  const totalRoutines = routines.length;
  const completionPercent = totalRoutines > 0 ? Math.round((completedToday / totalRoutines) * 100) : 0;

  const latestHeight = heightRecords.length > 0
    ? heightRecords[heightRecords.length - 1].height
    : profile?.currentHeight || 0;

  const potentialHeight = profile
    ? calculatePotentialHeight(profile)
    : 0;

  const remainingCm = profile
    ? Math.max(0, potentialHeight - latestHeight)
    : 0;

  const growthPercent = profile
    ? getRemainingGrowthPercent(profile.age, profile.gender)
    : 0;

  const bmi = profile ? calculateBMI(profile.weight, latestHeight) : 0;
  const bmiCategory = getBMICategory(bmi);

  if (!profile) {
    return (
      <Layout>
        <div className="flex flex-col items-center justify-center min-h-[70vh] gap-6 text-center">
          <div className="w-24 h-24 bg-gradient-to-br from-emerald-400 to-teal-500 rounded-3xl flex items-center justify-center shadow-lg">
            <Ruler size={48} className="text-white" />
          </div>
          <div>
            <h1 className="text-2xl font-bold text-gray-800 mb-2">Boy Uzatma App</h1>
            <p className="text-gray-500 text-sm leading-relaxed max-w-[280px]">
              Boyunu analiz et, potansiyelini keşfet ve günlük rutinlerle boyunu maksimuma çıkar.
            </p>
          </div>
          <button
            onClick={() => navigate('/profile')}
            className="bg-gradient-to-r from-emerald-500 to-teal-600 text-white px-8 py-3 rounded-2xl font-semibold shadow-lg shadow-emerald-200 hover:shadow-xl transition-all"
          >
            Hemen Başla
          </button>
        </div>
      </Layout>
    );
  }

  return (
    <Layout>
      <div className="space-y-4">
        {/* Greeting */}
        <div className="bg-gradient-to-r from-emerald-500 to-teal-600 rounded-3xl p-5 text-white shadow-lg shadow-emerald-200">
          <p className="text-emerald-100 text-sm">Merhaba,</p>
          <h2 className="text-xl font-bold mb-3">{profile.name} 👋</h2>
          <div className="flex items-center gap-6">
            <div>
              <p className="text-emerald-100 text-xs">Mevcut Boy</p>
              <p className="text-2xl font-bold">{latestHeight} cm</p>
            </div>
            <div className="w-px h-10 bg-emerald-300/50" />
            <div>
              <p className="text-emerald-100 text-xs">Hedef Boy</p>
              <p className="text-2xl font-bold">{potentialHeight} cm</p>
            </div>
            <div className="w-px h-10 bg-emerald-300/50" />
            <div>
              <p className="text-emerald-100 text-xs">Kalan</p>
              <p className="text-2xl font-bold">+{remainingCm} cm</p>
            </div>
          </div>
        </div>

        {/* Today's Progress */}
        <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
          <div className="flex items-center justify-between mb-3">
            <h3 className="font-semibold text-gray-700">Bugünkü İlerleme</h3>
            <span className="text-sm text-emerald-600 font-bold">{completionPercent}%</span>
          </div>
          <div className="w-full bg-gray-100 rounded-full h-3">
            <div
              className="bg-gradient-to-r from-emerald-400 to-teal-500 h-3 rounded-full transition-all duration-500"
              style={{ width: `${completionPercent}%` }}
            />
          </div>
          <p className="text-xs text-gray-400 mt-2">
            {completedToday}/{totalRoutines} rutin tamamlandı
          </p>
        </div>

        {/* Quick Stats */}
        <div className="grid grid-cols-2 gap-3">
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <div className="flex items-center gap-2 mb-2">
              <div className="w-8 h-8 bg-blue-50 rounded-xl flex items-center justify-center">
                <Activity size={16} className="text-blue-500" />
              </div>
              <span className="text-xs text-gray-400">BMI</span>
            </div>
            <p className="text-xl font-bold text-gray-800">{bmi}</p>
            <p className="text-xs mt-0.5" style={{ color: bmiCategory.color }}>{bmiCategory.label}</p>
          </div>

          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <div className="flex items-center gap-2 mb-2">
              <div className="w-8 h-8 bg-amber-50 rounded-xl flex items-center justify-center">
                <TrendingUp size={16} className="text-amber-500" />
              </div>
              <span className="text-xs text-gray-400">Büyüme</span>
            </div>
            <p className="text-xl font-bold text-gray-800">{growthPercent}%</p>
            <p className="text-xs text-gray-400 mt-0.5">tamamlandı</p>
          </div>
        </div>

        {/* Quick Actions */}
        <div className="space-y-2">
          <h3 className="font-semibold text-gray-700">Hızlı Erişim</h3>
          <div className="grid grid-cols-2 gap-3">
            {[
              { icon: Target, label: 'Boy Analizi', path: '/analysis', color: 'from-purple-500 to-indigo-600', shadow: 'shadow-purple-200' },
              { icon: ListChecks, label: 'Rutinlerim', path: '/routines', color: 'from-emerald-500 to-green-600', shadow: 'shadow-emerald-200' },
              { icon: TrendingUp, label: 'İlerleme', path: '/progress', color: 'from-blue-500 to-cyan-600', shadow: 'shadow-blue-200' },
              { icon: User, label: 'Profilim', path: '/profile', color: 'from-orange-400 to-rose-500', shadow: 'shadow-orange-200' },
            ].map(item => (
              <button
                key={item.path}
                onClick={() => navigate(item.path)}
                className={`bg-gradient-to-br ${item.color} text-white rounded-2xl p-4 flex items-center gap-3 shadow-md ${item.shadow} hover:scale-[1.02] transition-transform`}
              >
                <item.icon size={20} />
                <span className="font-semibold text-sm">{item.label}</span>
              </button>
            ))}
          </div>
        </div>
      </div>
    </Layout>
  );
}
