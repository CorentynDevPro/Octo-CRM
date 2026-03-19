export default defineNuxtRouteMiddleware((to) => {
  const publicRoutes = ['/login', '/register', '/forgot-password']
  if (publicRoutes.includes(to.path)) return

  const { token } = useAuthStore()
  if (!token) {
    return navigateTo('/login')
  }
})
