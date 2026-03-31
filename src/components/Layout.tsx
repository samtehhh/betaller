import type { ReactNode } from 'react';
import BottomNav from './BottomNav';

interface LayoutProps {
  children: ReactNode;
  title?: string;
}

export default function Layout({ children, title }: LayoutProps) {
  return (
    <div className="flex flex-col min-h-screen pb-20">
      {title && (
        <header className="sticky top-0 z-40 bg-white/80 backdrop-blur-lg border-b border-gray-100 px-5 py-4">
          <h1 className="text-lg font-bold text-gray-800">{title}</h1>
        </header>
      )}
      <main className="flex-1 px-5 py-4">
        {children}
      </main>
      <BottomNav />
    </div>
  );
}
