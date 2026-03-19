<template>
  <div class="min-h-screen bg-gray-50 flex items-center justify-center">
    <div class="text-center">
      <h1 class="text-4xl font-bold text-primary-700 mb-4">🐙 Octo CRM</h1>
      <p class="text-gray-600 text-lg">Enterprise-grade open source CRM</p>
      <div class="mt-8 flex gap-4 justify-center">
        <NuxtLink to="/dashboard" class="btn-primary">Go to Dashboard</NuxtLink>
        <NuxtLink to="/crm/leads"  class="btn-outline">View Leads</NuxtLink>
      </div>
    </div>
  </div>
</template>
