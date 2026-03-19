<template>
  <div class="flex h-screen bg-gray-50">
    <!-- Sidebar -->
    <aside class="w-64 bg-white border-r border-gray-200 flex flex-col">
      <div class="p-5 border-b border-gray-200">
        <span class="text-xl font-bold text-primary-700">🐙 Octo CRM</span>
      </div>
      <nav class="flex-1 p-4 space-y-1 overflow-y-auto">
        <NuxtLink
          v-for="item in navItems"
          :key="item.to"
          :to="item.to"
          class="flex items-center gap-3 px-3 py-2 rounded-lg text-sm font-medium text-gray-700 hover:bg-primary-50 hover:text-primary-700 transition-colors"
          active-class="bg-primary-50 text-primary-700"
        >
          <span>{{ item.icon }}</span>
          <span>{{ item.label }}</span>
        </NuxtLink>
      </nav>
    </aside>

    <!-- Main content -->
    <div class="flex-1 flex flex-col overflow-hidden">
      <header class="h-16 bg-white border-b border-gray-200 flex items-center justify-between px-6">
        <div />
        <div class="flex items-center gap-3">
          <span class="text-sm text-gray-600">Admin User</span>
          <div class="w-8 h-8 rounded-full bg-primary-600 text-white text-xs flex items-center justify-center font-medium">AU</div>
        </div>
      </header>
      <main class="flex-1 overflow-y-auto">
        <slot />
      </main>
    </div>
  </div>
</template>

<script setup lang="ts">
const navItems = [
  { to: '/dashboard',      icon: '📊', label: 'Dashboard' },
  { to: '/crm/leads',      icon: '🎯', label: 'Leads' },
  { to: '/crm/contacts',   icon: '👥', label: 'Contacts' },
  { to: '/crm/deals',      icon: '💼', label: 'Deals' },
  { to: '/crm/pipelines',  icon: '🔄', label: 'Pipelines' },
  { to: '/billing',        icon: '💰', label: 'Billing' },
  { to: '/inventory',      icon: '📦', label: 'Inventory' },
  { to: '/hr',             icon: '👔', label: 'HR' },
  { to: '/analytics',      icon: '📈', label: 'Analytics' },
  { to: '/settings',       icon: '⚙️',  label: 'Settings' },
]
</script>
