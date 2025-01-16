<template>
    <div class="min-h-screen bg-gray-50 dark:bg-gray-900 py-12">
      <!-- Hero Section -->
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-16">
        <h1 class="text-4xl font-bold text-center text-gray-900 dark:text-white mb-4">
          Learn How to Get Started
        </h1>
        <p class="text-xl text-center text-gray-600 dark:text-gray-400">
          Master real estate tokenization and blockchain investment
        </p>
      </div>
  
      <!-- Video Slider Section -->
      <div class="max-w-6xl mx-auto px-4 mb-16">
        <swiper
          :modules="[SwiperAutoplay, SwiperPagination, SwiperNavigation]"
          :slides-per-view="1"
          :space-between="30"
          :autoplay="{ delay: 5000 }"
          :pagination="{ clickable: true }"
          :navigation="true"
          class="rounded-xl overflow-hidden shadow-lg"
        >
          <swiper-slide v-for="video in featuredVideos" :key="video.id">
            <div class="relative aspect-video">
              <iframe
                :src="video.embedUrl"
                class="absolute inset-0 w-full h-full"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen
              ></iframe>
            </div>
          </swiper-slide>
        </swiper>
      </div>
  
      <!-- Tutorial Steps -->
      <div class="max-w-7xl mx-auto px-4 mb-16">
        <h2 class="text-3xl font-bold text-gray-900 dark:text-white mb-8">Getting Started</h2>
        
        <div class="grid md:grid-cols-3 gap-8">
          <div v-for="(tutorial, index) in tutorials" 
               :key="tutorial.id"
               class="bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden hover:shadow-xl transition-shadow"
               @click="openTutorial(tutorial)"
          >
            <div class="relative">
              <img :src="tutorial.image" :alt="tutorial.title" class="w-full h-48 object-cover"/>
              <div class="absolute top-4 left-4 bg-blue-500 text-white text-sm font-semibold px-3 py-1 rounded-full">
                Step {{ index + 1 }}
              </div>
            </div>
            
            <div class="p-6">
              <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-2">
                {{ tutorial.title }}
              </h3>
              <p class="text-gray-600 dark:text-gray-400">
                {{ tutorial.description }}
              </p>
              <button class="mt-4 text-blue-500 font-semibold flex items-center gap-2">
                Learn More
                <Icon icon="heroicons:arrow-right" class="w-5 h-5" />
              </button>
            </div>
          </div>
        </div>
      </div>
  
      <!-- FAQ Section -->
      <div class="max-w-4xl mx-auto px-4">
        <h2 class="text-3xl font-bold text-gray-900 dark:text-white mb-8">Frequently Asked Questions</h2>
        
        <div class="space-y-4">
          <div v-for="faq in faqs" 
               :key="faq.id"
               class="bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden">
            <button 
              @click="faq.isOpen = !faq.isOpen"
              class="w-full px-6 py-4 text-left flex justify-between items-center"
            >
              <span class="text-lg font-semibold text-gray-900 dark:text-white">
                {{ faq.question }}
              </span>
              <Icon 
                :icon="faq.isOpen ? 'heroicons:minus' : 'heroicons:plus'" 
                class="w-5 h-5 text-gray-500"
              />
            </button>
            
            <div v-show="faq.isOpen" 
                 class="px-6 pb-4 text-gray-600 dark:text-gray-400"
                 v-html="faq.answer"
            ></div>
          </div>
        </div>
      </div>
    </div>
  
    <!-- Tutorial Modal -->
    <div v-if="selectedTutorial" 
         class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
      <div class="bg-white dark:bg-gray-800 rounded-xl max-w-3xl w-full max-h-[90vh] overflow-y-auto">
        <div class="p-6">
          <div class="flex justify-between items-center mb-4">
            <h3 class="text-2xl font-bold text-gray-900 dark:text-white">
              {{ selectedTutorial.title }}
            </h3>
            <button @click="selectedTutorial = null">
              <Icon icon="heroicons:x-mark" class="w-6 h-6 text-gray-500" />
            </button>
          </div>
          <div v-html="selectedTutorial.content"></div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
 import { Swiper, SwiperSlide } from 'swiper/vue'
import { Autoplay, Pagination, Navigation } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/pagination'
import 'swiper/css/navigation'
  
  const selectedTutorial = ref(null)
  
  const featuredVideos = ref([
    {
      id: 1,
      embedUrl: 'https://www.youtube.com/embed/your-video-id',
      title: 'Introduction to Real Estate Tokenization'
    },
    // Add more videos
  ])
  
  const tutorials = ref([
    {
      id: 1,
      title: 'Connect Your Wallet',
      description: 'Learn how to set up and connect your digital wallet to start investing.',
      image: '/tutorial1.jpg',
      content: `
        <div class="space-y-4">
          <p>Detailed steps on wallet connection...</p>
          <ul class="list-disc pl-6">
            <li>Install MetaMask</li>
            <li>Create or import wallet</li>
            <li>Connect to our platform</li>
          </ul>
        </div>
      `
    },
    {
      id: 2,
      title: 'Buy Your First Token',
      description: 'Step-by-step guide to purchasing real estate tokens.',
      image: '/tutorial2.jpg',
      content: 'Detailed content about buying tokens...'
    },
    {
      id: 3,
      title: 'Participate in Governance',
      description: 'Learn how to vote and participate in platform decisions.',
      image: '/tutorial3.jpg',
      content: 'Detailed content about governance...'
    }
  ])
  
  const faqs = ref([
    {
      id: 1,
      question: 'What is real estate tokenization?',
      answer: 'Real estate tokenization is the process of creating digital tokens that represent ownership in a property...',
      isOpen: false
    },
    {
      id: 2,
      question: 'How do I earn returns?',
      answer: 'Returns are earned through rental income and potential property value appreciation...',
      isOpen: false
    },
    // Add more FAQs
  ])
  
  const openTutorial = (tutorial) => {
    selectedTutorial.value = tutorial
  }
  </script>
  
  <style scoped>
  .swiper {
    width: 100%;
    height: 100%;
  }
  
  .swiper-slide {
    text-align: center;
    background: #fff;
  }
  
  /* Add custom styles for Swiper navigation and pagination */
  :deep(.swiper-button-next),
  :deep(.swiper-button-prev) {
    color: white;
    background: rgba(0, 0, 0, 0.5);
    width: 40px;
    height: 40px;
    border-radius: 50%;
  }
  
  :deep(.swiper-pagination-bullet) {
    background: white;
    opacity: 0.7;
  }
  
  :deep(.swiper-pagination-bullet-active) {
    opacity: 1;
  }
  </style>
  