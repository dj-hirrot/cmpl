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
    if (cv[0] === 'access-token') {
      access_token = cv[1];
    } else if (cv[0] === 'client') {
      client = cv[1]
    } else if (cv[0] === 'uid') {
      uid = cv[1]
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
