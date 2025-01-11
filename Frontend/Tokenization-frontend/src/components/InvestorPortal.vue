<template>
    <div class="min-h-screen bg-blue-100 dark:bg-gray-900">
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
      <div 
        :class="isSidebarOpen ? 'ml-64' : 'ml-0'"
        class="transition-margin duration-300 ease-in-out"
      >
        <div class="max-w-7xl mx-auto px-4 py-8">
          <!-- Dashboard Header -->
          <div class="mb-8">
            <h1 class="text-3xl font-bold text-gray-900 dark:text-white">Investor Dashboard</h1>
            <p class="mt-2 text-gray-600 dark:text-gray-400">Welcome back, {{ userAddress }}</p>
          </div>
  
          <!-- Investment Overview Cards -->
          <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6">
              <div class="flex items-center justify-between">
                <h3 class="text-lg font-medium text-gray-900 dark:text-white">Total Investment Value</h3>
                <Icon icon="heroicons:chart-bar" class="text-blue-500 w-6 h-6" />
              </div>
              <p class="mt-2 text-3xl font-bold dark:text-white">{{ totalValue }} ETH</p>
              <p class="text-sm text-green-600 mt-2">+{{ valueChange }}% from last month</p>
            </div>
  
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6">
              <div class="flex items-center justify-between">
                <h3 class="text-lg font-medium text-gray-900 dark:text-white">Owned Tokens</h3>
                <Icon icon="heroicons:cube-transparent" class="text-blue-500 w-6 h-6" />
              </div>
              <p class="mt-2 text-3xl font-bold dark:text-white">{{ totalTokens }}</p>
              <p class="text-sm text-gray-600 dark:text-gray-400 mt-2">Across {{ propertyCount }} properties</p>
            </div>
  
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6">
              <div class="flex items-center justify-between">
                <h3 class="text-lg font-medium text-gray-900 dark:text-white">Total Revenue Earned</h3>
                <Icon icon="heroicons:currency-dollar" class="text-blue-500 w-6 h-6" />
              </div>
              <p class="mt-2 text-3xl font-bold dark:text-white">{{ totalRevenue }} ETH</p>
              <p class="text-sm text-gray-600 dark:text-gray-400 mt-2">Lifetime earnings</p>
            </div>
          </div>
  
          <!-- Property Holdings -->
          <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg mb-8">
            <div class="p-6 border-b dark:border-gray-700">
              <h2 class="text-xl font-bold text-gray-900 dark:text-white">Your Property Holdings</h2>
            </div>
            <div class="overflow-x-auto">
              <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                <thead class="bg-gray-50 dark:bg-gray-900">
                  <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Property</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Tokens Owned</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Value</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Monthly Revenue</th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                  <tr v-for="holding in propertyHoldings" :key="holding.id">
                    <td class="px-6 py-4">
                      <div class="flex items-center">
                        <img :src="holding.image" class="w-10 h-10 rounded-lg mr-3" />
                        <div>
                          <div class="font-medium text-gray-900 dark:text-white">{{ holding.propertyName }}</div>
                          <div class="text-sm text-gray-500 dark:text-gray-400">{{ holding.location }}</div>
                        </div>
                      </div>
                    </td>
                    <td class="px-6 py-4 text-gray-900 dark:text-white">{{ holding.tokensOwned }}</td>
                    <td class="px-6 py-4 text-gray-900 dark:text-white">{{ holding.value }} ETH</td>
                    <td class="px-6 py-4 text-gray-900 dark:text-white">{{ holding.monthlyRevenue }} ETH</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
  
          <!-- Revenue Distribution -->
          <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg">
            <div class="p-6 border-b dark:border-gray-700">
              <h2 class="text-xl font-bold text-gray-900 dark:text-white">Revenue Distribution History</h2>
            </div>
            <div class="overflow-x-auto">
              <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                <thead class="bg-gray-50 dark:bg-gray-900">
                  <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Date</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Property</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Amount</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Status</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Transaction</th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                  <tr v-for="payout in revenueHistory" :key="payout.id">
                    <td class="px-6 py-4 text-gray-900 dark:text-white">{{ payout.date }}</td>
                    <td class="px-6 py-4 text-gray-900 dark:text-white">{{ payout.propertyName }}</td>
                    <td class="px-6 py-4 text-gray-900 dark:text-white">{{ payout.amount }} ETH</td>
                    <td class="px-6 py-4">
                      <span :class="payout.status === 'Completed' ? 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300' : 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-300'"
                            class="px-2 py-1 rounded-full text-sm">
                        {{ payout.status }}
                      </span>
                    </td>
                    <td class="px-6 py-4">
                      <a :href="`https://etherscan.io/tx/${payout.txHash}`" 
                         target="_blank"
                         class="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300">
                        View
                      </a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, computed, onMounted, watch } from 'vue'
  import { Icon } from '@iconify/vue'
  import { ethers } from 'ethers'
  
  // Sidebar State
  const isSidebarOpen = ref(false)
  const isDarkMode = ref(false)
  
  // User Data
  const userName = ref('John Doe')
  const userEmail = ref('john@example.com')
  const userAddress = ref('0x1234...5678')
  const totalValue = ref(0)
  const valueChange = ref(0)
  const totalTokens = ref(0)
  const propertyCount = ref(0)
  const totalRevenue = ref(0)
  
  // Computed Properties
  const userInitials = computed(() => {
    return userName.value
      .split(' ')
      .map(name => name[0])
      .join('')
      .toUpperCase()
  })
  
  // Sample Property Holdings
  const propertyHoldings = ref([
    {
      id: 1,
      propertyName: 'Luxury Villa RUIRU',
      location: 'RUIRU, FL',
      tokensOwned: 100,
      value: 5.5,
      monthlyRevenue: 0.05,
      image: '/property1.jpg'
    },
    // Add more holdings
  ])
  
  // Sample Revenue History
  const revenueHistory = ref([
    {
      id: 1,
      date: '2024-02-01',
      propertyName: 'Luxury Villa RUIRU',
      amount: 0.05,
      status: 'Completed',
      txHash: '0x123...'
    },
    // Add more history entries
  ])
  
  // Theme Toggle Function
  const toggleTheme = () => {
    isDarkMode.value = !isDarkMode.value
    document.documentElement.classList.toggle('dark')
  }
  
  // Initialize dashboard data
  const initializeDashboard = async () => {
    try {
      const provider = new ethers.providers.Web3Provider(window.ethereum)
      await provider.send("eth_requestAccounts", [])
      const signer = provider.getSigner()
      userAddress.value = await signer.getAddress()
  
      // Implement contract calls to fetch real data
      // Example: const holdings = await contractInstance.getInvestorHoldings(userAddress.value)
    } catch (error) {
      console.error('Failed to initialize dashboard:', error)
    }
  }
  
  onMounted(() => {
    initializeDashboard()
    
    // Initialize theme from local storage
    const savedTheme = localStorage.getItem('theme')
    if (savedTheme === 'dark' || (!savedTheme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      isDarkMode.value = true
      document.documentElement.classList.add('dark')
    }
  })
  
  // Save theme preference
  watch(isDarkMode, (newValue) => {
    localStorage.setItem('theme', newValue ? 'dark' : 'light')
  })
  const profileImage = ref(null)

const handleImageUpload = (event) => {
  const file = event.target.files[0]
  if (file) {
    const reader = new FileReader()
    reader.onload = (e) => {
      profileImage.value = e.target.result
      // Here you can add logic to upload to backend/IPFS
    }
    reader.readAsDataURL(file)
  }
}

  </script>
  