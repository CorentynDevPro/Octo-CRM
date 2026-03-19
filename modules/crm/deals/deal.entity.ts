import type { BaseEntity } from '@octo-crm/types'
import { DealStatus } from '@octo-crm/types'

export interface Deal extends BaseEntity {
  organizationId: string
  pipelineId: string
  stageId: string
  ownerId: string | null
  contactId: string | null
  title: string
  value: number
  currency: string
  status: DealStatus
  probability: number
  expectedCloseDate: Date | null
  closedAt: Date | null
  lostReason: string | null
  customFields: Record<string, unknown>
  createdById: string
  updatedById: string
}
