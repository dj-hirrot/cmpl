<template>
  <div>
    <h1>Signup</h1>
    <form-pane :errors="errors" :user="user" @submit="createUser"></form-pane>
  </div>
</template>

<script>
  import Vue from 'vue'
  import axios from 'axios'
  import CMPLAxios from '../../../plugins/cmpl_axios'
  import FormPane from '../components/form_pane.vue'

  // CSRF対策
  Vue.use(CMPLAxios, { axios: axios })

  export default {
    components: {
      FormPane
    },
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
      createUser: function() {
        axios
          .post(`api/v1/users`, this.user)
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
