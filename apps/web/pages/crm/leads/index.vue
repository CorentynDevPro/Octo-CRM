<template>
  <div class="p-6">
    <div class="flex items-center justify-between mb-6">
      <h1 class="text-2xl font-semibold text-gray-900">Leads</h1>
      <button class="btn-primary">+ New Lead</button>
    </div>

    <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
      <div class="p-4 border-b border-gray-100">
        <input
          v-model="search"
          type="search"
          placeholder="Search leads..."
          class="input-field w-full max-w-xs"
        />
      </div>
      <div class="overflow-x-auto">
        <table class="w-full text-sm">
          <thead class="bg-gray-50 text-gray-600">
            <tr>
              <th class="px-4 py-3 text-left font-medium">Name</th>
              <th class="px-4 py-3 text-left font-medium">Email</th>
              <th class="px-4 py-3 text-left font-medium">Company</th>
              <th class="px-4 py-3 text-left font-medium">Status</th>
              <th class="px-4 py-3 text-left font-medium">Score</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-100">
            <tr v-for="lead in leads" :key="lead.id" class="hover:bg-gray-50 cursor-pointer">
              <td class="px-4 py-3 font-medium text-gray-900">{{ lead.firstName }} {{ lead.lastName }}</td>
              <td class="px-4 py-3 text-gray-600">{{ lead.email }}</td>
              <td class="px-4 py-3 text-gray-600">{{ lead.company }}</td>
              <td class="px-4 py-3">
                <span :class="statusClass(lead.status)" class="badge">{{ lead.status }}</span>
              </td>
              <td class="px-4 py-3 text-gray-600">{{ lead.score }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const search = ref('')

// Sample data — replace with API call via SDK
const leads = ref([
  { id: '1', firstName: 'Alice', lastName: 'Johnson', email: 'alice@example.com', company: 'Acme Inc', status: 'NEW', score: 72 },
  { id: '2', firstName: 'Bob',   lastName: 'Smith',   email: 'bob@example.com',   company: 'Beta Co',  status: 'CONTACTED', score: 45 },
])

function statusClass(status: string) {
  const map: Record<string, string> = {
    NEW: 'bg-blue-100 text-blue-700',
    CONTACTED: 'bg-yellow-100 text-yellow-700',
    QUALIFIED: 'bg-green-100 text-green-700',
    UNQUALIFIED: 'bg-red-100 text-red-700',
    CONVERTED: 'bg-purple-100 text-purple-700',
  }
  return map[status] ?? 'bg-gray-100 text-gray-700'
}
</script>
