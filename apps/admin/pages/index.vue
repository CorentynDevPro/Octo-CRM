<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold text-gray-900">Admin Panel</h1>
    <p class="text-gray-500 mt-2">Manage organizations, users, plans, and system settings.</p>
    <div class="mt-6 grid grid-cols-2 gap-4">
      <NuxtLink to="/admin/organizations" class="card hover:shadow-md transition-shadow">
        <h2 class="font-semibold">Organizations</h2>
        <p class="text-sm text-gray-500 mt-1">Manage all tenant organizations</p>
      </NuxtLink>
      <NuxtLink to="/admin/users" class="card hover:shadow-md transition-shadow">
        <h2 class="font-semibold">Users</h2>
        <p class="text-sm text-gray-500 mt-1">Manage all users system-wide</p>
      </NuxtLink>
    </div>
  </div>
</template>
