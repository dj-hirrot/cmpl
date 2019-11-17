<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
  import Vue from 'vue'
  import VueRouter from 'vue-router'

  // Home
  import HomeIndex from 'home/index.vue'
  // Users
  import UserNew from 'users/new.vue'

  const router = new VueRouter({
    mode: 'history',
    hash: false,
    routes: [
      {
        path: '/',
        component: HomeIndex
      },
      {
        path: 'join',
        component: UserNew
      },
      {
        path: '*',
        redirection: '/'
      }
    ]
  })

  Vue.use(VueRouter)

  export default {
    router
  }
</script>

<style scoped>
</style>
