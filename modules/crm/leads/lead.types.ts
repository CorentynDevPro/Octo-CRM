import type { Lead } from './lead.entity'
import type { PaginatedResponse, PaginationQuery } from '@octo-crm/types'

export interface CreateLeadInput {
  firstName: string
  lastName: string
  email?: string
  phone?: string
  company?: string
  jobTitle?: string
  source?: string
  ownerId?: string
}

export interface UpdateLeadInput extends Partial<CreateLeadInput> {
  score?: number
  status?: string
  customFields?: Record<string, unknown>
}

export interface LeadListQuery extends PaginationQuery {
  status?: string
  source?: string
  ownerId?: string
  minScore?: number
}

export type LeadListResult = PaginatedResponse<Lead>
