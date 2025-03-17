<script setup>
const props = defineProps({
  imageSrc: {
    type: String,
    default:
      'https://cdn.vectorstock.com/i/preview-1x/93/37/tasty-burger-with-meat-patty-and-vegetables-vector-40839337.jpg',
  },
})
</script>
<template>
  <div class="flex flex-row gap-4">
    <img class="rounded-full w-28 h-28" :src="props.imageSrc" />
    <div class="flex flex-col justify-center item">
      <slot name="rigth-text" />
    </div>
  </div>
</template>
