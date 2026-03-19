import type { BaseEntity } from '@octo-crm/types'
import { UserRole, UserStatus } from '@octo-crm/types'

export interface User extends BaseEntity {
  organizationId: string
  email: string
  firstName: string
  lastName: string
  phone: string | null
  avatarUrl: string | null
  role: UserRole
  status: UserStatus
  lastLoginAt: Date | null
  emailVerifiedAt: Date | null
  settings: Record<string, unknown>
  createdById: string
  updatedById: string
}
