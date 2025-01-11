<template>
    <div class="min-h-screen bg-gray-50">
      <!-- Hero Section -->
      <div class="relative bg-gradient-to-r from-blue-600 to-blue-800 h-96">
        <div class="absolute inset-0 bg-black opacity-50"></div>
        <div class="relative container mx-auto px-4 h-full flex items-center justify-center">
          <div class="text-center text-white">
            <h1 class="text-4xl md:text-6xl font-bold mb-4">About Kush Therapy Farms</h1>
            <p class="text-xl md:text-2xl max-w-3xl mx-auto">
              A revolutionary concept combining holistic healing, modern farming, cultural preservation, and economic empowerment.
            </p>
          </div>
        </div>
      </div>
  
      <!-- Vision Section -->
      <div class="container mx-auto px-4 py-16">
        <div class="max-w-3xl mx-auto text-center">
          <h2 class="text-3xl font-bold text-gray-800 mb-6">Our Vision</h2>
          <p class="text-lg text-gray-600">
            To equip communities with the knowledge and resources to take charge of their health, wellness, and economic independence, fostering a network of empowered individuals across the country.
          </p>
        </div>
      </div>
  
      <!-- Reach and Approach -->
      <div class="bg-white py-16">
        <div class="container mx-auto px-4">
          <h2 class="text-3xl font-bold text-center text-gray-800 mb-12">Our Reach and Approach</h2>
          
          <div class="grid md:grid-cols-2 gap-8">
            <!-- Network Card -->
            <div class="bg-gray-50 rounded-lg p-8 shadow-lg">
              <h3 class="text-2xl font-semibold text-gray-800 mb-4">Leveraging Home Glory Joy Ministries' Network</h3>
              <p class="text-gray-600 mb-4">With over 3,000 churches reaching more than 3 million people, we engage communities directly through:</p>
              <ul class="space-y-2">
                <li class="flex items-center">
                  <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
                  </svg>
                  Disseminating information
                </li>
                <li class="flex items-center">
                  <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
                  </svg>
                  Workshops and training
                </li>
                <li class="flex items-center">
                  <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
                  </svg>
                  Community mobilization
                </li>
              </ul>
            </div>
  
            <!-- SACCOs Card -->
            <div class="bg-gray-50 rounded-lg p-8 shadow-lg">
              <h3 class="text-2xl font-semibold text-gray-800 mb-4">Partnering with SACCOs</h3>
              <ul class="space-y-2">
                <li class="flex items-center">
                  <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
                  </svg>
                  Access to financing
                </li>
                <li class="flex items-center">
                  <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
                  </svg>
                  Affordable payment plans
                </li>
                <li class="flex items-center">
                  <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
                  </svg>
                  SACCO integration opportunities
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
  
      <!-- Offerings Section -->
      <div class="container mx-auto px-4 py-16">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-12">What We Offer</h2>
        
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <!-- Offering Cards -->
          <div v-for="(offering, index) in offerings" :key="index" 
               class="bg-white rounded-lg p-6 shadow-lg hover:shadow-xl transition-shadow duration-300">
            <h3 class="text-xl font-semibold text-gray-800 mb-4">{{ offering.title }}</h3>
            <ul class="space-y-2">
              <li v-for="(item, i) in offering.items" :key="i" 
                  class="flex items-center text-gray-600">
                <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
                </svg>
                {{ item }}
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  const offerings = [
    {
      title: "Training and Skill Development",
      items: ["Health and Wellness Education", "Modern Farming Techniques", "Fractal Architecture"]
    },
    {
      title: "Economic Empowerment",
      items: ["Airbnb Opportunities", "Farm-to-Table Ventures"]
    },
    {
      title: "Sustainable Development",
      items: ["Alternative to carbon credit schemes", "Land potential maximization"]
    },
    {
      title: "Holistic Healing",
      items: ["Frequency-based therapies", "Natural healing methods"]
    },
    {
      title: "Cultural Revival",
      items: ["Traditional African practices", "Modern context education"]
    }
  ]
  </script>
  