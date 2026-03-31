import { useLocation, useNavigate } from 'react-router-dom';
import { Home, User, Target, ListChecks, TrendingUp } from 'lucide-react';

const navItems = [
  { path: '/', label: 'Ana Sayfa', icon: Home },
  { path: '/analysis', label: 'Analiz', icon: Target },
  { path: '/routines', label: 'Rutinler', icon: ListChecks },
  { path: '/progress', label: 'İlerleme', icon: TrendingUp },
  { path: '/profile', label: 'Profil', icon: User },
];

export default function BottomNav() {
  const location = useLocation();
  const navigate = useNavigate();

  return (
    <nav className="fixed bottom-0 left-1/2 -translate-x-1/2 w-full max-w-[480px] bg-white/90 backdrop-blur-lg border-t border-gray-200 z-50">
      <div className="flex justify-around items-center h-16 px-2">
        {navItems.map(item => {
          const isActive = location.pathname === item.path;
          const Icon = item.icon;
          return (
            <button
              key={item.path}
              onClick={() => navigate(item.path)}
              className={`flex flex-col items-center justify-center gap-0.5 px-3 py-1 rounded-xl transition-all ${
                isActive
                  ? 'text-emerald-600 scale-105'
                  : 'text-gray-400 hover:text-gray-600'
              }`}
            >
              <Icon size={20} strokeWidth={isActive ? 2.5 : 1.8} />
              <span className={`text-[10px] ${isActive ? 'font-semibold' : 'font-medium'}`}>
                {item.label}
              </span>
            </button>
          );
        })}
      </div>
    </nav>
  );
}
