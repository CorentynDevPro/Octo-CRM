import type { BaseEntity } from '@octo-crm/types'
import { LeadStatus } from '@octo-crm/types'

export interface Lead extends BaseEntity {
  organizationId: string
  ownerId: string | null
  firstName: string
  lastName: string
  email: string | null
  phone: string | null
  company: string | null
  jobTitle: string | null
  status: LeadStatus
  source: string | null
  score: number
  convertedAt: Date | null
  convertedToContactId: string | null
  notes: string | null
  customFields: Record<string, unknown>
  createdById: string
  updatedById: string
}
