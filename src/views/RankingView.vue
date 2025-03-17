<script setup>
import api from '@/axios'
import AvatarItem from '@/components/AvatarItem.vue'
import { onMounted, onUnmounted, ref } from 'vue'
import echo from '@/echo'

const errors = ref(null)
const burgers = ref([])

async function list() {
  try {
    const { data } = await api.get('/list')
    burgers.value = data
  } catch (error) {}
}

function updateList(burgerVote) {
  const index = burgers.value.findIndex((burger) => burger.id === burgerVote.id)
  burgers.value[index].votes = burgerVote.votes
  burgers.value.sort((a, b) => b.votes - a.votes)
}
onMounted(async () => {
  await list()
  echo.channel('burger-vote').listen('BurgerVoted', (e) => {
    updateList(e.burgerVote)
  })
})
onUnmounted(() => {
  echo.channel('burger-vote').stopListening('BurgerVoted')
})
</script>
<template>
  <div>
    <div class="mt-10">
      <div class="flex items-center sm:justify-center sm:pl-0 pl-4">
        <div class="text-center">
          <h1 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white sm:text-4xl">
            Best Burgers
          </h1>
        </div>
      </div>
    </div>

    <VContainer v-if="burgers.length > 0" class="flex md:justify-center">
      <div class="flex flex-col mt-10 mb-4">
        <transition-group name="list" tag="div" class="flex flex-col mt-10 mb-4">
          <AvatarItem
            v-for="(burger, index) in burgers"
            :key="burger.id"
            :image-src="burger.image"
            class="px-4 py-4"
          >
            <template #rigth-text>
              <span class="text-xl font-semibold text-indigo-400"> #{{ index + 1 }}</span>
              <span class="text-xl font-semibold text-white">{{ burger.name }}</span>
              <span class="text-white"
                >votes: <span class="text-indigo-300">{{ burger.votes }}</span></span
              >
            </template>
          </AvatarItem>
        </transition-group>
      </div>
    </VContainer>
    <div v-else class="text-red-400 mt-10 flex justify-center">Nenhuma lista encontrada</div>
  </div>
</template>
<style scoped>
.list-move,
.list-enter-active,
.list-leave-active {
  transition: all 0.5s ease;
}

.list-enter-from,
.list-leave-to {
  opacity: 0;
  transform: translateX(30px);
}

.list-leave-active {
  position: absolute;
}
</style>
