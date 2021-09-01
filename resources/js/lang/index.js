import Vue from 'vue';
import VueI18n from 'vue-i18n';
Vue.use(VueI18n);
import ru from './ru.js';

const messages = {
  ru
};

const pluralizationRules = {
  ru: function(choice, choicesLength) {
    // this === VueI18n экземпляра, так что свойство locale также существует здесь

    if (choice === 0) {
      return 0;
    }

    const teen = choice > 10 && choice < 20;
    const endsWithOne = choice % 10 === 1;

    if (choicesLength < 4) {
      return !teen && endsWithOne ? 1 : 2;
    }
    if (!teen && endsWithOne) {
      return 1;
    }
    if (!teen && choice % 10 >= 2 && choice % 10 <= 4) {
      return 2;
    }
    if (choice === 'pl') {
      return 4;
    }

    return choicesLength <= 4 ? 2 : 3;
  }
};

const i18n = new VueI18n({
  locale: 'ru', // установка локализации по умолчанию
  messages, // установка сообщений локализаций
  pluralizationRules
});

export default i18n;
