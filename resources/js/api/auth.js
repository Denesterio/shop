import axios from "axios";

const authLogin = params => {
  return axios.post("/api/auth/login", params);
};

const authLogout = () => {
  return axios.post("/api/auth/logout");
};

const authRegister = params => {
  return axios.post("/api/auth/register", params);
};

export { authLogin, authRegister, authLogout };
