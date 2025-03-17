<script setup>
import { onMounted, ref } from 'vue'
import api from '@/axios'
import CheckCardImage from '@/components/CheckCardImage.vue'
import router from '@/router'

const errors = ref(null)

const burgers = ref([])

const bugerVoted = ref(undefined)

async function list() {
  try {
    const { data } = await api.get('/list')
    burgers.value = data
  } catch (error) {}
}

async function vote() {
  try {
    await api.post('/vote', {
      burger_vote_id: bugerVoted.value,
    })
    localStorage.removeItem('token')
    await router.push('/ranking')
  } catch (error) {}
}

onMounted(() => {
  list()
})
</script>
<template>
  <div>
    <div class="mt-20">
      <div class="flex items-center justify-center">
        <div class="text-center">
          <h1 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white sm:text-4xl">
            What's your favorite hamburger?
          </h1>
          <p class="mt-6 mb-4 text-lg tracking-tight text-gray-300">Choose one to vote</p>
          <div v-if="errors" class="text-red-400 mt-2">{{ errors }}</div>
        </div>
      </div>
    </div>

    <VContainer class="mb-12">
      <div class="grid grid-cols-2 gap-2 sm:grid-cols-4 items-center justify-center">
        <CheckCardImage
          v-for="burger in burgers"
          :key="burger.id"
          v-model="bugerVoted"
          :value="burger.id"
          :name="burger.name"
          :image-src="burger.image"
        />
      </div>
      <div
        v-if="bugerVoted"
        class="py-3 fixed bottom-0 left-1/2 transform -translate-x-1/2 md:w-2/4 w-3/4 flex justify-center bg-[#121212] shadow-xl rounded-t-xl"
      >
        <VBtn color="#818cf8" class="w-1/2" @click="vote">
          <span class="font-bold">Vote</span>
        </VBtn>
      </div>
    </VContainer>
  </div>
</template>
