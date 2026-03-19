import type { BaseEntity } from '@octo-crm/types'

export interface Report extends BaseEntity {
  organizationId: string
  createdById: string
  name: string
  description: string | null
  reportType: string
  config: Record<string, unknown>
  isPublic: boolean
  schedule: Record<string, unknown> | null
  lastRunAt: Date | null
}
