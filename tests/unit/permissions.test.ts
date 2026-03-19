import { describe, it, expect } from 'vitest'
import { hasPermission, hasRole, hasAnyPermission } from '../../modules/permissions/guards/auth.guard'

const ctx = {
  userId: 'user-1',
  organizationId: 'org-1',
  role: 'ADMIN',
  permissions: ['leads:read', 'leads:create', 'deals:read'],
}

describe('auth.guard', () => {
  it('hasPermission returns true for granted permission', () => {
    expect(hasPermission(ctx, 'leads:read')).toBe(true)
  })
  it('hasPermission returns false for missing permission', () => {
    expect(hasPermission(ctx, 'users:delete')).toBe(false)
  })
  it('hasRole returns true for matching role', () => {
    expect(hasRole(ctx, 'ADMIN')).toBe(true)
  })
  it('hasRole returns false for non-matching role', () => {
    expect(hasRole(ctx, 'VIEWER')).toBe(false)
  })
  it('hasAnyPermission returns true if any permission matches', () => {
    expect(hasAnyPermission(ctx, 'users:delete', 'leads:read')).toBe(true)
  })
  it('hasAnyPermission returns false if no permission matches', () => {
    expect(hasAnyPermission(ctx, 'admin:access', 'settings:manage')).toBe(false)
  })
})
