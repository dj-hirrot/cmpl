<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li>{{ e }}</li>
      </ul>
    </div>

    <div>
      <label>USERNAME</label>
      <input v-model="user.username" type="text">
    </div>

    <div>
      <label>EMAIL</label>
      <input v-model="user.email" type="email">
    </div>

    <div>
      <label>PASSWORD</label>
      <input v-model="user.password" type="password">
    </div>

    <div>
      <button type="submit">JOIN!</button>
    </div>
  </form>
</template>

<script>
  export default {
    props: {
      user: {},
      errors: ''
    }
  }
</script>

<style scoped>
</style>
