const CMPLAxiosPlugin = {}

export default CMPLAxiosPlugin.install = function(Vue, { axios }) {
  var access_token = '';
  var client = '';
  var uid = '';
  const cookies = document.cookie;
  const cookiesArray = cookies.split(';');
  const csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  for (var c of cookiesArray) {
    var cv = c.split('=');
    var key = cv[0].replace(' ', '');
    var value = cv[1];
    if (key === 'access-token') {
      access_token = value;
    } else if (key === 'client') {
      client = value;
    } else if (key === 'uid') {
      uid = value;
    }
  }

  axios.defaults.headers.common = {
    "X-Requested-With": "XMLHttpRequest",
    "X-CSRF-Token": csrf_token,
    "access-token": access_token,
    "client": client,
    "uid": uid
  }

  Vue.axios = axios

  Object.defineProperties(Vue.prototype, {
    axios: {
      get () {
        return axios
      }
    }
  })
}
