export default defineNuxtRouteMiddleware((to) => {
  const publicRoutes = ['/login', '/register', '/forgot-password']
  if (publicRoutes.includes(to.path)) return

  // TODO: check auth store / cookie — redirect to /login if not authenticated
})
