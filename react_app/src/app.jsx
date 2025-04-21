import React, { useState, useEffect } from 'react';
import './assets/styles.css';
import Navbar from './components/navbar';
import Home from './components/home';
import CV from './components/cv';
import Publications from './components/publications';
import Projects from './components/projects';
import Discovery from './components/discovery';
import GeoLayers from './components/geolayers';
import Blog from './components/blog';
import About from './components/about';

const App = () => {
  const [content, setContent] = useState({});
  const [language, setLanguage] = useState('en');
  const [activeTab, setActiveTab] = useState('home');

  useEffect(() => {
    fetch('/content.json')
      .then(response => response.json())
      .then(data => setContent(data));
  }, []);

  const renderContent = () => {
    switch (activeTab) {
      case 'home':
        return <Home content={content[language]?.home} />;
      case 'cv':
        return <CV content={content[language]?.cv} />;
      case 'publications':
        return <Publications content={content[language]?.publications} />;
      case 'projects':
        return <Projects content={content[language]?.projects} />;
      case 'discovery':
        return <Discovery content={content[language]?.discovery} />;
      case 'geolayers':
        return <GeoLayers content={content[language]?.geolayers} />;
      case 'blog':
          return <Blog content={content[language]?.blog} />;
      case 'about':
        return <About content={content[language]?.about} />;
      default:
        return <Home content={content[language]?.home} />;
    }
  };

  return (
    <div>
      <Navbar
        navItems={content[language]?.navbar}
        setActiveTab={setActiveTab}
        language={language}
        setLanguage={setLanguage}
      />
      <div className="content">
        {renderContent()}
      </div>
    </div>
  );
};

export default App;