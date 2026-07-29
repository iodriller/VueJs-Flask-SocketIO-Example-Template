<template>
  <main class="shell">
    <HelloWorld />
  </main>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'

export default {
  name: 'App',
  components: { HelloWorld },
}
</script>

<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  color: #172033;
  background: #f3f6fb;
  font-family: Inter, ui-sans-serif, system-ui, sans-serif;
}

.shell {
  min-height: 100vh;
  display: grid;
  place-items: center;
  padding: 2rem;
}
</style>
