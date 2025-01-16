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
          <span>Overview</span>
        </router-link>

        <router-link to="/tokens" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
          <span>My Tokens</span>
        </router-link>

        <router-link to="/tokens" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
          <span>Sell Tokens</span>
        </router-link>

        <router-link to="/settings" class="flex items-center px-6 py-4 text-gray-300 hover:bg-gray-800 hover:text-white">
          <span>Settings</span>
        </router-link>
      </nav>
    </div>
    
    <div class="ml-64 p-6">
      <!-- Wallet Connection Status -->
      

      <!-- Token Information Panel -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div class="bg-gray-800 p-6 rounded-lg">
          <h2 class="text-2xl font-bold text-white mb-4">Kush Token (KT)</h2>
          <div class="space-y-4">
            <div class="flex justify-between">
              <span class="text-gray-300">Your Balance:</span>
              <span class="text-white">{{ formatBalance(userBalance) }} KT</span>
            </div>
          </div>
        </div>

        <!-- Token Actions -->
        <div class="bg-gray-800 p-6 rounded-lg">
          <div class="mb-6">
        <button 
          @click="initWeb3" 
          class="bg-blue-600 text-white p-2 rounded hover:bg-blue-700"
          v-if="!isConnected"
        >
          Connect MetaMask
        </button>
        <div v-else class="text-green-500">
          Connected: {{ shortenAddress(userAddress) }}
        </div>
      </div>
          <h3 class="text-xl font-bold text-white mb-4">Transfer Tokens</h3>
          <div class="space-y-4">
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
                @click="handleTransferTokens" 
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
import { getTokenBalance, transferTokens } from '../services/web3Service';
import Web3 from 'web3';

const userBalance = ref('0');
const transferAddress = ref('');
const transferAmount = ref('');
const transactions = ref([]);
const isConnected = ref(false);
const userAddress = ref(null);

async function initWeb3() {
  if (typeof window.ethereum !== 'undefined') {
    try {
      const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
      userAddress.value = accounts[0];
      isConnected.value = true;

      const balance = await getTokenBalance(userAddress.value);
      userBalance.value = Web3.utils.fromWei(balance, 'ether');

      window.ethereum.on('accountsChanged', function (accounts) {
        userAddress.value = accounts[0];
        loadTokenData();
      });

      window.ethereum.on('chainChanged', function (chainId) {
        window.location.reload();
      });

    } catch (error) {
      console.error('User denied account access');
    }
  } else {
    console.error('Please install MetaMask!');
  }
}

async function loadTokenData() {
  if (!userAddress.value) return;

  try {
    const balance = await getTokenBalance(userAddress.value);
    userBalance.value = Web3.utils.fromWei(balance, 'ether');
  } catch (error) {
    console.error('Failed to load token data:', error);
  }
}

async function handleTransferTokens() {
  if (!transferAddress.value || !transferAmount.value) return;
  
  try {
    const amountInWei = Web3.utils.toWei(transferAmount.value, 'ether');
    const result = await transferTokens(
      userAddress.value,
      transferAddress.value,
      amountInWei
    );
    
    await recordTransaction({
      hash: result.transactionHash,
      amount: transferAmount.value,
      type: 'transfer'
    });
    
    await loadTokenData();
    transferAddress.value = '';
    transferAmount.value = '';
  } catch (error) {
    console.error('Token transfer failed:', error);
  }
}

function shortenAddress(address) {
  if (!address) return '';
  return `${address.slice(0, 6)}...${address.slice(-4)}`;
}

function formatBalance(balance) {
  return Number(balance).toLocaleString(undefined, {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
  });
}

function formatDate(timestamp) {
  return new Date(timestamp).toLocaleString();
}

async function recordTransaction(txData) {
  try {
    transactions.value.unshift({
      id: Date.now(),
      type: txData.type,
      amount: txData.amount,
      status: 'Completed',
      timestamp: new Date()
    });
  } catch (error) {
    console.error('Failed to record transaction:', error);
  }
}

onMounted(() => {
  if (window.ethereum && window.ethereum.selectedAddress) {
    initWeb3();
  }
});
</script>
