<script setup>
import { RouterView } from 'vue-router'
import TopBar from './components/TopBar.vue'
</script>

<template>
  <header class="!mb-20">
    <nav>
      <TopBar />
    </nav>
  </header>
  <main>
    <RouterView />
  </main>
</template>
<style>
html,
body {
  min-height: 100vh;
  overflow: auto;
}
</style>
