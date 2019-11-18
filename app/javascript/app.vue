<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
  import Vue from 'vue'
  import VueRouter from 'vue-router'

  // Home
  import HomeIndex from 'packs/home/index.vue'
  // Users
  import UserJoin from 'packs/users/registrations/new.vue'
  import UserLogin from 'packs/users/sessions/new.vue'

  const router = new VueRouter({
    mode: 'history',
    hash: false,
    routes: [
      {
        path: '/',
        component: HomeIndex,
        name: "HomeIndex"
      },
      {
        path: '/join',
        component: UserJoin
      },
      {
        path: '/login',
        component: UserLogin
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
