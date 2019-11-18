<template>
  <form @submit.prevent="submitUserForm">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li>{{ e }}</li>
      </ul>
    </div>

    <div>
      <label>USERNAME or EMAIL</label>
      <input v-model="user.username" type="text">
    </div>

    <div>
      <label>PASSWORD</label>
      <input v-model="user.password" type="password">
    </div>

    <div>
      <button type="submit">LOGIN!</button>
    </div>
  </form>
</template>

<script>
  import Vue from 'vue'
  import axios from 'axios'
  import CMPLAxios from '../../../plugins/cmpl_axios'

  // CSRF対策
  Vue.use(CMPLAxios, { axios: axios })

  export default {
    data() {
      return {
        user: {
          username: '',
          email: '',
          password: ''
        },
        errors: ''
      }
    },
    methods: {
      submitUserForm: function() {
        axios
          .post(`api/v1/users/sign_in`, this.user)
          .then(response => {
            let e = response.data;
            this.$router.push({ name: "HomeIndex", notice: "JOINED" });
          })
          .catch(error => {
            console.log(error);
            if (error.response.data && error.response.data.errors) {
              this.errors = error.response.data.errors;
            }
          })
      }
    }
  }
</script>

<style scoped>
</style>
