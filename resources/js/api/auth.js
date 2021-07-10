const authLogin = (params) => {
    return axios.post("/api/auth/login", {
        params,
    })

};

export { authLogin };

// axios.get("sanctum/csrf-cookie")
//     .then((response) => { })
