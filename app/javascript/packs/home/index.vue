<template>
  <div id="app">
    <h1>{{ text }}</h1>
  </div>
</template>

<script>
  import Vue from 'vue';
  import axios from 'axios';
  import CMPLAxios from '../../plugins/cmpl_axios';

  // CSRF対策
  Vue.use(CMPLAxios, { axios: axios })

  export default {
    data: function() {
      return {
        text: 'Welcome to cmpl!'
      }
    },
    mounted() {
      axios
        .get(`home/index`)
        .then(response => {
          console.log(response);
        });
    }
  }
</script>

<style scoped>
</style>
