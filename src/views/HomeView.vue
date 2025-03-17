<script setup>
import { reactive, ref, watch } from 'vue'
import api from '@/axios'
import router from '@/router'

const state = reactive({
  orderId: undefined,
})

const orderCode = ref(null)

const errors = ref(null)

watch(state, () => {
  errors.value = null
})

async function submit() {
  try {
    const response = await api.post('/register', {
      code: orderCode.value,
    })
    if (response.data?.token) {
      localStorage.setItem('token', response.data.token)
    }

    router.push('/vote')
  } catch (error) {
    errors.value = error.response.data.message
  }
}
</script>

<template>
  <div class="mt-20">
    <div class="flex justify-center items-center">
      <div class="text-center">
        <h1 class="text-5xl font-bold tracking-tight text-gray-900 dark:text-white sm:text-7xl">
          Vote in your favorite burger
        </h1>
        <p class="mt-6 text-lg tracking-tight text-gray-300">
          Complete with your order code to vote
        </p>
        <VForm
          validate-on="submit lazy"
          @submit.prevent="submit"
          class="flex justify-center items-center mt-4"
        >
          <VTextField
            color="rgb(129 140 248)"
            class="text-white flex"
            v-model="orderCode"
            placeholder="Order code"
            variant="outlined"
            max-width="300"
            rounded=""
          ></VTextField>
          <VBtn
            class="mb-6 ml-2 custom-btn"
            type="submit"
            variant="elevated"
            icon="mdi-arrow-right-bold-circle"
            color="rgb(129 140 248)"
            :disabled="!orderCode || orderCode.trim() === ''"
          >
          </VBtn>
        </VForm>
        <div v-if="errors" class="text-red-400 mt-1 flex justify-center">{{ errors }}</div>
      </div>
    </div>
  </div>
</template>
<style scoped>
html,
body {
  overflow: hidden;
}
</style>
