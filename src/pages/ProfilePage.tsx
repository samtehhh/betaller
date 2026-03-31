import { useState, useEffect } from 'react';
import { useApp } from '../context/AppContext';
import type { UserProfile } from '../utils/types';
import { calculateAge } from '../utils/calculations';
import { Save, User } from 'lucide-react';
import Layout from '../components/Layout';

export default function ProfilePage() {
  const { profile, setProfile } = useApp();

  const [form, setForm] = useState<UserProfile>({
    name: '',
    age: 15,
    gender: 'male',
    currentHeight: 170,
    weight: 60,
    fatherHeight: 175,
    motherHeight: 162,
    birthDate: '2010-01-01',
  });

  const [saved, setSaved] = useState(false);

  useEffect(() => {
    if (profile) {
      setForm(profile);
    }
  }, [profile]);

  const handleChange = (field: keyof UserProfile, value: string | number) => {
    setForm(prev => {
      const updated = { ...prev, [field]: value };
      if (field === 'birthDate') {
        updated.age = calculateAge(value as string);
      }
      return updated;
    });
  };

  const handleSave = () => {
    setProfile(form);
    setSaved(true);
    setTimeout(() => setSaved(false), 2000);
  };

  return (
    <Layout title="Profilim">
      <div className="space-y-5">
        {/* Avatar */}
        <div className="flex flex-col items-center gap-2 py-4">
          <div className="w-20 h-20 bg-gradient-to-br from-emerald-400 to-teal-500 rounded-full flex items-center justify-center shadow-lg">
            <User size={36} className="text-white" />
          </div>
          <p className="text-sm text-gray-400">Bilgilerini gir, analiz sonuçlarını gör</p>
        </div>

        {/* Form */}
        <div className="space-y-4">
          {/* İsim */}
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <label className="text-xs text-gray-400 font-medium mb-1 block">İsim</label>
            <input
              type="text"
              value={form.name}
              onChange={e => handleChange('name', e.target.value)}
              placeholder="Adını gir..."
              className="w-full text-gray-800 font-semibold text-lg outline-none bg-transparent"
            />
          </div>

          {/* Cinsiyet */}
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <label className="text-xs text-gray-400 font-medium mb-2 block">Cinsiyet</label>
            <div className="flex gap-3">
              {(['male', 'female'] as const).map(g => (
                <button
                  key={g}
                  onClick={() => handleChange('gender', g)}
                  className={`flex-1 py-2.5 rounded-xl font-semibold text-sm transition-all ${
                    form.gender === g
                      ? 'bg-emerald-500 text-white shadow-md'
                      : 'bg-gray-50 text-gray-500'
                  }`}
                >
                  {g === 'male' ? '♂ Erkek' : '♀ Kadın'}
                </button>
              ))}
            </div>
          </div>

          {/* Doğum Tarihi */}
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <label className="text-xs text-gray-400 font-medium mb-1 block">Doğum Tarihi</label>
            <input
              type="date"
              value={form.birthDate}
              onChange={e => handleChange('birthDate', e.target.value)}
              className="w-full text-gray-800 font-semibold outline-none bg-transparent"
            />
            <p className="text-xs text-gray-400 mt-1">Yaş: {form.age}</p>
          </div>

          {/* Boy & Kilo */}
          <div className="grid grid-cols-2 gap-3">
            <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
              <label className="text-xs text-gray-400 font-medium mb-1 block">Boy (cm)</label>
              <input
                type="number"
                value={form.currentHeight}
                onChange={e => handleChange('currentHeight', Number(e.target.value))}
                className="w-full text-gray-800 font-bold text-2xl outline-none bg-transparent"
              />
            </div>
            <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
              <label className="text-xs text-gray-400 font-medium mb-1 block">Kilo (kg)</label>
              <input
                type="number"
                value={form.weight}
                onChange={e => handleChange('weight', Number(e.target.value))}
                className="w-full text-gray-800 font-bold text-2xl outline-none bg-transparent"
              />
            </div>
          </div>

          {/* Anne & Baba Boyu */}
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100 space-y-3">
            <label className="text-xs text-gray-400 font-medium block">Ebeveyn Boyları (Genetik Analiz İçin)</label>
            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="text-[10px] text-gray-400 block mb-0.5">Baba Boyu (cm)</label>
                <input
                  type="number"
                  value={form.fatherHeight}
                  onChange={e => handleChange('fatherHeight', Number(e.target.value))}
                  className="w-full text-gray-800 font-bold text-xl outline-none bg-gray-50 rounded-xl p-2"
                />
              </div>
              <div>
                <label className="text-[10px] text-gray-400 block mb-0.5">Anne Boyu (cm)</label>
                <input
                  type="number"
                  value={form.motherHeight}
                  onChange={e => handleChange('motherHeight', Number(e.target.value))}
                  className="w-full text-gray-800 font-bold text-xl outline-none bg-gray-50 rounded-xl p-2"
                />
              </div>
            </div>
          </div>

          {/* Save Button */}
          <button
            onClick={handleSave}
            className={`w-full py-3.5 rounded-2xl font-semibold text-white flex items-center justify-center gap-2 shadow-lg transition-all ${
              saved
                ? 'bg-emerald-500 shadow-emerald-200'
                : 'bg-gradient-to-r from-emerald-500 to-teal-600 shadow-emerald-200 hover:shadow-xl'
            }`}
          >
            <Save size={18} />
            {saved ? 'Kaydedildi!' : 'Profili Kaydet'}
          </button>
        </div>
      </div>
    </Layout>
  );
}
