/** Auth guard interface — implement per framework (Fastify, Nuxt server) */
export interface AuthContext {
  userId: string
  organizationId: string
  role: string
  permissions: string[]
}

export function hasPermission(ctx: AuthContext, permission: string): boolean {
  return ctx.permissions.includes(permission)
}

export function hasRole(ctx: AuthContext, role: string): boolean {
  return ctx.role === role
}

export function hasAnyPermission(ctx: AuthContext, ...permissions: string[]): boolean {
  return permissions.some((p) => hasPermission(ctx, p))
}

export function hasAllPermissions(ctx: AuthContext, ...permissions: string[]): boolean {
  return permissions.every((p) => hasPermission(ctx, p))
}
