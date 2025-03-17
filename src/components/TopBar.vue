<script setup>
import { RouterLink } from 'vue-router'
</script>

<template>
  <div>
    <div class="mx-auto px-4 sm:px-6 lg:px-8 max-w-7xl flex items-center justify-between">
      <div class="flex-1 flex items-center justify-start">
        <a aria-current="page" href="/" class="font-bold text-xl text-gray-900 dark:text-white">
          Vote Burger
        </a>
      </div>
      <div class="flex justify-center mt-4">
        <ul
          class="flex items-center justify-center !rounded-r-full !rounded-l-full border border-solid !border-zinc-800 !p-2 !pl-6 !pr-6 text-gray-300 ring-gray-200 dark:ring-gray-800"
        >
          <li>
            <RouterLink
              class="text-sm/6 items-center gap-1 py-2 px-4 font-medium transition-colors relative after:absolute after:-bottom-px after:inset-x-2 after:h-px after:rounded-full after:opacity-0 after:bg-gray-900 dark:after:bg-white after:transition-opacity text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
              to="/vote"
              >Vote</RouterLink
            >
          </li>
          <li>
            <RouterLink
              class="text-sm/6 items-center gap-1 py-2 px-4 font-medium transition-colors relative after:absolute after:-bottom-px after:inset-x-2 after:h-px after:rounded-full after:opacity-0 after:bg-gray-900 dark:after:bg-white after:transition-opacity text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
              to="/ranking"
              >Ranking</RouterLink
            >
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
