const transliterateText = {
  objectForTranslite: {
    а: 'a',
    б: 'b',
    в: 'v',
    г: 'g',
    д: 'd',
    е: 'e',
    ё: 'yo',
    ж: 'zh',
    з: 'z',
    и: 'i',
    й: 'i',
    к: 'k',
    л: 'l',
    м: 'm',
    н: 'n',
    о: 'o',
    п: 'p',
    р: 'r',
    с: 's',
    т: 't',
    у: 'u',
    ф: 'f',
    х: 'h',
    ц: 'ts',
    ч: 'ch',
    ш: 'sh',
    щ: 'sch',
    ъ: "",
    ы: 'i',
    ь: "",
    э: 'e',
    ю: 'yu',
    я: 'ya',
  },

  fromCyrillic: function (text) {
    const splitted = text.split(' ');
    const result = splitted.map((word) => {
      return word.toLowerCase()
        .split('')
        .map((char) => this.objectForTranslite[char] || char)
        .join('');
    });
    return result.join('_');
  },
};

export default transliterateText;