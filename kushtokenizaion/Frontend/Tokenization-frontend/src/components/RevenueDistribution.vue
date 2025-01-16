<template>
    <div class="container mx-auto p-4">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <!-- Revenue Overview -->
        <div class="bg-gray-800 p-6 rounded-lg">
          <h2 class="text-2xl font-bold text-white mb-4">Revenue Distribution</h2>
          <div class="space-y-4">
            <div class="flex justify-between">
              <span class="text-gray-300">Total Revenue:</span>
              <span class="text-white">{{ totalRevenue }} KSH</span>
            </div>
            <div class="flex justify-between">
              <span class="text-gray-300">Your Share:</span>
              <span class="text-white">{{ userShare }} KSH</span>
            </div>
            <div class="flex justify-between">
              <span class="text-gray-300">Next Distribution:</span>
              <span class="text-white">{{ nextDistribution }}</span>
            </div>
          </div>
        </div>
  
        <!-- Distribution History -->
        <div class="bg-gray-800 p-6 rounded-lg">
          <h3 class="text-xl font-bold text-white mb-4">Distribution History</h3>
          <div class="space-y-4">
            <div v-for="distribution in distributionHistory" 
                 :key="distribution.id"
                 class="bg-gray-700 p-4 rounded-lg">
              <div class="flex justify-between">
                <span class="text-gray-300">{{ distribution.date }}</span>
                <span class="text-white">{{ distribution.amount }} KSH</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
//   import { ref, onMounted } from 'vue'
// //   import { useRevenue } from '../composables/useRevenue.js'

  
//   const { totalRevenue, userShare, nextDistribution, distributionHistory } = useRevenue()
  
//   onMounted(async () => {
//     await loadRevenueData()
//   })
  
//   async function loadRevenueData() {
//     // Implementation for loading revenue distribution data
//   }
//   </script>
  