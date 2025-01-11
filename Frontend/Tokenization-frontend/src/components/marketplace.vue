<template>
    <div class="min-h-screen bg-blue-100 py-8">

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
         <!-- Marketplace Header -->
         <div class="max-w-7xl mx-auto px-4">
        <div class="text-center mb-12">
          <h1 class="text-4xl font-bold text-gray-900">Our Listings</h1>
          <p class="mt-4 text-xl text-gray-600">Buy, sell, and trade real estate tokens</p>
        </div>
  
        <!-- Filters -->
        <div class="flex gap-4 mb-8">
          <select v-model="selectedFilter" class="p-2 border rounded-lg">
            <option value="all">All Tokens</option>
            <option value="forSale">For Sale</option>
            <option value="owned">My Tokens</option>
          </select>
          <input 
            type="text" 
            v-model="searchQuery" 
            placeholder="Search properties..." 
            class="p-2 border rounded-lg flex-grow"
          >
        </div>
  
        <!-- Token Listings Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div v-for="token in filteredTokens" :key="token.id" class="bg-white rounded-xl shadow-lg overflow-hidden">
            <img :src="token.image" :alt="token.propertyName" class="w-full h-48 object-cover">
            <div class="p-6">
              <h3 class="text-xl font-semibold">{{ token.propertyName }}</h3>
              <p class="text-gray-600 mt-2">{{ token.location }}</p>
              <div class="mt-4 flex justify-between items-center">
                <div>
                  <p class="text-sm text-gray-500">Price per token</p>
                  <p class="text-lg font-bold">{{ token.price }} ETH</p>
                </div>
                <div>
                  <p class="text-sm text-gray-500">Available tokens</p>
                  <p class="text-lg font-bold">{{ token.availableTokens }}</p>
                </div>
              </div>
              <div class="mt-6 flex gap-4">
                <button @click="buyTokens(token)" class="flex-1 bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700">
                  Buy
                </button>
                <button v-if="token.owned" @click="sellTokens(token)" class="flex-1 bg-green-600 text-white py-2 px-4 rounded-lg hover:bg-green-700">
                  Sell
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
  
      <!-- Trading Modal -->
      <div v-if="showTradingModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
        <div class="bg-white p-8 rounded-xl max-w-md w-full">
          <h2 class="text-2xl font-bold mb-4">{{ tradingMode }} Tokens</h2>
          <div class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-700">Amount of tokens</label>
              <input type="number" v-model="tradeAmount" class="mt-1 block w-full p-2 border rounded-lg">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700">Total Price</label>
              <p class="text-xl font-bold">{{ calculateTotal }} ETH</p>
            </div>
            <div class="flex gap-4">
              <button @click="confirmTrade" class="flex-1 bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700">
                Confirm
              </button>
              <button @click="closeTradingModal" class="flex-1 bg-gray-200 text-gray-800 py-2 px-4 rounded-lg hover:bg-gray-300">
                Cancel
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, computed } from 'vue'
  import { ethers } from 'ethers'
  
  // State management
  const selectedFilter = ref('all')
  const searchQuery = ref('')
  const showTradingModal = ref(false)
  const tradingMode = ref('')
  const tradeAmount = ref(1)
  const selectedToken = ref(null)
  
  // Sample data 
  const tokens = ref([
    {
      id: 1,
      propertyName: 'Luxury Villa',
      location: 'ruiru, FL',
      price: 0.1,
      availableTokens: 100,
      image: '/property1.jpg',
      owned: false
    },
    // Add more token listings
  ])
  
  // Computed properties
  const filteredTokens = computed(() => {
    return tokens.value.filter(token => {
      const matchesSearch = token.propertyName.toLowerCase().includes(searchQuery.value.toLowerCase())
      const matchesFilter = selectedFilter.value === 'all' || 
        (selectedFilter.value === 'owned' && token.owned) ||
        (selectedFilter.value === 'forSale' && !token.owned)
      return matchesSearch && matchesFilter
    })
  })
  
  const calculateTotal = computed(() => {
    if (!selectedToken.value) return 0
    return (selectedToken.value.price * tradeAmount.value).toFixed(4)
  })
  
  // Trading functions
  const buyTokens = (token) => {
    selectedToken.value = token
    tradingMode.value = 'Buy'
    showTradingModal.value = true
  }
  
  const sellTokens = (token) => {
    selectedToken.value = token
    tradingMode.value = 'Sell'
    showTradingModal.value = true
  }
  
  const confirmTrade = async () => {
    try {
      // Connect to wallet
      const provider = new ethers.providers.Web3Provider(window.ethereum)
      await provider.send("eth_requestAccounts", [])
      const signer = provider.getSigner()
  
      // Implement smart contract interaction here
      // Example: await contractInstance.connect(signer).buyTokens(selectedToken.value.id, tradeAmount.value)
  
      closeTradingModal()
    } catch (error) {
      console.error('Transaction failed:', error)
    }
  }
  
  const closeTradingModal = () => {
    showTradingModal.value = false
    tradeAmount.value = 1
    selectedToken.value = null
  }
  </script>
  