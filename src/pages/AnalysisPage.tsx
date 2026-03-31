import { useApp } from '../context/AppContext';
import { calculatePotentialHeight, getRemainingGrowthPercent, calculateBMI, getBMICategory, dailyWaterNeed, dailySleepNeed } from '../utils/calculations';
import { useNavigate } from 'react-router-dom';
import { Ruler, TrendingUp, Droplets, Moon, Scale, ArrowRight } from 'lucide-react';
import Layout from '../components/Layout';

export default function AnalysisPage() {
  const { profile, heightRecords } = useApp();
  const navigate = useNavigate();

  if (!profile) {
    return (
      <Layout title="Boy Analizi">
        <div className="flex flex-col items-center justify-center min-h-[60vh] gap-4 text-center">
          <div className="w-16 h-16 bg-gray-100 rounded-2xl flex items-center justify-center">
            <Ruler size={32} className="text-gray-300" />
          </div>
          <p className="text-gray-400 text-sm">Analiz için önce profilini oluştur</p>
          <button
            onClick={() => navigate('/profile')}
            className="text-emerald-600 font-semibold text-sm flex items-center gap-1"
          >
            Profile Git <ArrowRight size={14} />
          </button>
        </div>
      </Layout>
    );
  }

  const latestHeight = heightRecords.length > 0
    ? heightRecords[heightRecords.length - 1].height
    : profile.currentHeight;

  const potentialHeight = calculatePotentialHeight(profile);
  const growthPercent = getRemainingGrowthPercent(profile.age, profile.gender);
  const remainingPercent = 100 - growthPercent;
  const remainingCm = Math.max(0, potentialHeight - latestHeight);
  const bmi = calculateBMI(profile.weight, latestHeight);
  const bmiCategory = getBMICategory(bmi);
  const waterNeed = dailyWaterNeed(profile.weight);
  const sleepNeed = dailySleepNeed(profile.age);

  const circumference = 2 * Math.PI * 60;
  const dashOffset = circumference - (growthPercent / 100) * circumference;

  return (
    <Layout title="Boy Analizi">
      <div className="space-y-4">
        {/* Potential Height Card */}
        <div className="bg-gradient-to-br from-indigo-500 to-purple-600 rounded-3xl p-5 text-white shadow-lg shadow-purple-200">
          <p className="text-indigo-200 text-xs font-medium mb-1">Genetik Potansiyel Boy</p>
          <div className="flex items-end gap-2 mb-4">
            <span className="text-5xl font-black">{potentialHeight}</span>
            <span className="text-xl font-medium mb-1.5">cm</span>
          </div>
          <div className="flex gap-4 text-sm">
            <div>
              <p className="text-indigo-200 text-xs">Mevcut</p>
              <p className="font-bold">{latestHeight} cm</p>
            </div>
            <div>
              <p className="text-indigo-200 text-xs">Fark</p>
              <p className="font-bold text-amber-300">+{remainingCm} cm</p>
            </div>
            <div>
              <p className="text-indigo-200 text-xs">Baba</p>
              <p className="font-bold">{profile.fatherHeight} cm</p>
            </div>
            <div>
              <p className="text-indigo-200 text-xs">Anne</p>
              <p className="font-bold">{profile.motherHeight} cm</p>
            </div>
          </div>
        </div>

        {/* Growth Progress Ring */}
        <div className="bg-white rounded-2xl p-5 shadow-sm border border-gray-100">
          <h3 className="font-semibold text-gray-700 mb-4">Büyüme Durumu</h3>
          <div className="flex items-center gap-6">
            <div className="relative w-32 h-32">
              <svg className="w-32 h-32 -rotate-90" viewBox="0 0 128 128">
                <circle cx="64" cy="64" r="60" fill="none" stroke="#f3f4f6" strokeWidth="8" />
                <circle
                  cx="64" cy="64" r="60" fill="none"
                  stroke="url(#gradient)"
                  strokeWidth="8"
                  strokeLinecap="round"
                  strokeDasharray={circumference}
                  strokeDashoffset={dashOffset}
                  className="transition-all duration-1000"
                />
                <defs>
                  <linearGradient id="gradient" x1="0%" y1="0%" x2="100%" y2="0%">
                    <stop offset="0%" stopColor="#10b981" />
                    <stop offset="100%" stopColor="#06b6d4" />
                  </linearGradient>
                </defs>
              </svg>
              <div className="absolute inset-0 flex flex-col items-center justify-center">
                <span className="text-2xl font-black text-gray-800">{growthPercent}%</span>
                <span className="text-[10px] text-gray-400">tamamlandı</span>
              </div>
            </div>
            <div className="flex-1 space-y-2">
              <div className="bg-emerald-50 rounded-xl p-3">
                <p className="text-xs text-emerald-600 font-medium">Kalan büyüme potansiyeli</p>
                <p className="text-lg font-bold text-emerald-700">{remainingPercent}%</p>
              </div>
              <div className="bg-amber-50 rounded-xl p-3">
                <p className="text-xs text-amber-600 font-medium">Tahmini kalan boy</p>
                <p className="text-lg font-bold text-amber-700">+{remainingCm} cm</p>
              </div>
            </div>
          </div>
          <p className="text-[11px] text-gray-400 mt-3 leading-relaxed">
            * Hesaplama ebeveyn boylarına ve yaşa göre yapılmıştır. Beslenme, uyku ve egzersiz gibi faktörler sonucu etkiler.
          </p>
        </div>

        {/* Stats Grid */}
        <div className="grid grid-cols-2 gap-3">
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <div className="w-10 h-10 bg-blue-50 rounded-xl flex items-center justify-center mb-2">
              <Scale size={20} className="text-blue-500" />
            </div>
            <p className="text-xs text-gray-400">BMI</p>
            <p className="text-2xl font-bold text-gray-800">{bmi}</p>
            <span className="text-xs font-medium px-2 py-0.5 rounded-full mt-1 inline-block" style={{ backgroundColor: bmiCategory.color + '20', color: bmiCategory.color }}>
              {bmiCategory.label}
            </span>
          </div>

          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <div className="w-10 h-10 bg-emerald-50 rounded-xl flex items-center justify-center mb-2">
              <TrendingUp size={20} className="text-emerald-500" />
            </div>
            <p className="text-xs text-gray-400">Yaş</p>
            <p className="text-2xl font-bold text-gray-800">{profile.age}</p>
            <span className="text-xs text-gray-400">
              {profile.gender === 'male' ? 'Erkek' : 'Kadın'}
            </span>
          </div>

          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <div className="w-10 h-10 bg-cyan-50 rounded-xl flex items-center justify-center mb-2">
              <Droplets size={20} className="text-cyan-500" />
            </div>
            <p className="text-xs text-gray-400">Günlük Su</p>
            <p className="text-2xl font-bold text-gray-800">{waterNeed}L</p>
            <span className="text-xs text-gray-400">ihtiyaç</span>
          </div>

          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <div className="w-10 h-10 bg-violet-50 rounded-xl flex items-center justify-center mb-2">
              <Moon size={20} className="text-violet-500" />
            </div>
            <p className="text-xs text-gray-400">Günlük Uyku</p>
            <p className="text-2xl font-bold text-gray-800">{sleepNeed}sa</p>
            <span className="text-xs text-gray-400">önerilen</span>
          </div>
        </div>

        {/* Tips */}
        <div className="bg-gradient-to-r from-amber-50 to-orange-50 rounded-2xl p-4 border border-amber-100">
          <h3 className="font-semibold text-amber-800 text-sm mb-2">💡 Boy Uzatma İpuçları</h3>
          <ul className="space-y-1.5 text-xs text-amber-700 leading-relaxed">
            <li>• Büyüme hormonu gece 22:00-02:00 arası en yoğun salgılanır</li>
            <li>• Düzenli egzersiz büyüme plakalarını uyarır</li>
            <li>• Protein ve kalsiyum kemik gelişimi için kritiktir</li>
            <li>• Doğru duruş 2-3 cm fark yaratabilir</li>
            <li>• Stres ve yetersiz uyku büyümeyi yavaşlatır</li>
          </ul>
        </div>
      </div>
    </Layout>
  );
}
