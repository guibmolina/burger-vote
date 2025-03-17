<script setup>
const props = defineProps({
  modelValue: {
    String,
    default: '',
  },
  value: {
    type: Number,
    required: true,
  },
  imageSrc: {
    type: String,
    default:
      'https://cdn.vectorstock.com/i/preview-1x/93/37/tasty-burger-with-meat-patty-and-vegetables-vector-40839337.jpg',
  },
  name: {
    type: String,
    required: true,
  },
})

defineEmits(['update:modelValue'])
</script>
<template>
  <label class="block cursor-pointer relative">
    <input
      type="radio"
      name="card-selection"
      class="hidden peer"
      :value="value"
      :checked="modelValue === value"
      @change="$emit('update:modelValue', value)"
    />

    <div class="relative">
      <div class="absolute left-1 top-1">
        <v-icon v-if="modelValue === value" icon="mdi-check-decagram" color="#818cf8"></v-icon>
      </div>

      <div
        class="bg-white rounded-md flex flex-col justify-center px-4 pt-6 pb-3 gap-4"
        :class="modelValue === value ? ' border-4 border-[#818cf8] ' : ''"
      >
        <img class="rounded" :src="imageSrc" width="250" height="250" />
        <div class="text-center font-semibold text-black">{{ name }}</div>
      </div>
    </div>
  </label>
</template>
