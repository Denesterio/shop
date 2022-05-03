export default class SessionStorageService {
    constructor(fallbackService = null) {
        this.fallbackService = fallbackService;
    }

    get(key) {
        const result = sessionStorage.getItem(key);
        if (result) {
            return JSON.parse(result);
        }

        if (!result && this.fallbackService) {
            const fallback = new this.fallbackService(key).get();
            this.set(key, fallback);
            return fallback;
        }

        return null;
    }

    asyncGet(key) {
        const result = sessionStorage.getItem(key);
        if (!result && this.fallbackService) {
            return new this.fallbackService(key)
              .get()
              .then((res) => {
                  this.set(key, res);
                  return res;
              });
        }
        
        return new Promise(res => res(JSON.parse(result)));
    }

    set(key, value) {
        sessionStorage.setItem(key, JSON.stringify(value));
    }
}