<template>
    <div class="container mx-auto p-4">

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

        <router-link to="/tokens" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
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
    <div class="ml-64 p-6">
      <!-- Token Information Panel -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div class="bg-gray-800 p-6 rounded-lg">
          <h2 class="text-2xl font-bold text-white mb-4">Kush Token (KT)</h2>
          <div class="space-y-4">
            <div class="flex justify-between">
              <span class="text-gray-300">Total Supply:</span>
              <span class="text-white">25,000,000 KT</span>
            </div>
            <div class="flex justify-between">
              <span class="text-gray-300">Your Balance:</span>
              <span class="text-white">{{ formatBalance(userBalance) }} KT</span>
            </div>
            <div class="flex justify-between">
              <span class="text-gray-300">Token Price:</span>
              <span class="text-white">{{ tokenPrice }} KSH</span>
            </div>
          </div>
        </div>

        <!-- Token Actions -->
        <div class="bg-gray-800 p-6 rounded-lg">
          <h3 class="text-xl font-bold text-white mb-4">Token Actions</h3>
          <div class="space-y-4">
            <div class="mb-4">
              <input 
                v-model="purchaseAmount" 
                type="number" 
                class="w-full p-2 rounded bg-gray-700 text-white"
                placeholder="Amount of tokens to buy"
              />
            </div>
            <button 
              @click="buyTokens" 
              class="w-full bg-green-600 text-white p-2 rounded hover:bg-green-700"
              :disabled="!isConnected"
            >
              {{ isConnected ? 'Buy Tokens' : 'Connect Wallet First' }}
            </button>
            
            <div class="mt-4">
              <input 
                v-model="transferAddress" 
                type="text" 
                class="w-full p-2 rounded bg-gray-700 text-white mb-2"
                placeholder="Recipient address"
              />
              <input 
                v-model="transferAmount" 
                type="number" 
                class="w-full p-2 rounded bg-gray-700 text-white mb-2"
                placeholder="Amount to transfer"
              />
              <button 
                @click="transferTokens" 
                class="w-full bg-blue-600 text-white p-2 rounded hover:bg-blue-700"
                :disabled="!isConnected"
              >
                Transfer Tokens
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Transaction History -->
      <div class="mt-6 bg-gray-800 p-6 rounded-lg">
        <h3 class="text-xl font-bold text-white mb-4">Transaction History</h3>
        <div class="overflow-x-auto">
          <table class="min-w-full text-white">
            <thead>
              <tr>
                <th class="px-4 py-2">Type</th>
                <th class="px-4 py-2">Amount</th>
                <th class="px-4 py-2">Status</th>
                <th class="px-4 py-2">Date</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="tx in transactions" :key="tx.id">
                <td class="px-4 py-2">{{ tx.type }}</td>
                <td class="px-4 py-2">{{ tx.amount }} KT</td>
                <td class="px-4 py-2">{{ tx.status }}</td>
                <td class="px-4 py-2">{{ formatDate(tx.timestamp) }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { ethers } from 'ethers';
import axios from 'axios';
// import KushTokenABI from '../../contracts/build/contracts/KushToken.json';

// Contract configuration
const CONTRACT_ADDRESS = import.meta.env.VITE_CONTRACT_ADDRESS;
const BSC_TESTNET_RPC = 'https://data-seed-prebsc-1-s1.binance.org:8545';

// State variables
const userBalance = ref('0');
const tokenPrice = ref('1');
const purchaseAmount = ref('');
const transferAddress = ref('');
const transferAmount = ref('');
const transactions = ref([]);
const isConnected = ref(false);
const contract = ref(null);
const signer = ref(null);
const provider = ref(null);
const userAddress = ref(null);

// Web3 initialization
async function initWeb3() {
  try {
    if (window.ethereum) {
      // Configure provider for BSC Testnet
      provider.value = new ethers.providers.Web3Provider(window.ethereum);
      
      // Request account access
      await window.ethereum.request({ method: 'eth_requestAccounts' });
      
      // Get signer and user address
      signer.value = provider.value.getSigner();
      userAddress.value = await signer.value.getAddress();
      
      // Initialize contract instance
      contract.value = new ethers.Contract(
        CONTRACT_ADDRESS,
        KushTokenABI.abi,
        signer.value
      );

      isConnected.value = true;
      
      // Load initial data
      await Promise.all([
        loadTokenData(),
        loadTransactionHistory()
      ]);

      // Setup event listeners
      setupEventListeners();
    }
  } catch (error) {
    console.error('Web3 initialization failed:', error);
  }
}

// Load token data
async function loadTokenData() {
  if (!contract.value || !userAddress.value) return;

  try {
    const balance = await contract.value.balanceOf(userAddress.value);
    userBalance.value = ethers.utils.formatEther(balance);
    
    const price = await contract.value.tokenPrice();
    tokenPrice.value = ethers.utils.formatEther(price);
  } catch (error) {
    console.error('Failed to load token data:', error);
  }
}

// Buy tokens
async function buyTokens() {
  if (!contract.value || !purchaseAmount.value) return;
  
  try {
    const amount = ethers.utils.parseEther(purchaseAmount.value);
    const tx = await contract.value.buyTokens({ value: amount });
    
    // Wait for transaction confirmation
    const receipt = await tx.wait();
    
    // Record transaction
    await recordTransaction({
      hash: receipt.transactionHash,
      amount: purchaseAmount.value,
      type: 'purchase'
    });
    
    // Refresh data
    await loadTokenData();
    purchaseAmount.value = '';
  } catch (error) {
    console.error('Token purchase failed:', error);
  }
}

// Transfer tokens
async function transferTokens() {
  if (!contract.value || !transferAddress.value || !transferAmount.value) return;
  
  try {
    const amount = ethers.utils.parseEther(transferAmount.value);
    const tx = await contract.value.transfer(transferAddress.value, amount);
    
    // Wait for transaction confirmation
    const receipt = await tx.wait();
    
    // Record transaction
    await recordTransaction({
      hash: receipt.transactionHash,
      amount: transferAmount.value,
      type: 'transfer'
    });
    
    // Refresh data
    await loadTokenData();
    transferAddress.value = '';
    transferAmount.value = '';
  } catch (error) {
    console.error('Token transfer failed:', error);
  }
}

// Record transaction in backend
async function recordTransaction(txData) {
  try {
    await axios.post(`${import.meta.env.VITE_API_URL}/api/tokens/transactions/`, {
      transaction_hash: txData.hash,
      amount: txData.amount,
      type: txData.type
    });
    await loadTransactionHistory();
  } catch (error) {
    console.error('Failed to record transaction:', error);
  }
}

// Load transaction history
async function loadTransactionHistory() {
  try {
    const response = await axios.get(`${import.meta.env.VITE_API_URL}/api/tokens/transactions/`);
    transactions.value = response.data;
  } catch (error) {
    console.error('Failed to load transactions:', error);
  }
}

// Setup contract event listeners
function setupEventListeners() {
  if (!contract.value) return;

  contract.value.on('TokensPurchased', (buyer, amount) => {
    if (buyer === userAddress.value) {
      loadTokenData();
      loadTransactionHistory();
    }
  });

  contract.value.on('Transfer', (from, to, amount) => {
    if (from === userAddress.value || to === userAddress.value) {
      loadTokenData();
      loadTransactionHistory();
    }
  });
}

// Format balance for display
function formatBalance(balance) {
  return Number(balance).toLocaleString(undefined, {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
  });
}

// Format date for display
function formatDate(timestamp) {
  return new Date(timestamp).toLocaleString();
}

// Initialize on component mount
onMounted(() => {
  initWeb3();
});
</script>
