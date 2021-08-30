function CreateError(path, message) {
    this.field = path;
    this.message = message;
}

CreateError.prototype.getMessage = function () {
    return this.message;
};

CreateError.prototype.isFieldInvalid = function (field) {
    return this.field === field;
};

CreateError.prototype.getField = function () {
    return this.field;
};

export default CreateError;