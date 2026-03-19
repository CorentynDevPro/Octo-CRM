<template>
  <div class="p-6">
    <h1 class="text-2xl font-semibold text-gray-900 mb-6">Dashboard</h1>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
      <div
        v-for="stat in stats"
        :key="stat.label"
        class="bg-white rounded-xl shadow-sm border border-gray-200 p-6"
      >
        <p class="text-sm text-gray-500">{{ stat.label }}</p>
        <p class="text-3xl font-bold text-gray-900 mt-1">{{ stat.value }}</p>
        <p
          :class="stat.trend > 0 ? 'text-success-500' : 'text-danger-500'"
          class="text-sm mt-2"
        >
          {{ stat.trend > 0 ? '↑' : '↓' }} {{ Math.abs(stat.trend) }}% vs last month
        </p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const stats = [
  { label: 'Total Leads',    value: '1,284', trend: 12.5 },
  { label: 'Active Deals',   value: '342',   trend: 8.3  },
  { label: 'Revenue (MTD)',  value: '$84.2K', trend: 15.1 },
  { label: 'Contacts',       value: '5,621',  trend: -2.1 },
]
</script>
