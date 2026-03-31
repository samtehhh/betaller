import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { AppProvider } from './context/AppContext';
import HomePage from './pages/HomePage';
import ProfilePage from './pages/ProfilePage';
import AnalysisPage from './pages/AnalysisPage';
import RoutinesPage from './pages/RoutinesPage';
import ProgressPage from './pages/ProgressPage';

export default function App() {
  return (
    <AppProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/profile" element={<ProfilePage />} />
          <Route path="/analysis" element={<AnalysisPage />} />
          <Route path="/routines" element={<RoutinesPage />} />
          <Route path="/progress" element={<ProgressPage />} />
        </Routes>
      </BrowserRouter>
    </AppProvider>
  );
}
