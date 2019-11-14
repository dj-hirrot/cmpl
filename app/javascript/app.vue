<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
  import Vue from 'vue'
  import VueRouter from 'vue-router'

  import HomeIndex from 'home/index.vue'

  const router = new VueRouter({
    routes: [
      {
        path: '/',
        component: HomeIndex
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
