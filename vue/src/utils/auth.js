import Cookies from 'js-cookie';

const TokenKey = 'Admin-Token';

export function getToken() {
  return Cookies.get(TokenKey);
}

export function setToken(token) {
  window.sessionStorage.setItem('access_token', token);
  return Cookies.set(TokenKey, token);
}

export function removeToken() {
    window.sessionStorage.removeItem('access_token');
  return Cookies.remove(TokenKey);
}
