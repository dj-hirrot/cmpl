<template>
  <div>
    <h1>Signup</h1>
    <form-pane :errors="errors" :user="user" @click="createUser"></form-pane>
  </div>
</template>

<script>
  import axios from 'axios'
  import FormPane from './form_pane.vue'

  export default {
    components: {
      FormPane
    },
    data() {
      return {
        user: {
          username: '',
          email: '',
          password: '',
          password_confirmatioin: ''
        },
        errors: ''
      }
    },
    methods: {
      createUser: function() {
        console.log('createUser')
      }
    }
  }
</script>

<style scoped>
</style>
