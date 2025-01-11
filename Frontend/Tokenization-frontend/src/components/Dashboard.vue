<template>
    <div class="flex">
      <!-- Sidebar -->
      <div class="w-64 h-screen bg-gray-900 fixed left-0 top-0">
        <!-- Logo -->
        <div class="flex items-center justify-center h-20 bg-gray-800">
          <span class="text-green-500 text-2xl font-bold">KUSH THERAPY</span>
        </div>
        
        <!-- Navigation Links -->
         
        <nav class="mt-8">
            <router-link to="/" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
            <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
            </svg>
            <span>Overview</span>
          </router-link>

          <router-link to="/home" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
            <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
            </svg>
            <span>Home</span>
          </router-link>
  
          <router-link to="/tokens" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
            <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            <span>My Tokens</span>
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
      <div class="ml-64 flex-1 p-8">
        <div class="container mx-auto">
          <!-- Main Stats Overview -->
          <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
            <div class="bg-gradient-to-r from-green-600 to-green-700 p-6 rounded-lg shadow-lg">
              <h3 class="text-white text-sm font-medium">Total Token Value</h3>
              <p class="text-white text-2xl font-bold">KSH 25,000,000</p>
              <span class="text-green-100 text-sm">+2.5% from last month</span>
            </div>
            
            <div class="bg-gradient-to-r from-blue-600 to-blue-700 p-6 rounded-lg shadow-lg">
              <h3 class="text-white text-sm font-medium">Your Token Balance</h3>
              <p class="text-white text-2xl font-bold">{{ userTokens }} KT</p>
              <span class="text-blue-100 text-sm">{{ tokenValue }} KSH</span>
            </div>
  
            <div class="bg-gradient-to-r from-purple-600 to-purple-700 p-6 rounded-lg shadow-lg">
              <h3 class="text-white text-sm font-medium">Active Projects</h3>
              <p class="text-white text-2xl font-bold">{{ activeProjects }}</p>
              <span class="text-purple-100 text-sm">Across {{ totalAcres }} acres</span>
            </div>
  
            <div class="bg-gradient-to-r from-orange-600 to-orange-700 p-6 rounded-lg shadow-lg">
              <h3 class="text-white text-sm font-medium">Revenue Share</h3>
              <p class="text-white text-2xl font-bold">{{ monthlyRevenue }} KSH</p>
              <span class="text-orange-100 text-sm">Next distribution in {{ daysToDistribution }} days</span>
            </div>
          </div>
  
          <!-- Project Updates & Activities -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
            <div class="bg-gray-800 p-6 rounded-lg shadow-lg">
              <h2 class="text-xl font-bold text-white mb-4">Recent Activities</h2>
              <div class="space-y-4">
                <div v-for="activity in recentActivities" 
                     :key="activity.id" 
                     class="flex items-center p-3 bg-gray-700 rounded">
                  <div class="flex-1">
                    <p class="text-white">{{ activity.description }}</p>
                    <p class="text-sm text-gray-400">{{ activity.timestamp }}</p>
                  </div>
                </div>
              </div>
            </div>
  
            <div class="bg-gray-800 p-6 rounded-lg shadow-lg">
              <h2 class="text-xl font-bold text-white mb-4">Project Milestones</h2>
              <div class="space-y-4">
                <div v-for="milestone in projectMilestones" 
                     :key="milestone.id" 
                     class="p-3 bg-gray-700 rounded">
                  <div class="flex justify-between items-center">
                    <p class="text-white">{{ milestone.title }}</p>
                    <span :class="milestone.status === 'Completed' ? 'text-green-500' : 'text-yellow-500'">
                      {{ milestone.status }}
                    </span>
                  </div>
                  <div class="w-full bg-gray-600 rounded-full h-2 mt-2">
                    <div class="bg-blue-500 rounded-full h-2" 
                         :style="{ width: milestone.progress + '%' }">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
  
          <!-- Quick Actions & Notifications -->
          <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-gray-800 p-6 rounded-lg shadow-lg col-span-2">
              <h2 class="text-xl font-bold text-white mb-4">Quick Actions</h2>
              <div class="grid grid-cols-2 gap-4">
                <router-link to="/tokens">
                <button 
                  @click="BuyTokens" 
                  class="p-4 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                  Buy Tokens
                </button>
              </router-link>
              <router-link to="/property">
                <button @click="viewProperties" 
                        class="p-4 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                  View Properties
                </button>
                </router-link>
                 <router-link to="/revenue">
                <button @click="checkRevenue" 
                        class="p-4 bg-purple-600 text-white rounded-lg hover:bg-purple-700">
                  Check Revenue
                </button>
                </router-link>
                <router-link to="/governance">
                <button 
                  @click="participateGovernance" 
                  class="p-4 bg-orange-600 text-white rounded-lg hover:bg-orange-700">
                  Vote on Proposals
                </button>
              </router-link>

              </div>
            </div>
  
            <div class="bg-gray-800 p-6 rounded-lg shadow-lg">
              <h2 class="text-xl font-bold text-white mb-4">Notifications</h2>
              <div class="space-y-4">
                <div v-for="notification in notifications" 
                     :key="notification.id" 
                     class="p-3 bg-gray-700 rounded">
                  <p class="text-white">{{ notification.message }}</p>
                  <p class="text-sm text-gray-400">{{ notification.time }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue'
  
  const userTokens = ref(1000)
  const tokenValue = ref('250,000')
  const activeProjects = ref(5)
  const totalAcres = ref(33)
  const monthlyRevenue = ref('25,000')
  const daysToDistribution = ref(15)
  
  const recentActivities = ref([
    { id: 1, description: 'New property zone tokenized', timestamp: '2 hours ago' },
    { id: 2, description: 'Revenue distribution completed', timestamp: '1 day ago' },
    { id: 3, description: 'Governance proposal created', timestamp: '2 days ago' }
  ])
  
  const projectMilestones = ref([
    { id: 1, title: 'Zone A Development', status: 'In Progress', progress: 75 },
    { id: 2, title: 'Irrigation System', status: 'Completed', progress: 100 },
    { id: 3, title: 'New Plantation', status: 'In Progress', progress: 30 }
  ])
  
  const notifications = ref([
    { id: 1, message: 'New governance proposal needs your vote', time: '1 hour ago' },
    { id: 2, message: 'Revenue distribution scheduled for next week', time: '3 hours ago' },
    { id: 3, message: 'Property value increased by 5%', time: '1 day ago' }
  ])
  
  onMounted(async () => {
    await loadDashboardData()
  })
  
  async function loadDashboardData() {
    // Implementation for loading dashboard data
  }
  
  function buyTokens() {
    // Implementation for token purchase
  }
  
  function viewProperties() {
    // Implementation for property viewing
  }
  
  function checkRevenue() {
    // Implementation for revenue checking
  }
  
  function participateGovernance() {
    // Implementation for governance participation
  }
  </script>
  
  <style scoped>
  .router-link-active {
    @apply bg-gray-800 text-white;
  }
  </style>
  