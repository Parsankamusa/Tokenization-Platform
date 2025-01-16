import { ref } from 'vue'

export function useRevenue() {
  const totalRevenue = ref(0)
  const userShare = ref(0)
  const nextDistribution = ref('2024-01-01')
  const distributionHistory = ref([
    {
      id: 1,
      date: '2023-12-01',
      amount: 5000
    },
    {
      id: 2,
      date: '2023-11-01',
      amount: 4500
    }
  ])

  return {
    totalRevenue,
    userShare,
    nextDistribution,
    distributionHistory
  }
}
