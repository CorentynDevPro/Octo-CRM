
import type { Permission } from '@octo-crm/constants'

/** Minimal permissions composable — expects user permissions to be provided */
export function usePermissions(userPermissions: () => Permission[]) {
  function can(permission: Permission): boolean {
    return userPermissions().includes(permission)
  }

  function canAny(...permissions: Permission[]): boolean {
    return permissions.some((p) => can(p))
  }

  function canAll(...permissions: Permission[]): boolean {
    return permissions.every((p) => can(p))
  }

  return { can, canAny, canAll }
}
