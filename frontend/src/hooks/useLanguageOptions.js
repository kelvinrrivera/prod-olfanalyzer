import i18n from "@/i18n";
import { resources as languages } from "@/locales/resources";

export function useLanguageOptions() {
  const allowedLanguages = ["en", "es", "fr", "it", "pt"];
  const supportedLanguages = Object.keys(languages).filter(lang => allowedLanguages.includes(lang));
  
  const customLanguageNames = {
    en: "English",
    es: "Español",
    fr: "Français",
    it: "Italiano",
    pt: "Português",
  };

  const changeLanguage = (newLang = "en") => {
    if (!Object.keys(languages).includes(newLang)) return false;
    i18n.changeLanguage(newLang);
  };

  return {
    currentLanguage: i18n.language || "en",
    supportedLanguages,
    getLanguageName: (lang = "en") => customLanguageNames[lang] || lang,
    changeLanguage,
  };
}
