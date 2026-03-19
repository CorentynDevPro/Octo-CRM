import type { BaseEntity } from '@octo-crm/types'

export interface Organization extends BaseEntity {
  name: string
  slug: string
  domain: string | null
  logoUrl: string | null
  plan: string
  isActive: boolean
  settings: Record<string, unknown>
}
