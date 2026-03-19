import type { BaseEntity } from '@octo-crm/types'

export interface Role extends BaseEntity {
  organizationId: string | null
  name: string
  description: string | null
  isSystem: boolean
  permissions: string[]
}
