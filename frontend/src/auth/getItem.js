export const getAccessToken = () => {
  return window.localStorage.getItem('access-token');
};

export const getClient = () => {
  return window.localStorage.getItem('client');
};

export const getName = () => {
  return window.localStorage.getItem('name');
};

export const getUid = () => {
  return window.localStorage.getItem('uid');
};
