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
    <!-- Hero Section -->
    <section class="bg-white py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col lg:flex-row items-center">
        <div class="lg:w-1/2 text-center lg:text-left">
          <h1 class="text-4xl font-extrabold tracking-tight text-gray-900 sm:text-5xl">
            Fractional and frictionless real estate investing
          </h1>
          <p class="mt-4 text-xl font-semibold text-blue-600">
            OWNERSHIP REINVENTED
          </p>
          <p class="mt-4 text-lg text-gray-600">
            Kush Therapy Farms is a revolutionary concept that combines holistic healing, modern farming, cultural preservation, and economic empowerment to create a sustainable model of development.
          </p>
          <button
            class="mt-8 px-6 py-3 text-blue-600 border border-blue-600 rounded-md text-sm font-medium hover:bg-blue-600 hover:text-white transition"
          >
            GET STARTED
          </button>
        </div>
  
        <div class="mt-12 lg:mt-0 lg:w-1/2 relative flex justify-center">
          <div class="relative">
            <div class="grid grid-cols-3 gap-2 w-56 mx-auto">
              <div v-for="i in 9" :key="i" class="w-16 h-16 bg-gray-200 border rounded"></div>
            </div>
            <div class="absolute -top-8 left-12">
              <div class="w-16 h-16 bg-orange-400 rounded shadow-lg"></div>
            </div>
          </div>
        </div>
      </div>
    </section>
  
    <!-- DeFi Integrated Section -->
    <section class="bg-gray-50 py-16">
      <div class="max-w-5xl mx-auto text-center px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-bold text-gray-900">
          DeFi Integrated
        </h2>
        <p class="mt-2 text-xl font-semibold text-blue-600">
          DISCOVER THE POWER OF THE REALT RMM PLATFORM
        </p>
        <p class="mt-4 text-lg text-gray-600">
          Leverage your assets like never before with the power of Decentralized Finance on the blockchain.
          <a href="#" class="text-blue-600 underline">
            The RealT RMM collateralization platform
          </a>
          lets you supercharge your tokenized real estate portfolio.
        </p>
        <div class="mt-8 flex flex-col sm:flex-row justify-center gap-4">
          <button class="px-6 py-3 bg-blue-100 text-blue-600 border border-blue-600 rounded-md text-sm font-medium hover:bg-blue-600 hover:text-white transition">
            HOW IT WORKS
          </button>
          <button class="px-6 py-3 bg-blue-100 text-blue-600 border border-blue-600 rounded-md text-sm font-medium hover:bg-blue-600 hover:text-white transition">
            WHY IT WORKS
          </button>
          <button class="px-6 py-3 bg-blue-100 text-blue-600 border border-blue-600 rounded-md text-sm font-medium hover:bg-blue-600 hover:text-white transition">
            HOW TO USE IT
          </button>
        </div>
      </div>
    </section>
  
    <!-- Year-Over-Year Asset Performance Section -->
    <section class="bg-blue-50 py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-center text-2xl font-bold text-gray-800">
          OUR PORTFOLIO
        </h2>
        <p class="text-center text-gray-600 mt-2">
          Based on most recent property revaluations
        </p>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mt-6">
          <div v-for="(property, index) in properties" :key="index" class="bg-white rounded-lg shadow-md p-4">
            <p class="text-blue-600 text-xl font-bold">+{{ property.totalPerformance }}%</p>
            <div class="mt-4">
              <p class="text-gray-600 text-sm">Expected Income</p>
              <p class="font-bold text-gray-800">{{ property.expectedIncome }}%</p>
            </div>
            <div class="mt-2">
              <p class="text-gray-600 text-sm">Capital ROI</p>
              <p class="font-bold text-gray-800">+{{ property.capitalROI }}%</p>
            </div>
            <img :src="property.imageUrl" :alt="`Image of ${property.address}`" class="mt-4 w-full rounded-lg" />
            <p class="mt-2 text-blue-800 text-center font-medium">{{ property.address }}</p>
          </div>
        </div>
      </div>
    </section>
  
    <!-- Real Estate Software Solutions Section -->
    <section class="max-w-7xl mx-auto px-4 py-16">
      <h1 class="text-4xl font-bold text-navy-900 text-center mb-16">
        EXPLORE OUR REAL ESTATE SOFTWARE SOLUTIONS
      </h1>
  
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 items-center">
        <div class="space-y-12">
          <div class="flex items-center gap-4">
            <Icon icon="clarity:building-line" class="text-orange-500 w-12 h-12" />
            <div>
              <h3 class="font-semibold text-lg">Real Estate Management Software</h3>
            </div>
          </div>
  
          <div class="flex items-center gap-4">
            <Icon icon="clarity:list-line" class="text-orange-500 w-12 h-12" />
            <div>
              <h3 class="font-semibold text-lg">Multiple Listing Service (MLS)</h3>
            </div>
          </div>
  
          <div class="flex items-center gap-4">
            <Icon icon="clarity:dollar-circle-line" class="text-orange-500 w-12 h-12" />
            <div>
              <h3 class="font-semibold text-lg">Real Estate Transaction Standard (RETS) Integration</h3>
            </div>
          </div>
        </div>
  
        <div class="flex justify-center">
          <img :src="realEstateImage" alt="Responsive Real Estate Platform" class="w-full max-w-2xl" />
        </div>
  
        <div class="space-y-12">
          <div class="flex items-center gap-4">
            <Icon icon="clarity:home-line" class="text-orange-500 w-12 h-12" />
            <div>
              <h3 class="font-semibold text-lg">Property Management</h3>
            </div>
          </div>
  
          <div class="flex items-center gap-4">
            <Icon icon="clarity:data-cluster-line" class="text-orange-500 w-12 h-12" />
            <div>
              <h3 class="font-semibold text-lg">IDX (Internet Data Exchange) Integration</h3>
            </div>
          </div>
  
          <div class="flex items-center gap-4">
            <Icon icon="clarity:analytics-line" class="text-orange-500 w-12 h-12" />
            <div>
              <h3 class="font-semibold text-lg">Real Estate Analytics & Digitization Solutions</h3>
            </div>
          </div>
        </div>
      </div>
    </section>
  
    <section class="bg-gray-800 text-white py-16 flex flex-col items-center text-center">
      <h2 class="text-4xl font-bold mb-4">What Are You Waiting For?</h2>
      <p class="text-lg max-w-lg mb-6">
        Ready to dive into the real estate tokenization world and start investing today? Let's bring your vision to life! Explore our services and get in touch.
      </p>
      <button class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-6 rounded">
        Contact us
      </button>
    </section>
  </template>
  
  <script setup>
  import { Icon } from '@iconify/vue'
  import realEstateImage from '/src/assets/RealEstate Software Solutions.webp'
  import { properties } from '../data/properties.js'
  </script>
  