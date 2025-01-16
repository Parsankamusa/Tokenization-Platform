<template>
  <!-- Sidebar Toggle Button -->
  <div class="w-64 h-screen bg-gray-900 fixed left-0 top-0">
      <!-- Logo -->
      <div class="flex items-center justify-center h-20 bg-gray-800">
        <span class="text-green-500 text-2xl font-bold">KUSH</span>
      </div>
      
      <!-- Navigation Links -->
      <nav class="mt-8">
        <router-link to="/" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
          <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
          </svg>
          <span>Overview</span>
        </router-link>

        <router-link to="/tokens" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
          <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
          </svg>
          <span>My Tokens</span>
        </router-link>

        <router-link to="/sell" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
          <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
          </svg>
          <span>Sell Tokens</span>
        </router-link>

        <router-link to="/settings" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
          <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"/>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
          </svg>
          <span>Settings</span>
        </router-link>
      </nav>
    </div>
    <!-- Main Content -->
    <div class="container mx-auto p-4">
      <div class="bg-gray-800 rounded-lg p-6">
        <h2 class="text-2xl font-bold text-white mb-6">Kush Therapy Farms Property Map</h2>
        
        <!-- Interactive Property Map -->
        <div class="property-map h-96 bg-gray-700 rounded-lg mb-6">
          <canvas ref="mapCanvas" @click="handleZoneClick"></canvas>
        </div>
  
        <!-- Zone Information -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div v-for="zone in zones" 
               :key="zone.id" 
               class="bg-gray-700 p-4 rounded-lg">
            <h3 class="text-lg font-semibold text-white">{{ zone.name }}</h3>
            <p class="text-gray-300">Area: {{ zone.area }} acres</p>
            <p class="text-gray-300">Tokens Allocated: {{ zone.tokens }}</p>
            <p class="text-gray-300">Status: {{ zone.status }}</p>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <!-- <script setup>
  import { ref, onMounted } from 'vue'
  import { usePropertyMapping } from '@/composables/usePropertyMapping'
  
  const mapCanvas = ref(null)
  const { zones, loadZones, updateZone } = usePropertyMapping()
  
  onMounted(() => {
    initializeMap()
    loadZones()
  })
  
  function initializeMap() {
    const canvas = mapCanvas.value
    const ctx = canvas.getContext('2d')
    // Implementation for drawing the property map
  }
  
  function handleZoneClick(event) {
    // Implementation for handling zone selection
  }
  </script>
   -->