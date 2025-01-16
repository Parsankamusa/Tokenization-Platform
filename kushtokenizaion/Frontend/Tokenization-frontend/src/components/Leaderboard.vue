<template>
    <div class="p-4">
      <h1 class="text-lg font-bold">Top Donors</h1>
      <ul class="mt-4">
        <li
          v-for="(donor, index) in donors"
          :key="index"
          class="flex justify-between p-2 border-b"
        >
          <span>{{ donor.name }}</span>
          <span>{{ donor.tokens }} KT</span>
        </li>
      </ul>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        donors: [
          { name: 'Alice', tokens: 1000 },
          { name: 'Bob', tokens: 800 },
          { name: 'Charlie', tokens: 600 },
        ],
      };
    },
  };
  </script>
  