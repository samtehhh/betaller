import { useState } from 'react';
import { useApp } from '../context/AppContext';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts';
import { Plus, Trash2, TrendingUp, Calendar } from 'lucide-react';
import Layout from '../components/Layout';

export default function ProgressPage() {
  const { heightRecords, addHeightRecord, deleteHeightRecord, profile } = useApp();
  const [showForm, setShowForm] = useState(false);
  const [newDate, setNewDate] = useState(new Date().toISOString().split('T')[0]);
  const [newHeight, setNewHeight] = useState(profile?.currentHeight || 170);

  const handleAdd = () => {
    if (newHeight > 0) {
      addHeightRecord({ date: newDate, height: newHeight });
      setShowForm(false);
    }
  };

  const chartData = heightRecords.map(r => ({
    date: new Date(r.date).toLocaleDateString('tr-TR', { day: '2-digit', month: 'short' }),
    boy: r.height,
  }));

  const totalGrowth = heightRecords.length >= 2
    ? (heightRecords[heightRecords.length - 1].height - heightRecords[0].height).toFixed(1)
    : '0';

  const lastMonthGrowth = (() => {
    if (heightRecords.length < 2) return '0';
    const lastTwo = heightRecords.slice(-2);
    return (lastTwo[1].height - lastTwo[0].height).toFixed(1);
  })();

  return (
    <Layout title="İlerleme Takibi">
      <div className="space-y-4">
        {/* Stats */}
        <div className="grid grid-cols-2 gap-3">
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <div className="flex items-center gap-2 mb-1">
              <TrendingUp size={16} className="text-emerald-500" />
              <span className="text-xs text-gray-400">Toplam Büyüme</span>
            </div>
            <p className="text-2xl font-bold text-emerald-600">+{totalGrowth} cm</p>
          </div>
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <div className="flex items-center gap-2 mb-1">
              <Calendar size={16} className="text-blue-500" />
              <span className="text-xs text-gray-400">Son Ölçüm Farkı</span>
            </div>
            <p className="text-2xl font-bold text-blue-600">+{lastMonthGrowth} cm</p>
          </div>
        </div>

        {/* Chart */}
        {chartData.length > 0 ? (
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <h3 className="font-semibold text-gray-700 mb-4">Boy Grafiği</h3>
            <ResponsiveContainer width="100%" height={220}>
              <LineChart data={chartData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" />
                <XAxis dataKey="date" tick={{ fontSize: 10 }} stroke="#94a3b8" />
                <YAxis domain={['dataMin - 2', 'dataMax + 2']} tick={{ fontSize: 10 }} stroke="#94a3b8" />
                <Tooltip
                  contentStyle={{
                    borderRadius: '12px',
                    border: 'none',
                    boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
                    fontSize: '12px'
                  }}
                  formatter={(value) => [`${value} cm`, 'Boy']}
                />
                <Line
                  type="monotone"
                  dataKey="boy"
                  stroke="#10b981"
                  strokeWidth={3}
                  dot={{ fill: '#10b981', r: 5 }}
                  activeDot={{ r: 7 }}
                />
              </LineChart>
            </ResponsiveContainer>
          </div>
        ) : (
          <div className="bg-white rounded-2xl p-8 shadow-sm border border-gray-100 text-center">
            <div className="w-16 h-16 bg-gray-50 rounded-2xl flex items-center justify-center mx-auto mb-3">
              <TrendingUp size={32} className="text-gray-300" />
            </div>
            <p className="text-gray-400 text-sm">Henüz ölçüm kaydı yok</p>
            <p className="text-gray-300 text-xs mt-1">İlk ölçümünü ekleyerek başla</p>
          </div>
        )}

        {/* Add Record */}
        {showForm ? (
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-emerald-200 space-y-3">
            <h3 className="font-semibold text-gray-700">Yeni Ölçüm Ekle</h3>
            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="text-xs text-gray-400 mb-1 block">Tarih</label>
                <input
                  type="date"
                  value={newDate}
                  onChange={e => setNewDate(e.target.value)}
                  className="w-full bg-gray-50 rounded-xl p-2.5 text-sm outline-none border border-gray-100 focus:border-emerald-300"
                />
              </div>
              <div>
                <label className="text-xs text-gray-400 mb-1 block">Boy (cm)</label>
                <input
                  type="number"
                  value={newHeight}
                  onChange={e => setNewHeight(Number(e.target.value))}
                  step="0.1"
                  className="w-full bg-gray-50 rounded-xl p-2.5 text-sm outline-none border border-gray-100 focus:border-emerald-300"
                />
              </div>
            </div>
            <div className="flex gap-2">
              <button
                onClick={handleAdd}
                className="flex-1 bg-emerald-500 text-white py-2.5 rounded-xl font-semibold text-sm"
              >
                Kaydet
              </button>
              <button
                onClick={() => setShowForm(false)}
                className="px-4 bg-gray-100 text-gray-500 py-2.5 rounded-xl font-semibold text-sm"
              >
                İptal
              </button>
            </div>
          </div>
        ) : (
          <button
            onClick={() => setShowForm(true)}
            className="w-full bg-gradient-to-r from-emerald-500 to-teal-600 text-white py-3.5 rounded-2xl font-semibold flex items-center justify-center gap-2 shadow-lg shadow-emerald-200"
          >
            <Plus size={18} />
            Yeni Ölçüm Ekle
          </button>
        )}

        {/* Records List */}
        {heightRecords.length > 0 && (
          <div className="space-y-2">
            <h3 className="font-semibold text-gray-700 px-1">Ölçüm Geçmişi</h3>
            {[...heightRecords].reverse().map((record, idx) => {
              const prevRecord = heightRecords[heightRecords.length - 1 - idx - 1];
              const diff = prevRecord ? (record.height - prevRecord.height).toFixed(1) : null;
              return (
                <div
                  key={record.date}
                  className="bg-white rounded-xl p-3 shadow-sm border border-gray-100 flex items-center justify-between"
                >
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 bg-emerald-50 rounded-xl flex items-center justify-center">
                      <TrendingUp size={18} className="text-emerald-500" />
                    </div>
                    <div>
                      <p className="font-semibold text-sm text-gray-800">{record.height} cm</p>
                      <p className="text-[11px] text-gray-400">
                        {new Date(record.date).toLocaleDateString('tr-TR', { day: 'numeric', month: 'long', year: 'numeric' })}
                      </p>
                    </div>
                  </div>
                  <div className="flex items-center gap-2">
                    {diff && (
                      <span className={`text-xs font-semibold px-2 py-1 rounded-lg ${
                        Number(diff) > 0 ? 'bg-emerald-50 text-emerald-600' :
                        Number(diff) < 0 ? 'bg-red-50 text-red-500' :
                        'bg-gray-50 text-gray-400'
                      }`}>
                        {Number(diff) > 0 ? '+' : ''}{diff}
                      </span>
                    )}
                    <button
                      onClick={() => deleteHeightRecord(record.date)}
                      className="w-8 h-8 flex items-center justify-center text-gray-300 hover:text-red-400 transition-colors"
                    >
                      <Trash2 size={14} />
                    </button>
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>
    </Layout>
  );
}
