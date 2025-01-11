<template>
    <div class="min-h-screen bg-green-100 py-8">
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
         <!-- Dashboard Header -->
      <div class="max-w-7xl mx-auto px-4">
       
        <div class="text-center mb-12">
          <h1 class="text-4xl font-bold text-gray-900">Ownership & Governance Dashboard</h1>
          <p class="mt-4 text-xl text-gray-600">Participate in shaping the future of our platform</p>
        </div>
  
        <!-- Active Proposals Section -->
        <div class="mb-12">
          <h2 class="text-2xl font-bold mb-6">Active Proposals</h2>
          <div class="grid gap-6">
            <div v-for="proposal in activeProposals" :key="proposal.id" 
                 class="bg-white rounded-xl shadow-lg p-6">
              <div class="flex justify-between items-start">
                <div>
                  <h3 class="text-xl font-semibold">{{ proposal.title }}</h3>
                  <p class="text-gray-600 mt-2">{{ proposal.description }}</p>
                </div>
                <span class="bg-green-100 text-green-800 px-3 py-1 rounded-full text-sm">
                  Active
                </span>
              </div>
              
              <div class="mt-6">
                <div class="mb-4">
                  <div class="flex justify-between mb-2">
                    <span class="text-sm text-gray-600">Voting Progress</span>
                    <span class="text-sm font-medium">{{ proposal.votingProgress }}%</span>
                  </div>
                  <div class="w-full bg-gray-200 rounded-full h-2">
                    <div class="bg-blue-600 rounded-full h-2" 
                         :style="`width: ${proposal.votingProgress}%`"></div>
                  </div>
                </div>
                
                <div class="space-y-3">
                  <button v-for="option in proposal.options" :key="option.id"
                          @click="castVote(proposal.id, option.id)"
                          class="w-full text-left px-4 py-3 border rounded-lg hover:bg-gray-50">
                    {{ option.text }}
                    <span class="float-right text-gray-600">{{ option.votes }} votes</span>
                  </button>
                </div>
                
                <p class="mt-4 text-sm text-gray-600">
                  Ends in {{ proposal.timeRemaining }} days
                </p>
              </div>
            </div>
          </div>
        </div>
  
        <!-- Governance History -->
        <div>
          <h2 class="text-2xl font-bold mb-6">Governance History</h2>
          <div class="bg-white rounded-xl shadow-lg overflow-hidden">
            <table class="min-w-full">
              <thead class="bg-gray-50">
                <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Proposal</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Result</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Votes</th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date Completed</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-200">
                <tr v-for="decision in governanceHistory" :key="decision.id">
                  <td class="px-6 py-4">{{ decision.title }}</td>
                  <td class="px-6 py-4">
                    <span :class="decision.passed ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'"
                          class="px-2 py-1 rounded-full text-sm">
                      {{ decision.passed ? 'Passed' : 'Rejected' }}
                    </span>
                  </td>
                  <td class="px-6 py-4">{{ decision.totalVotes }}</td>
                  <td class="px-6 py-4">{{ decision.completedDate }}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  import { ethers } from 'ethers'
  
  // Sample data - Replace with blockchain data
  const activeProposals = ref([
    {
      id: 1,
      title: 'Implement Property Maintenance Fund',
      description: 'Proposal to allocate 2% of rental income for property maintenance',
      votingProgress: 65,
      timeRemaining: 3,
      options: [
        { id: 1, text: 'Approve', votes: 1234 },
        { id: 2, text: 'Reject', votes: 432 }
      ]
    },
    // Add more proposals
  ])
  
  const governanceHistory = ref([
    {
      id: 1,
      title: 'Rental Income Distribution Schedule',
      passed: true,
      totalVotes: 2500,
      completedDate: '2024-01-15'
    },
    // Add more historical decisions
  ])
  
  // Voting function
  const castVote = async (proposalId, optionId) => {
    try {
      // Connect to wallet
      const provider = new ethers.providers.Web3Provider(window.ethereum)
      await provider.send("eth_requestAccounts", [])
      const signer = provider.getSigner()
  
      // Implement smart contract interaction
      // Example: await governanceContract.connect(signer).vote(proposalId, optionId)
  
      // Update UI
      const proposal = activeProposals.value.find(p => p.id === proposalId)
      const option = proposal.options.find(o => o.id === optionId)
      option.votes++
  
    } catch (error) {
      console.error('Voting failed:', error)
    }
  }
  </script>
  