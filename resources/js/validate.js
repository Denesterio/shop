const isValid = (params, exeptions = []) => {
    for (const key in params) {
        if (params[key].length === 0 && !exeptions.includes(key)) {
            return false
        }
    }
    return true;
};

const fillErrors = (errors, params, exeptions = []) => {
    for (const key in params) {
        if (params[key].length === 0 && !exeptions.includes(key)) {
            errors[key] = 'Поле не должно быть пустым';
        }
    }
};


export { isValid, fillErrors };