import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import './style.css'
import App from './App.vue'
import Marketplace from './components/marketplace.vue'
import Home from './components/Home.vue'
import Governance from './components/Governance.vue'
import InvestorPortal from './components/InvestorPortal.vue'
import Learn from './components/Learn.vue'
import AboutUs from './components/AboutUs.vue'
import ContactUs from './components/ContactUs.vue'
import TokenManagement from './components/TokenManagement.vue'
import PropertyMapping from './components/PropertyMapping.vue'
import RevenueDistribution from './components/RevenueDistribution.vue'
import Dashboard from './components/Dashboard.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/home',
      name: 'Home',
      component: Home
    },
    {
      path: '/marketplace',
      name: 'Marketplace',
      component: Marketplace
    },
    {
      path: '/governance',
      name: 'Governance',
      component: Governance
    },
    {
      path: '/investor',
      name: 'InvestorPortal',
      component: InvestorPortal
    },
    {
      path: '/learn',
      name: 'Learn',
      component: Learn
    },
    {
      path: '/about-us',
      name: 'AboutUs',
      component: AboutUs
    },
    {
      path: '/contact-us',
      name: 'ContactUs',
      component: ContactUs
    },
    {
      path: '/',
      name: 'Dashboard',
      component: Dashboard
    },
    {
      path: '/tokens',
      name: 'TokenManagement',
      component: TokenManagement
    },
    {
      path: '/property',
      name: 'PropertyMapping',
      component: PropertyMapping
    },
    {
      path: '/revenue',
      name: 'RevenueDistribution',
      component: RevenueDistribution
    }
  ]
})

const app = createApp(App)
app.use(router)
app.mount('#app')
