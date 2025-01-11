<template>
  <!-- Header Section -->
  <header class="bg-blue-900 text-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex items-center justify-between py-4">
      <div class="flex items-center space-x-4">
        <!-- Logo -->
        <!-- <div class="flex items-center text-xl font-bold">
          <img src="" alt="Logo" class="h-8 w-8 mr-2" />
          Kush
        </div> -->
        <!-- Navigation -->
        <nav class="hidden md:flex space-x-6">
          <!-- <router-link to="/home" class="hover:text-gray-300">Home</router-link> -->
          <router-link to="/marketplace" class="hover:text-gray-300">Marketplace</router-link>
          <router-link to="/governance" class="hover:text-gray-300">Governance</router-link>
          
          <router-link to="/investor" class="hover:text-gray-300">Investor Portal</router-link>
          <a href="#" class="hover:text-gray-300">DeFi</a>
          <router-link to = "/property" class="hover:text-gray-300">Properties</router-link>
          <!-- <router-link to="/tokens" class="hover:text-gray-300">Tokens</router-link> -->
        </nav>
      </div>
      <!-- Right Buttons -->
      <div class="flex items-center space-x-4">
        <router-link to="/about-us" class="hover:text-gray-300">About Us </router-link> 
        <a href="#" class="hover:text-gray-300">Blog</a>
        <router-link to="/contact-us" class="hover:text-gray-300">Contact us </router-link>
        <a href="#" class="flex items-center gap-2 hover:text-gray-300">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
          </svg>
          Profile
        </a>
        <a href="#" class="bg-white text-blue-900 px-4 py-2 text-sm font-medium rounded-md hover:bg-gray-100">
          Log-out
        </a>
      </div>
    </div>
  </header>

  <router-view></router-view>
</template>

<script setup>
import { Icon } from '@iconify/vue'
</script>
