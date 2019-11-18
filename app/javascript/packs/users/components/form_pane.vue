<template>
  <div>
    <button @click.prevent="$emit('click')">function</button>
  </div>
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
